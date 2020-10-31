# Server Pipelines

Our lab has access to powerful computing resources and support through the [Center for High-Throughput Computing (CHTC)](http://chtc.cs.wisc.edu/). Our core bioinformatics and image processing pipelines will be deployed through CHTC servers. All pipelines will be maintained on [GitHub](http://www.github.com) and associated with [Docker](http://www.docker.com) environments to ensure reproducibility. Many of our pipelines will use [Nextflow](https://www.nextflow.io/).

In general, pipelines will be run in three steps:

  - **Staging:** input files will be transferred to the CHTC server from lab storage
  - **Pipeline:** files will be processed using established pipelines
  - **Output:** desired outputs will be transferred from the CHTC server to lab storage

## A. Center for High-throughput Computing (CHTC)

Consult official [CHTC](http://chtc.cs.wisc.edu/) and [HTCondor](https://research.cs.wisc.edu/htcondor/) documentation before getting started. Register for an account using this [form](http://chtc.cs.wisc.edu/form.shtml).

### The HTC System

1. Compute Nodes

    The CHTC has an extensive set of execute nodes that can be accessed for free. To establish priority access for certain pipelines, our lab has secured a prioritized node that can be accessed on-demand using a designated flag.

    - Typical nodes: 20 cores, 128 GB RAM
    - [High-memory nodes](http://chtc.cs.wisc.edu/high-memory-jobs.shtml): e.g., 80 cores, 4 TB RAM
    - Dedicated lab node: 40 cores (80 hyperthreading), 512 GB RAM, 3.8 TB HD  
        [ Maximum request on lab node: CPU = 80; Memory = 500GB, Disk =  3500GB ]

2. Submit nodes

    Jobs on the CHTC are deployed from submit nodes. You can `ssh` into your assigned submit node to run and monitor jobs using your UW net-id and password.

  	`ssh {net-id}@submit3.chtc.wisc.edu`

3. File system

    The CHTC does not use a shared file system, but you can request the storage you need for any given job. Each net-id (and our lab as a whole) will is associated with a `home` folder, where we manage job submission scripts. Our lab also has a shared `staging` folder, for transfer of large files in and out of the CHTC system.

      ```
      /
      ├── home/{net-id}/                    [quota: 20 GB, submit script dir]
      └── /staging/groups/zamanian_group/   [quota: 1 TB | 100 files]
          └── input/                        [input dir: unprocessed (raw) data]
          └── output/                       [output dir: processed job outputs]
          └── WBP/                          [permanent storage of WBP data]
      ```

### Deploying Pipelines

1. Staging input data for processing

    Transfer a single folder containing your job input files to the staging input directory. You can run transfer commands from your computer or from the BRC server (sequencing data).

    `scp [dir] {net-id}@transfer.chtc.wisc.edu:/staging/groups/zamanian_group/input/`

    More typically, you will be [transferring directly](http://chtc.cs.wisc.edu/transfer-data-researchdrive.shtml) between ResearchDrive and CHTC. To transfer a directory from ResearchDrive to the CHTC staging input folder:

    <details>
    <summary> ResearchDrive -> CHTC transfer (Click to Expand)</summary>
    ```
    # log into CHTC staging server and navigate to input folder
    ssh {net-id}@transfer.chtc.wisc.edu
    cd /staging/groups/zamanian_group/input/

    # connect to lab ResearchDrive
    smbclient -k //research.drive.wisc.edu/mzamanian

    # turn off prompting and turn on recursive
    smb: \> prompt
    smb: \> recurse

    # navigate to ResearchDrive dir with raw data (example)
    smb: \> cd /ImageXpress/raw/

    # transfer raw data folder (example)
    smb: \> mget 20200922-p01-NJW_114

    ```
    </details>

2. Creating job submit scripts

    CHTC uses HTCondor for job scheduling. Submission files (.sub) should follow lab conventions and be consistent with the CHTC documentation. An example submit script with annotations is shown below. This submit script (Core_RNAseq-nf.sub) loads a pre-defined [Docker environment](https://hub.docker.com/repository/docker/zamanianlab/chtc-rnaseq) and runs a bash executable script (Core_RNAseq-nf.sh) with defined arguments (staged data location).

    Other options define standard log files, resource requirements (cpu, memory, and hard disk), and transfer of files in/out of `home`. Avoid transferring large files in/out of `home`! We transfer in our large data through `/staging/{net-id}/input/` and we move job output files to `/staging/{net-id}/output/` within the job executable script to avoid their transfer to `home` upon job completion. The only files that should be transferred back to `home` are small log files.

    <details>
      <summary>Core_RNAseq-nf.sub (Click to Expand)</summary>
      ```
      # Core_RNAseq-nf.sub
      # Input data in /staging/{net-id}/input/$(dir)
      # Run: condor_submit Core_RNAseq-nf.sub dir=191211_AHMMC5DMXX script=Core_RNAseq-nf.sh

      # request Zamanian Lab server
      Accounting_Group = PathobiologicalSciences_Zamanian

      # load docker image; request execute server with large data staging
      universe = docker
      docker_image = zamanianlab/chtc-rnaseq:v1
      Requirements = (Target.HasCHTCStaging == true)

      # executable (/home/{net-id}/) and arguments
      executable = $(script)
      arguments = $(dir)

      # log, error, and output files
      log = $(dir)_$(Cluster)_$(Process).log
      error = $(dir)_$(Cluster)_$(Process).err
      output = $(dir)_$(Cluster)_$(Process).out

      # transfer files in-out of /home/{net-id}/
      transfer_input_files =
      should_transfer_files = YES
      when_to_transfer_output = ON_EXIT

      # memory, disk and CPU requests
      request_cpus = 80
      request_memory = 500GB
      request_disk = 1500GB

      # submit 1 job
      queue 1
      ### END

      ```
    </details>

    The submit script runs the annotated bash script below on the execute server. This pipeline creates `input`, `work`, and `output` dirs in the loaded Docker environment. It transfers the input data from `staging` into `input`, clones a GitHub repo (Nextflow pipeline), and runs a Nextflow command. Nextflow uses `work` for intermediary processing and spits out any files we have marked for retention into `output`, which gets transferred back to `staging`. `input` and `work` are deleted before job completion.

    <details>
      <summary>Core_RNAseq-nf.sh (Click to Expand)</summary>
      ```
      #!/bin/bash

      # set home () and mk dirs
      export HOME=$PWD
      mkdir input work output

      # echo core, thread, and memory
      echo "CPU threads: $(grep -c processor /proc/cpuinfo)"
      grep 'cpu cores' /proc/cpuinfo | uniq
      echo $(free -g)

      # transfer input data from staging ($1 is ${dir} from args)
      cp -r /staging/groups/zamanian_group/input/$1 input

      # clone nextflow git repo
      git clone https://github.com/zamanianlab/Core_RNAseq-nf.git

      # run nextflow
      export NXF_OPTS='-Xms1g -Xmx8g'
      nextflow run Core_RNAseq-nf/WB-pe.nf -w work -c Core_RNAseq-nf/chtc.config \
        --dir $1 --star --release "WBPS14" --species "brugia_malayi" --prjn "PRJNA10729" --rlen "150"

      # rm files you don't want transferred back to /home/{net-id}
      rm -r work
      rm -r input

      # remove staging output folder if there from previous run
      rm -r /staging/groups/zamanian_group/output/$1

      # mv large output files to staging output folder; avoid their transfer back to /home/{net-id}
      mv output/$1/ /staging/groups/zamanian_group/output/
      ```
    </details>

3. Submitting and managing jobs

    Submit job from submit node using `condor_submit`,

    `condor_submit Core_RNAseq-nf.sub dir=191211_AHMMC5DMXX script=Core_RNAseq-nf.sh`

    <details>
      <summary>Other useful commands for monitoring and managing jobs (Click to Expand)</summary>
        ```
        # check on job status
          condor_q

        # remove a specific job
          condor_rm [job id]

        # remove all jobs for user
          condor_rm $USER

        # interative shell to running job on remote machine
          condor_ssh_to_job [job id]
          exit
        ```
    </details>


4. Transferring output data

    To transfer your job output folder from the CHTC staging output directory to your local computer.

    `scp -r {net-id}@transfer.chtc.wisc.edu:/staging/groups/zamanian_group/output/[dir] .`

    To transfer your job output directly from the CHTC staging output directory to ResearchDrive.

    <details>
    <summary> CHTC -> ResearchDrive transfer (Click to Expand)</summary>
    ```
    # log into CHTC staging server and navigate to output folder
    ssh {net-id}@transfer.chtc.wisc.edu
    cd /staging/groups/zamanian_group/output/

    # connect to lab ResearchDrive
    smbclient -k //research.drive.wisc.edu/mzamanian

    # turn off prompting and turn on recursive
    smb: \> prompt
    smb: \> recurse

    # navigate to ResearchDrive dir for processed data (example)
    smb: \> cd /ImageXpress/proc/

    # transfer output data folder (example)
    smb: \> mput 20200922-p01-NJW_114

    ```
    </details>


## B. Docker

We will user Docker to establish consistent environments (containers) for our established pipelines. We will maintain Docker images on [Docker Hub](https://hub.docker.com/orgs/zamanianlab) under the organization name 'zamanianlab'. These images can be directly loaded from Docker Hub in our CHTC submit scripts. The Dockerfiles used to create these images should be maintained in our [GitHub Docker Repo](https://github.com/zamanianlab/Docker Install). Install [Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/install/) and create a Dockerhub account to be associated with our organization Docker Hub (zamanianlab).

### Building Docker Images

1. Create a lab Docker Hub repo (e.g., zamanianlab/chtc-rnaseq)

2. Create Dockerfile and auxillary (e.g., yaml) files in a folder with the repo name in the [Docker GitHub repo](https://github.com/zamanianlab/Docker Install).

    The Dockerfile provides instructions to build a Docker image. In this case, we are starting with the official miniconda Docker image and then installing necessary conda packages into this image. You can search for existing Docker images on [Docker Hub](https://hub.docker.com/orgs/zamanianlab) to build on, instead of starting from scratch.

    <details>
      <summary>Dockerfile (Click to Expand)</summary>
      ```
      FROM continuumio/miniconda3
      MAINTAINER mzamanian@wisc.edu

      # install (nf tracing)
      RUN apt-get update && apt-get install -y procps

      # install conda packages
      COPY conda_env.yml .
      RUN \
         conda env update -n root -f conda_env.yml \
      && conda clean -a
      ```
    </details>

    yml file containing `conda` packages to be installed. You can search for packages on [Anaconda cloud](https://anaconda.org/).

    <details>
      <summary>conda_env.yml (Click to Expand)</summary>
      ```
      conda_env.yaml
        name: rnaseq-nf

        channels:
          - bioconda
          - conda-forge
          - defaults

        dependencies:
          - python=3.8.5
          - nextflow=20.07.1
          - bwa=0.7.17
          - hisat2=2.2.1
          - stringtie=2.1.2
          - fastqc=0.11.9
          - multiQC=1.9
          - fastp=0.20.1
          - bedtools=2.29.2
          - bedops=2.4.39
          - sambamba=0.7.0
          - samtools=1.9
          - picard=2.20.6
          - bcftools=1.9
          - snpeff=4.3.1t
          - mrbayes=3.2.7
          - trimal=1.4.1
          - mafft=7.471
          - muscle=3.8.1551
          - seqtk=1.3
          - raxml=8.2.12
          - htseq=0.12.4
          - mirdeep2=2.0.1.2
      ```
    </details>

3. Build Docker image

    ```
    cd [/path/to/Dockerfile]
    docker build -t zamanianlab/chtc-rnaseq .
    ```

4. Test Docker image interactively

    ```
  	docker run -it --rm=TRUE zamanianlab/chtc-rnaseq /bin/bash
  	ctrl+D to exit
    ```

5. Push Docker image to Docker Hub

    ```
    docker push zamanianlab/chtc-rnaseq
    ```

    <details>
      <summary>Some useful Docker commands (Click to Expand)</summary>
        ```
        # list docker images
          docker image ls (= docker images)

        # remove images
          docker rmi [image]

        ## remove all docker containers
        # run first because images are attached to containers
          docker rm -f $(docker ps -a -q)
        # remove every Docker image
          docker rmi -f $(docker images -q)
        ```
    </details>

### Testing Docker Pipelines

Before deploying a new pipeline on large datasets, test the pipeline using subsampled data. You can test locally with subsampled data, on the CHTC server with subsampled data, and finally, run the pipeline on the CHTC server with your full dataset. An example is provided below, using RNAseq data.

1. First, subsample your data:

    ```
    ...
    ```

2. Run Docker container locally

    ```
    docker run -it --rm=TRUE zamanianlab/chtc-rnaseq /bin/bash
    ```

3. Simulate the steps in your submit scripts

    <details>
    <summary>Running commands in local Docker container (Click to Expand)</summary>
    ```
    # set home to working directory
    export HOME=$PWD

    # make input, work, and output directories for nextflow
    mkdir input work outputs

    # clone GitHub repo that contains pipeline in development
    git clone https://github.com/zamanianlab/Core_RNAseq-nf.git

    # transfer sub-sampled files from CHTC staging into your input folder
    scp -r mzamanian@transfer.chtc.wisc.edu:/staging/mzamanian/input/191211_AHMMC5DMXX/ input

    # run nextflow command using chtc-local.config matched to your hardware specs
    nextflow run Core_RNAseq-nf/WB-pe.nf -w work -c Core_RNAseq-nf/chtc-local.config --dir "191211_AHMMC5DMXX" --release "WBPS14" --species "brugia_malayi" --prjn "PRJNA10729" --rlen "150"
    ```
    </details>

4. Make changes to your GitHub pipeline, `push` those changes to GitHub, `pull` those changes to your local container, and re-run the Nextflow command until the pipeline is behaving as expected.
