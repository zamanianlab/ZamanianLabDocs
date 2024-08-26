# Data Storage

## Box (Small Data)

Box will be used for storage of small data (e.g., tabular data) alongside code for analysis. Data (large and small) processed into small outputs using local or server pipelines should be stored on Box for downstream analysis and plotting. Box will be backed up to ResearchDrive once every six months. Other uses for Box are outlined in the Lab Manual.

## UW ResearchDrive (Large Data)

[UW ResearchDrive](https://it.wisc.edu/services/researchdrive) provides 25 TB of expandable secure storage with off-site backup. We will use this resource to store large data (e.g., sequencing and imaging), as well as backups of Box. Data from the biotech center (BRC) is automatically moved into ResearchDrive.

??? "ResearchDrive file structure"

    ```bash
    ├── ImageXpress/ (or /WormViz ...etc)
    |   └── raw/                              [Raw exported data]
    |   └── metadata/                         [Experiment metadata]    
    |   └── proc/                             [CHTC-processed data]
    |
    ├── UWBC-Dropbox/                         [Auto-deposited data from the UWBC]
    |
    ├── Box_backups/                          [Recent Box backups]
    └── External/                             [External large data]

    ```

Data can be transferred from ResearchDrive to the CHTC for pipeline-based processing and outputs can be transferred from the CHTC back to ResearchDrive for long-term storage and [Box](https://www.box.com) for post-processing, analysis and plotting. [Instructions](https://kb.wisc.edu/researchdata/internal/page.php?id=93998) can be found for connecting to and transferring files in and out of ResearchDrive. Files can be transferred to and from ResearchDrive using a number of approaches, including simple drag-and-drop into the mounted drive, Globus, or via the command-line (`rsync` or `cp`).

??? "Instructions for mounting the UW Research Drive on Mac and PC (as R drive)"

    ```bash
    # Mac
    Finder "Connect to server" > smb://research.drive.wisc.edu/mzamanian

    # PC
    mount smb:\\research.drive.wisc.edu\mzamanian as "R:" drive 
    create shortcut on Desktop

    ```


## UW SVM L Drive (Scratch)

The SVM L Drive can be mounted ([Mac](https://it.vetmed.wisc.edu/drive-map-new-l-drive-zamanianlab-mac-os/) or [PC](https://it.vetmed.wisc.edu/drive-map-new-l-drive-zamanianlab/)) used as both personal 'scratch' space and for temporary or medium-term storage of outputs from SVM instruments. This drive will not be backed up. Anything required for publications should eventually be moved to ResearchDrive (large data) or Box (small data).

??? "Instructions for mounting the SVM L Drive on Mac and PC (as L drive)"

    ```bash
    # Mac
    Finder "Connect to server" > smb://svm-files.ad.wisc.edu/ZamanianLab

    # PC
    mount smb:\\svm-files.ad.wisc.edu\ZamanianLab as "L:" drive 
    create shortcut on Desktop

    ```


## UW S3 Storage (Archival)

[UW S3 storage](https://kb.wisc.edu/researchdata/news.php?id=13447) provides 50 TB of expandable archival storage. The PI will archive all publishable data from Research Drive (including Box backups) to UW S3 storage after publication. Lab Google Drive folders will be backed up to S3 on an annual basis. S3 can be retrieved by the PI and made available on UW ResearchDrive if needed.

