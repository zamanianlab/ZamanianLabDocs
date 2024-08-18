## CHTC Overview

Our lab has access to powerful computing resources and support through the [Center for High-Throughput Computing (CHTC)](https://chtc.cs.wisc.edu/). Our core bioinformatics and image processing pipelines will be deployed through CHTC servers. All pipelines will be maintained on [GitHub](https://www.github.com) and associated with [Docker](https://www.docker.com) environments to ensure reproducibility. Many of our pipelines will use [Nextflow](https://www.nextflow.io/). Consult official [CHTC](https://chtc.cs.wisc.edu/) documentation before getting started. 

Register for an account using this [form](https://chtc.cs.wisc.edu/uw-research-computing/form) to access CHTC and our prioritized lab server node.

- **Execute (Compute) nodes:** The CHTC has an extensive set of execute nodes. Our lab has a prioritized node that can be accessed on-demand using a designated flag.
    
    ??? example "CHTC Compute Nodes"
        - Dedicated lab node: 40 cores (80 hyperthreading), 512 GB RAM, 3.8 TB HD  
        - Typical nodes: 20 cores, 128 GB RAM
        - [High-memory nodes](https://chtc.cs.wisc.edu/uw-research-computing/high-memory-jobs): e.g., 80 cores, 4 TB RAM
        - [GPUs](https://chtc.cs.wisc.edu/uw-research-computing/gpu-lab.html) for machine learning jobs
        
- **Submit server:** Jobs on the CHTC are deployed from submit servers. You can `ssh` into our assigned submit server (ap2002) to run and monitor jobs using your UW net-id and password. If you correctly updated your `~/.bash_profile` by following the [environment setup instructions](comp_local.md), you can use the simple `submit` to `ssh` into the node.

    ??? "Connecting to CHTC submit server"

        ```bash
        # Log into submit server
        ssh {net-id}@ap2002.chtc.wisc.edu

        # Log into submit server if you have bash profile alias setup
        submit
        ```

- **Transfer server:** While movement of smaller files and scripts to CHTC be handled in a number of ways, the transfer of large files to [CHTC Staging](https://chtc.cs.wisc.edu/uw-research-computing/file-avail-largedata) should use the dedicated transfer server.

    ??? "Connecting to CHTC transfer server"

        ```bash
        # Log into submit server
        ssh {net-id}@transfer.chtc.wisc.edu

        # Log into transfer server if you have bash profile alias setup
        transfer
        ```

- **File system:** Each net-id is associated with a `home` folder, where we manage job submission scripts. We have a shared `staging` folder for transfer of large files in/out of the CHTC system. The directory structure of the CHTC is shown below.

      ```
      ├── home/{net-id}/                    [quota: 20 GB, submit script dir]
      └── staging/groups/zamanian_group/    [quota: 1 TB | 100k files]
          └── input/                        [input dir: unprocessed (raw) data]
          └── metadata/                     [metadata dir: metadata associated with input data]
          └── output/                       [output dir: processed job outputs]
      ```


## Pipelines

In general, pipelines will be run in three steps:

1. **Staging:** large input files will be transferred to CHTC Staging from UW ResearchDrive
2. **Submit:** jobs will be submitted to the CHTC to process files using established pipelines
3. **Output:** desired outputs will be transferred from CHTC to UW ResearchDrive and/or Box

<img src="../images/chtc_flowchart.png" width="100%">

### 1. Staging (ResearchDrive &rarr; CHTC)

- **Globus transfer**: [Globus](https://it.wisc.edu/it-projects/globus-research-data-management-project/) is the easiest and fastest way to transfer large input data from ResearchDrive to the CHTC staging input folder. Globus is also the most secure transfer method, and allows for transfer from any file system that has a Globus endpoint installed. Most raw data on ResearchDrive is unarchived and uncompressed. However, our pipelines expect a single archived folder (.tar) as input and will deliver a single archived folder as output. Use the workflow below to transfer an unarchived folder on ResearchDrive to CHTC input and archive it after arrival. See the [KB](https://kb.wisc.edu/researchdata/internal/page.php?id=108855) for further instructions.

    ??? example "Globus transfer"

        1. Login to the [Globus web interface](https://app.globus.org/) with your NetID
        2. If transferring from a personal computer, install and start [Globus Connect Personal](https://www.globus.org/globus-connect-personal).
        3. In the web interface, set the view to two panels using the icon on the top right.
        4. On one side of the interface, click Collection and choose the desired endpoint (`chtc#staging`, `wisc-drive-mzamanian`, or your personal computer).
        5. Choose the other endpoint for the other side of the interface.
        6. Type `/staging/groups/zamanian_group/` into the Path box of the `chtc#staging` collection and press Enter (you may be required to login with your NetID again).
        7. Navigate to the desired directories.
        8. Drag and drop files to transfer them; you will receive an email upon transfer completion.
        9. Login to the transfer server and archive the directories in staging `input/` and `metadata/` with the command `tar -cvf {plate}.tar {plate}`.
            To loop this command for several files, use: `for f in *NJW*; do tar -cvf $f.tar $f; done` (use a regular expression that will work for your folders).
        10. Delete the original, unarchived directories.

- **Command line transfer with smbclient**: It is also possible to transfer via smbclient using the terminal. The following code will also archive the data upon arrival.

    ??? "ResearchDrive -> CHTC transfer of unarchived raw data folder (archived on arrival)"

        ```bash
        # Log into transfer server and navigate to staging input dir
        ssh {net-id}@transfer.chtc.wisc.edu
        cd /staging/groups/zamanian_group/input/

        # Example of transferring sequencing data
        smbclient -k //research.drive.wisc.edu/mzamanian/ -D "UWBC-Dropbox/Bioinformatics Resource Center" -Tc 201105_AHLVWJDSXY.tar "201105_AHLVWJDSXY"

        # Example of transferring ImageXpress data
        smbclient -k //research.drive.wisc.edu/mzamanian/ -D "ImageXpress/raw" -Tc 20201118-p01-MZ_172.tar "20201118-p01-MZ_172.tar"

        ```

    ??? "ResearchDrive -> CHTC transfer of unarchived metadata folder (archived on arrival)"

        ```bash
        # Log into transfer server and navigate to staging metadata dir
        ssh {net-id}@transfer.chtc.wisc.edu
        cd /staging/groups/zamanian_group/metadata/

        # Example of transferring ImageXpress metadata
        smbclient -k //research.drive.wisc.edu/mzamanian/ -D "ImageXpress/metadata" -Tc 20201118-p01-MZ_172.tar "20201118-p01-MZ_172"

        ```

      **Note:** If you correctly updated your `~/.bash_profile` by following the [macOS environment setup instructions](comp_local.md), then you can use the simple `transfer` to `ssh` into the node.

      For ImageXpress data, an entire experiment may include >10 plates that will take hours to days to transfer. To facilitate batch transfers, we have included two scripts in the `input/` and `metadata/` directories of `/staging/groups/zamanian_group/` to help with batch transfer.

    ??? "Batch transfer via custom scripts and `screen`"

        === "Instructions"

            1. Use a terminal text editor (e.g., `vim` or `nano`) to edit the plate list in `/staging/groups/zamanian_group/input/plates.txt` such that there is a    single plate name per line. Also include a blank line at the end of the file.
            2. Use the commands `sh transfer_images.sh` (from the `input/` directory) and `sh transfer_metadata.sh` (from the `metadata/` directory) to transfer the images and metadata, respectively.
            3. Use the `screen` tool to maintain a continuous process in the background, allowing you to close your SSH session.

        === "Sample screen commands"

            ```bash linenums="1"
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

  - **Drag-and-drop transfer**

    Transferring input data should be performed with Globus or background smblient processes. However, smaller files such as metadata or auxiliary parameter files can be moved to the staging directory or one's home directory on the submit server with drag-and-drop SFTP clients such as Transmit, CyberDuck, or FileZilla.

- **Command line transfer with `scp`**

    A final option for transfer of small files is via the `scp` command:

    ??? "ResearchDrive -> CHTC transfer of unarchived metadata folder (archived on arrival)"

        ```bash
        # transfer to staging
        scp [local file] {net-id}@transfer.chtc.wisc.edu:/staging/groups/zamanian_group/input/

        # transfer to home
        scp [local file] {net-id}@ap2002.chtc.wisc.edu:/home/{net-id}
        ```

???+ danger "Warning!"

    Do not use the last two options (drag-and-drop or scp) for the transfer of many files or large files >100 MB, as these methods are unstable and can be unpredictable. For batch transfer or transfer of large files, the recommended method is Globus.

### 2. Submit (manage CHTC jobs)

CHTC uses HTCondor for job scheduling. Submission files should follow lab conventions and be consistent with the CHTC documentation. Two example submit scripts with annotations are shown below. This submit scripts (Core_RNAseq-nf.sub/wrmXpress.sub) load a pre-defined Docker environment and run a bash executable script (Core_RNAseq-nf.sh/wrmXpress.sh) with defined arguments on the execute node. Other options define log files, resource requirements, and transfer of files in/out of `home`. Large files should not be transferred in/out of `home`, but you may need to transfer auxiliary files (for example, the parameters YAML file for wrmXpress jobs). We transfer in our large data through `/staging/groups/zamanian_group/input/` and we move job output files to `/staging/groups/zamanian_group/output/` within the job executable script to avoid their transfer to `home` upon job completion. The only files that should be transferred back to `home` are small log files.


??? "Example CHTC job submission scripts (.sub / .sh)"

    === "Core_RNAseq-nf.sub"

        ```linenums="1"
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

    === "wrmXpress.sub"

        ```linenums="1"
        # Input data: /staging/groups/zamanian_group/input/${plate}.tar
        # Parameters: $HOME/${plate}.yml
        # Run: condor_submit wrmXpress.sub script=wrmXpress.sh

        # request Zamanian Lab server
        Accounting_Group = PathobiologicalSciences_Zamanian

        # load docker image; request execute server with large data staging
        universe = docker
        docker_image = zamanianlab/chtc-wrmxpress:v1
        Requirements = (Target.HasCHTCStaging == true)

        # executable (/home/{net-id}/) and arguments
        executable = $(script)
        arguments = $(plate)

        # log, error, and output files
        log = $(plate)_$(Cluster)_$(Process).log
        error = $(plate)_$(Cluster)_$(Process).err
        output = $(plate)_$(Cluster)_$(Process).out

        # transfer files in-out of /home/{net-id}/
        transfer_input_files = $(plate).yml
        should_transfer_files = YES
        when_to_transfer_output = ON_EXIT

        # memory, disk and CPU requests
        request_cpus = 1
        request_memory = 8GB
        request_disk = 10GB

        # submit a job for each directory in plate_list.txt
        queue plate from plate_list.txt
        ### END
        ```

    === "wrmXpress.sh"

        ```bash linenums="1"
        #!/bin/bash

        # set home () and mk dirs
        export HOME=$PWD
        mkdir input
        mkdir metadata
        mkdir output/
        mkdir work/

        git clone https://github.com/zamanianlab/wrmXpress.git

        # echo core, thread, and memory
        echo "CPU threads: $(grep -c processor /proc/cpuinfo)"
        grep 'cpu cores' /proc/cpuinfo | uniq
        echo $(free -g)

        # transfer and decompress input data from staging ($1 is ${dir} from args)
        tar -xf /staging/groups/zamanian_group/input/$1.tar -C input/

        # deprecated
        # cp -r /staging/groups/zamanian_group/input/$1.tar input
        # cd $input && tar --strip-components 5 -xvf $1.tar && cd $HOME

        # transfer and decompress metadata from staging ($1 is ${dir} from args)
        tar -xf /staging/groups/zamanian_group/metadata/$1.tar -C metadata

        # deprecated
        # cd metadata && tar -xvf $1.tar && rm $1.tar && mv */*/* $1 && cd $HOME

        # run the wrapper
        python Core_imgproc/wrapper.py $1.yml $1

        # tar output folder and delete it
        mv output $1
        mv $1.yml $1
        tar -cvf $1.tar $1 && rm -r $1

        # remove staging output tar if there from previous run
        rm -f /staging/groups/zamanian_group/output/$1.tar

        # mv large output files to staging output folder; avoid their transfer back to /home/{net-id}
        mv $1.tar /staging/groups/zamanian_group/output/
        ```

Log into submit node to submit a job,

```bash
ssh {net-id}@ap2002.chtc.wisc.edu

condor_submit Core_RNAseq-nf.sub dir=191211_AHMMC5DMXX script=Core_RNAseq-nf.sh
```  

??? "Other useful commands for monitoring and managing jobs"
    ```bash
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

### 3. Output (CHTC &rarr; ResearchDrive)

To transfer your job output folder from the CHTC staging output directory to ResearchDrive or your desktop, it is easiesst to use Globus or an SFTP client (e.g., CyberDuck). It also possible to use the command line to transfer outputs to ResearchDrive or your desktop.

??? "CHTC -> ResearchDrive transfer with smbclient"
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

??? "CHTC -> Local Computer"
    ``` bash
    # transfer from CHTC staging to current directory
    scp -r {net-id}@transfer.chtc.wisc.edu:/staging/groups/zamanian_group/output/[dir] .
    ```