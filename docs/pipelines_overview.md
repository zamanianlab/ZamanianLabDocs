# Pipelines Overview and Tools

We organize our pipelines into two groups, structured in slightly different ways:

1. [Local Pipelines](pipelines_local.md) (simple local scripts)

    These are pipelines involving common assay and data processing tasks that can be modified and run on local computers. These pipelines have a common structure and are housed in dedicated sub-directories on Box (``~/Box/ZamanianLab/Data``). These include pipelines to process instrument output files (e.g., qPCR and EPG) or tabular phenotypic assay data.

2. [Core Pipelines](pipelines_server.md) (contain a remote server component)

    These are pipelines that tap into the computational power of remote servers, typically involving larger datasets and more complex processing. These include image processing (ImageXpress, WormViz, Tierpsy), DNA and RNA sequence processing, and comparative genomics pipelines.

We maintain basic rules on how to properly store raw data and process common data types within these folders. The structures of these pipelines are detailed on the [Local Pipelines](pipelines_local.md) and [Core Pipelines](pipelines_server.md) pages.
