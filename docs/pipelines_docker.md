We will user Docker to establish consistent environments (containers) for commonly used pipelines. We will maintain Docker images on [Docker Hub](https://hub.docker.com/orgs/zamanianlab) under the organization name 'zamanianlab'. These images can be directly loaded from Docker Hub in our CHTC submit scripts. The Dockerfiles used to create these images should be maintained in our [GitHub Docker Repo](https://github.com/zamanianlab/Docker Install). Install [Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/install/) and create a Dockerhub account to be associated with our organization Docker Hub (zamanianlab).

### Building Docker Images

1. Create a lab Docker Hub repo (zamanianlab/{pipeline}), which is associated with a GitHub repo called {pipeline}

2. Create Dockerfile and auxillary (e.g., yaml) files in a folder with the repo name in the [Docker GitHub repo](https://github.com/zamanianlab/Docker Install).

    The Dockerfile provides instructions to build a Docker image. In this case, we are starting with the official miniconda Docker image and then installing necessary conda packages into this image. You can search for existing Docker images on [Docker Hub](https://hub.docker.com/orgs/zamanianlab) to build on, instead of starting from scratch.

    ??? "Dockerfile"

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

    The following yml file lists `conda` packages to be installed. You can search for packages on [Anaconda cloud](https://anaconda.org/).

    ??? "conda_env.yml"

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

3. Build Docker image (provide a version number)

    ```bash
    cd [/path/to/Dockerfile]
    docker build -t zamanianlab/chtc-rnaseq:v4 .
    ```

4. Test Docker image interactively

    ```bash
  	docker run -it --rm=TRUE zamanianlab/chtc-rnaseq:v4 /bin/bash
  	ctrl+D to exit
    ```

5. Push Docker image to Docker Hub

    ```bash
    docker push zamanianlab/chtc-rnaseq:v4
    ```

    ??? "Some useful Docker commands"

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

### Testing and Using Docker Pipelines Locally

You may want to test a pipeline or Docker environment locally using subsampled data before pushing to GitHub/Dockerhub for deployment on CHTC with large datasets.

1. Run Docker container (established or in development) locally

    ??? "Running a Docker container (with or without local file mounting)"

        ```bash
          # example with no access to folders on your computer
          docker run -it --rm=TRUE zamanianlab/chtc-rnaseq:v2 /bin/bash

          # example that mounts a local folder (~/Desktop/wrmxpress_dev) in Docker (mapped to /home)
          docker run -it -v ~/Desktop/wrmxpress_dev:/home --rm=TRUE zamanianlab/wrmxpress /bin/bash
        ```

2. Simulate the steps in your submit scripts

    ??? "Running commands in local Docker container"

        ```bash
        # set home to working directory
        export HOME=$PWD

        # make input, work, and output directories for nextflow
        mkdir input work outputs

        # clone GitHub repo that contains pipeline in development
        git clone https://github.com/zamanianlab/Core_RNAseq-nf.git

        # option A: access files through a locally mounted drive

        # option B: transfer sub-sampled files from CHTC staging or elsewhere into your input folder
        scp -r {net-id}@transfer.chtc.wisc.edu:/staging/groups/zamanian_group/subsampled/191211_AHMMC5DMXX.tar input

        # run your pipeline commands, example nextflow command (chtc-local.config modified for local hardware specs)
        nextflow run Core_RNAseq-nf/WB-pe.nf -w work -c Core_RNAseq-nf/chtc-local.config --dir "191211_AHMMC5DMXX" --release "WBPS14" --species "brugia_malayi" --prjn "PRJNA10729" --rlen "150"
        ```

3. Make changes to your GitHub pipeline and/or Docker environment and re-run commands until the pipeline is behaving as expected.

4. `push` final changes to GitHub and/or Dockerhub

