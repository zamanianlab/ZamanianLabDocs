# Pipelines Overview

We organize our data and pipelines as outlined on these pages:

1. [Local Pipelines](pipelines_local.md) (simple local scripts)

    Pipelines involving assay and data processing or post-processing tasks that can be modified and run on local computers. These pipelines have a common structure and are housed on Box (e.g., ``/ZamanianLab/LabMembers/{Name}/{Project}``) and typically include R scripts to process instrument output files, tabular assay data, and the outputs of server pipelines. Project folders will be transferred to a dedicated GitHub repo upon publication of a given project.

2. [Server Pipelines](pipelines_server.md) (contain a remote server component)

    Pipelines that tap into the computational power of remote servers, typically involving larger datasets and more complex processing. These currently include image processing, sequencing, and comparative genomics pipelines.
