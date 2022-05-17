# Pipelines Overview

We organize our data and pipelines as outlined on these pages:

1. [Data Storage](pipelines_storage.md)

    An overview of how we manage large and small data in the lab. We maintain strict file and folder nomenclature rules on how to properly store raw and processed data.

2. [Local Pipelines](pipelines_local.md) (simple local scripts)

    These are pipelines involving common assay and data processing or post-processing tasks that can be modified and run on local computers. These pipelines have a common structure and are housed in dedicated sub-directories on Box (``/ZamanianLab/Data``). These include R scripts to process instrument output files, tabular phenotypic assay data, and the outputs of server pipelines.

3. [Server Pipelines](pipelines_server.md) (contain a remote server component)

    These are pipelines that tap into the computational power of remote servers, typically involving larger datasets and more complex processing. These include image processing, sequencing, and comparative genomics pipelines.
