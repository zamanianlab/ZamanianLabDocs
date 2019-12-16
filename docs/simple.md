# Simple Pipelines

Simple pipelines are those that are entirely local - they run on a local machine and access data on that same machine. The vast majority of these pipelines will consist of 1-3 R scripts with intermediary Rds files.

Simple pipelines will not have version control and thus will not use GitHub, but they may often be collaborative. For this reason there are few standard practices that we will employ:

1. Data wrangling will be performed in scripts that are separate from those that perform analysis and visualization.

2. Raw data will be stored in CSV files and wrangled/tidied data will be stored in Rds files.

3. All data will be stored on the shared Box drive using the following directory structure:

    `Box/ZamanianLab/Data/{Experiment Type}/Species/Name/Date`

    Each experiment will have its own CSV file with an accompanying `notes.txt` file explaining the assay.

4. All lab members will be required to maintain a consistent R environment by installing and periodically updating the Zamanian Lab R Environment package.
