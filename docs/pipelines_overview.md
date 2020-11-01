# Pipelines Overview

We organize our data and pipelines as outlined on these pages:

1. [Lab Data Storage](pipelines_storage.md)

    An overview of how we manage large and small data in the lab. We maintain exact rules on how to properly store raw and processed data (file and folder structure and nomenclature).

2. [Local Pipelines](pipelines_local.md) (simple local scripts)

    These are pipelines involving common assay and data processing tasks that can be modified and run on local computers. These pipelines have a common structure and are housed in dedicated sub-directories on Box (``~/Box/ZamanianLab/Data``). These include R scripts and pipelines to process instrument output files (e.g., qPCR, EPG, plate reader) or tabular phenotypic assay data.

3. [Server Pipelines](pipelines_server.md) (contain a remote server component)

    These are pipelines that tap into the computational power of remote servers, typically involving larger datasets and more complex processing. These include image processing (ImageXpress, WormViz, Tierpsy), DNA and RNA sequence processing, and comparative genomics pipelines.
