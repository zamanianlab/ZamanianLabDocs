install.packages("tidyverse")
#https://www.tidyverse.org/packages/
#core: ggplot2, dplyr, tidyr, readr, purrr, tibble, stringr, forcats, 
#additional packages that still have to be activated: lubridate, hms, magrittr, broom, glue, scales, knitr

#other tidyverse-adjacent packages
install.packages("here")
install.packages("conflicted")
install.packages("cowplot")
install.packages("patchwork")
install.packages("tidymodels")
install.packages("janitor")
install.packages("shiny")
install.packages("gdata")
install.packages("Hmisc")
install.packages("feather")

#ggplot related visual packages and miscellaneous 
#other ggplot2 extension: https://exts.ggplot2.tidyverse.org/
install.packages("ggpubr")
install.packages("ggtext")
install.packages("ggbeeswarm")
install.packages("ggrepel")
install.packages("ggridges")
install.packages("ggthemes")
install.packages("ggdendro")
install.packages("pheatmap")
install.packages("ape")

#color palettes and packages #https://emilhvitfeldt.github.io/paletteer/
#includes "wesanderson", "virids", "RColorBrewer"
install.packages("paletteer")
install.packages("shades")

#image import and manipulation
install.packages("magick")
install.packages("pdftools")
install.packages("grConvert")
install.packages("grImport2")

#devtools and Bioconductor packages
install.packages("devtools")
install.packages("BiocManager")
BiocManager::install("ggtree")
devtools::install_github("gaospecial/ggVennDiagram")
BiocManager::install("DESeq2")
BiocManager::install("biomaRt")
BiocManager::install("topGO")
BiocManager::install("Rgraphviz")

#install lab themes
devtools::install_github("zamanianlab/ZamanianLabThemes")
