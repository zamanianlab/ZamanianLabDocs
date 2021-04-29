# Local Pipelines

Simple pipelines are those that are entirely local - they run on a local machine and access data on that same machine. The vast majority of these pipelines will consist of 1-3 R scripts with intermediary Rds files. Simple pipelines will not have version control and thus will not use GitHub, but they may often be collaborative. For this reason there are few standard practices that we will employ, as outlined below.

With few defined exceptions, data and pipelines associated with a specific data type will be stored on the lab Box `Data` folder using a common structure.

Within designated `Box/ZamanianLab/Data/` sub-directory,

  ```
  {Data Type}/
    ├── Master_summary.csv        [date, experimenter, other descriptive columns]
    ├── data/                     [data organized by day]
    │   └── YYYYMMDD/          
    │   │   ├── YYYYMMDD.csv      [raw instrument output or csv data]
    │   │   └── Notes.txt         [assay description and additional details]
    │   └── (assay)_tidy.rds      [tidy/processed data]
    ├── R/                        [R script folder]
    │   ├── (assay)_tidy.R        [raw data > (assay)_tidy.rds]
    │   └── (assay)_analysis.R    [template: tidy data > analysis and plots]
    └── plots/                    [plot outputs]
  ```

  - Raw data will either be stored in CSV files or as natively-exported instrument files within dated folders. Append lettered subscripts to the end of the folder name if multiple unrelated outputs of that data type were generated on the same day (e.g., `YYYYMMDDa` and `YYYYMMDDb`).

  - Data tidying will be performed in scripts that are separate from those that perform analysis and visualization. Tidy data will be stored in Rds files (space-saving compared to Rda format).

**Tidying instructions:** These instructions apply to establishing templates for raw tabular (csv) files that are manually generated in the course of assays, and the Rds files generated from tidying all raw data (manually-generated csv or instrument-generated files in various formats). **Pay close attention to column order and case sensitivity**. The purpose of setting common standards is to make manipulation of these data easier across the lab.

***Required column names and entries***
```
- date [YYYY-MM-DD]
- species [e.g., Cel, Bma, Bpa, Dim]
- strain [e.g., N2 for Cel, NA or gene_id(dsRNA) for parasites]
- stage [Embryo, mf, L1, L2, L3, L4, AM, AF, Adult]
- experimenter [e.g., KJG]
```

***Assay-specific column examples***
```
- treatment [e.g., one_drug: Ivermectin, two drugs: Serotonin_Ivermectin]
- conc [e.g., one conc: 5uM, two conc: 5uM_10uM]
- worm_num
- plate_num
- cue
```
*Our lab maintains a common [dictionary](https://docs.google.com/spreadsheets/d/1_-A3QW2CzlxZGCgrGRkVHnbFrcXyhWBrQ84GenHfMik/edit#gid=0) of full drug names and plot abbreviations.*
