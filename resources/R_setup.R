install.packages("tidyverse")
#https://www.tidyverse.org/packages/
#ggplot2, dplyr, tidyr, readr, purrr, tibble, stringr, forcats, lubridate, hms, magrittr...

install.packages("conflicted")
install.packages("ggtext")
install.packages("cowplot")
install.packages("patchwork")
install.packages("ggpubr")
install.packages("ggbeeswarm")
install.packages("ggrepel")
install.packages("ggridges")
install.packages("ggthemes")
install.packages("ggdendro")
install.packages("scales")
install.packages("shiny")
install.packages("janitor")
install.packages("Hmisc")
install.packages("pheatmap")
install.packages("gdata")
install.packages("ape")

#colorpalettes #https://emilhvitfeldt.github.io/paletteer/
#includes "wesanderson", "virids", "RColorBrewer"
install.packages("paletteer")

#other ggplot2 extension: https://exts.ggplot2.tidyverse.org/

install.packages("devtools")

install.packages("BiocManager")
BiocManager::install("DESeq2")
BiocManager::install("biomaRt")
BiocManager::install("topGO")
BiocManager::install("Rgraphviz")

#install lab themes
devtools::install_github("zamanianlab/ZamanianLabThemes")
