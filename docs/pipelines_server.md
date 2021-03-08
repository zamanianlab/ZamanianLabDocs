# Server Pipelines

Our lab has access to powerful computing resources and support through the [Center for High-Throughput Computing (CHTC)](http://chtc.cs.wisc.edu/). Our core bioinformatics and image processing pipelines will be deployed through CHTC servers. All pipelines will be maintained on [GitHub](http://www.github.com) and associated with [Docker](http://www.docker.com) environments to ensure reproducibility. Many of our pipelines will use [Nextflow](https://www.nextflow.io/).

In general, pipelines will be run in three steps:

  - **Staging:** input files will be transferred to the CHTC server from lab storage
  - **Pipeline:** files will be processed using established pipelines
  - **Output:** desired outputs will be transferred from the CHTC server to lab storage

## A. Center for High-throughput Computing (CHTC)

Consult official [CHTC](http://chtc.cs.wisc.edu/) and [HTCondor](https://research.cs.wisc.edu/htcondor/) documentation before getting started. Register for an account using this [form](http://chtc.cs.wisc.edu/form.shtml).


<img src="../images/chtc_flowchart.png" width="100%">


### The HTC System

1. Execute (Compute) nodes

    The CHTC has an extensive set of execute nodes. To establish priority access for certain pipelines, our lab has secured a prioritized node that can be accessed on-demand using a designated flag.

    - Typical nodes: 20 cores, 128 GB RAM
    - [High-memory nodes](http://chtc.cs.wisc.edu/high-memory-jobs.shtml): e.g., 80 cores, 4 TB RAM
    - Dedicated lab node: 40 cores (80 hyperthreading), 512 GB RAM, 3.8 TB HD  

2. Submit nodes

    Jobs on the CHTC are deployed from submit nodes. You can `ssh` into our assigned submit node (submit2) to run and monitor jobs using your UW net-id and password.

  	`ssh {net-id}@submit2.chtc.wisc.edu`

    **Note:** If you correctly updated your `~/.bash_profile` by following the [macOS environment setup instructions](comp_local.md), then you can use the simple `submit` to `ssh` into the node.

3. File system

    Each net-id is associated with a `home` folder, where we manage job submission scripts. Our lab also has a shared `staging` folder, for transfer of large files in and out of the CHTC system. The CHTC does not use a shared file system, but you can request the storage you need for any given job.

      ```
      /
      ├── home/{net-id}/                    [quota: 20 GB, submit script dir]
      └── staging/groups/zamanian_group/    [quota: 1 TB | 100 files]
          └── input/                        [input dir: unprocessed (raw) data]
          └── output/                       [output dir: processed job outputs]
          └── WBP.tar.gz                    [permanent storage of WBP data]
      ```



### Deploying Pipelines

1. **Staging -** transfer input data for processing (ResearchDrive -> CHTC)

    In almost all cases, you will [directly transfer](http://chtc.cs.wisc.edu/transfer-data-researchdrive.shtml) your input data from ResearchDrive to the CHTC staging input folder. Most raw data on ResearchDrive is unarchived and uncompressed. However, our pipelines expect a single archived folder (.tar) as input and will deliver a single archived folder as output. Use the command below to transfer an unarchived folder on ResearchDrive to CHTC input and have it archived on arrival.

    <details>
    <summary> ResearchDrive -> CHTC transfer of unarchived raw data folder (archived on arrival)</summary>
    ```bash
    # Log into transfer server and navigate to staging input dir
    ssh {net-id}@transfer.chtc.wisc.edu
    cd /staging/groups/zamanian_group/input/

    # Example of transferring sequencing data
    smbclient -k //research.drive.wisc.edu/mzamanian/ -D "UWBC-Dropbox/Bioinformatics Resource Center" -Tc 201105_AHLVWJDSXY.tar "201105_AHLVWJDSXY"

    # Example of transferring ImageXpress data
    smbclient -k //research.drive.wisc.edu/mzamanian/ -D "ImageXpress/raw" -Tc 20201118-p01-MZ_172.tar "20201118-p01-MZ_172.tar"

    ```
    </details>

    <details>
    <summary> ResearchDrive -> CHTC transfer of unarchived metadata folder (archived on arrival)</summary>
    ```bash
    # Log into transfer server and navigate to staging metadata dir
    ssh {net-id}@transfer.chtc.wisc.edu
    cd /staging/groups/zamanian_group/metadata/

    # Example of transferring ImageXpress metadata
    smbclient -k //research.drive.wisc.edu/mzamanian/ -D "ImageXpress/metadata" -Tc 20201118-p01-MZ_172.tar "20201118-p01-MZ_172"

    ```
    </details>

    **Note:** If you correctly updated your `~/.bash_profile` by following the [macOS environment setup instructions](comp_local.md), then you can use the simple `transfer` to `ssh` into the node.

    For ImageXpress data, an entire experiment may include >10 plates that will take hours to days to transfer. To facilitate batch transfers, we have included two scripts in the `input/` and `metadata/` directories of `/staging/groups/zamanian_group/` called `transfer_images.sh` and `transfer_metadata.sh`. These scripts reference the text file `/staging/groups/zamanian_group/plates.txt` and will loop through the plate names, sequentially transferring them from ResearchDrive and archiving them upon arrival. Edit `plates.txt` in the terminal using `vi` or `nano`, or edit the file locally and then upload it to `/staging/groups/zamanian_group/input/` (be sure to include a single plate name on each line with a blank line at the end of the file.) Run `sh transfer_metadata.sh` and `sh transfer_images.sh` to initate the transfers.

    Both of these scripts will require a continuous ssh connection while they transfer. Transferring metadata will only take a few minutes, but transferring multiple plates of images will take several hours. The transfer process can be sent to the background (allowing the user to close the ssh connection) by using the `screen` tool. There are a number of helpful tutorials online, but a few sample commands are shown below.

    <details>
    <summary> Background transfer using `screen`</summary>
    ```bash
    # Log into transfer server and navigate to staging input dir
    ssh {net-id}@transfer.chtc.wisc.edu
    cd /staging/groups/zamanian_group/input/

    # Start a screen named 'transfer'
    screen -S transfer

    # Initiate the transfer
    sh transfer_images.sh

    # Detach from the screen by pressing Ctrl+a and then d
    # Reattach to the screen
    screen -r transfer

    # Close the screen
    exit
    ```
    </details>

    Rarely, you may have to transfer data from other sources to CHTC staging input. You can run simple transfer commands from your computer:

    `scp [dir] {net-id}@transfer.chtc.wisc.edu:/staging/groups/zamanian_group/input/`

2. **Pipeline -** Submit and manage CHTC jobs

    CHTC uses HTCondor for job scheduling. Submission files should follow lab conventions and be consistent with the CHTC documentation. An example submit script with annotations is shown below. This submit script (Core_RNAseq-nf.sub) loads a pre-defined [Docker environment](https://hub.docker.com/repository/docker/zamanianlab/chtc-rnaseq) and runs a bash executable script (Core_RNAseq-nf.sh) with defined arguments on the execute node. Other options define log files, resource requirements , and transfer of files in/out of `home`. Avoid transferring large files in/out of `home`! We transfer in our large data through `/staging/groups/zamanian_group/input/` and we move job output files to `/staging/groups/zamanian_group/output/` within the job executable script to avoid their transfer to `home` upon job completion. The only files that should be transferred back to `home` are small log files.

    <details>
    <summary> Example CHTC job submission scripts (.sub / .sh)</summary>

    === "Core_RNAseq-nf.sub"

        ``` linenums="1"
        # Core_RNAseq-nf.sub
        # Input data in /staging/{net-id}/input/$(dir)
        # Run: condor_submit Core_RNAseq-nf.sub dir=191211_AHMMC5DMXX script=Core_RNAseq-nf.sh

        # request Zamanian Lab server
        Accounting_Group = PathobiologicalSciences_Zamanian

        # load docker image; request execute server with staging
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

    === "Core_RNAseq-nf.sh"

        ```bash linenums="1"
        #!/bin/bash

        # set home () and mk dirs
        export HOME=$PWD
        mkdir input work output

        # echo core, thread, and memory
        echo "CPU threads: $(grep -c processor /proc/cpuinfo)"
        grep 'cpu cores' /proc/cpuinfo | uniq
        echo $(free -g)

        # transfer input data from staging ($1 is ${dir} from args)
        cp -r /staging/groups/zamanian_group/input/$1.tar input
        cd input && tar -xvf $1.tar && rm $1.tar && mv */*/* $1 && cd ..

        # clone nextflow git repo
        git clone https://github.com/zamanianlab/Core_RNAseq-nf.git

        # run nextflow command
        export NXF_OPTS='-Xms1g -Xmx8g'
        nextflow run Core_RNAseq-nf/WB-pe.nf -w work -c Core_RNAseq-nf/chtc.config --dir $1\
           --star --qc --release "WBPS15" --species "brugia_malayi" --prjn "PRJNA10729" --rlen "150"

        # rm files you don't want transferred back to /home/{net-id}
        rm -r work input

        # tar output folder and delete it
        cd output && tar -cvf $1.tar $1 && rm -r $1 && cd ..

        # remove staging output tar if there from previous run
        rm -f /staging/groups/zamanian_group/output/$1.tar

        # mv large output files to staging output folder; avoid their transfer back to /home/{net-id}
        mv output/$1.tar /staging/groups/zamanian_group/output/

        ```
    </details>


    Log into submit node to submit a job,

    ```bash
    ssh {net-id}@submit2.chtc.wisc.edu

    condor_submit Core_RNAseq-nf.sub dir=191211_AHMMC5DMXX script=Core_RNAseq-nf.sh
    ```  

    <details>
      <summary>Other useful commands for monitoring and managing jobs (Click to Expand)</summary>
        ``` bash
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


3. **Output -** transfer output data (CHTC -> ResearchDrive)

    To transfer your job output folder from the CHTC staging output directory to Research Drive:

    <details>
    <summary> CHTC -> ResearchDrive transfer (Click to Expand)</summary>
    ``` bash
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
    smb: \> mput 20201119-p01-MZ_200.tar

    ```
    </details>

    Output data can also be transferred to your computer directly from the CHTC (as shown in the command below), or from the mounted ResearchDrive if the data have already been moved to ResearchDrive.

    `scp -r {net-id}@transfer.chtc.wisc.edu:/staging/groups/zamanian_group/output/[dir] .`


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

    The following yml file lists `conda` packages to be installed. You can search for packages on [Anaconda cloud](https://anaconda.org/).

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

    ```bash
    cd [/path/to/Dockerfile]
    docker build -t zamanianlab/chtc-rnaseq .
    ```

4. Test Docker image interactively

    ```bash
  	docker run -it --rm=TRUE zamanianlab/chtc-rnaseq /bin/bash
  	ctrl+D to exit
    ```

5. Push Docker image to Docker Hub

    ```bash
    docker push zamanianlab/chtc-rnaseq
    ```

    <details>
      <summary>Some useful Docker commands (Click to Expand)</summary>
        ```bash
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

1. First, subsample your data into a more manageable size and store it in the staging `subsampled` folder.


2. Run Docker container locally

    ```bash
    docker run -it --rm=TRUE zamanianlab/chtc-rnaseq:v2 /bin/bash
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
    scp -r {net-id}@transfer.chtc.wisc.edu:/staging/groups/zamanian_group/subsampled/191211_AHMMC5DMXX.tar input

    # run your pipeline commands

    # example of a nextflow command using chtc-local.config matched to your hardware specs
    nextflow run Core_RNAseq-nf/WB-pe.nf -w work -c Core_RNAseq-nf/chtc-local.config --dir "191211_AHMMC5DMXX" --release "WBPS14" --species "brugia_malayi" --prjn "PRJNA10729" --rlen "150"
    ```
    </details>

4. Make changes to your GitHub pipeline, `push` those changes to GitHub, `pull` those changes to your local container, and re-run the Nextflow command until the pipeline is behaving as expected.
