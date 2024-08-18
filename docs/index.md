# Lab Docs

This resource provides documentation for general wet lab and dry lab organization and pipelines for the Zamanian Lab at the University of Wisconsin-Madison. This is an evolving resource.


## How to Use this Guide

New lab members should first orient themselves with our [Lab Manual](labmanual.md) and [Computational Guide](comp_overview.md) documents. Many finalized lab protocols are maintained on the [Protocols](protocols/protocols.md) page. [Pipelines](pipelines_overview.md) provides detailed information on local and server-based computational pipelines. [Lab GDrive](labgdrive.md) provides links to Google docs and sheets that are maintained by the laboratory.


## Updating

This resource is by nature an open, living, and collaborative document. We are using [MkDocs](https://www.mkdocs.org/) as our site generator which uses a simply structured GitHub repository that includes Markdown files as the documentation and a few ancillary files to help in generation. You will need to have your own [GitHub](https://github.com/) account and will need to be a member of the [@zamanianlab](https://github.com/orgs/zamanianlab/dashboard) organization in order to gain editing privileges. To edit this document, please follow the instructions below.

1. Install MkDocs and the [Material](https://squidfunk.github.io/mkdocs-material/) theme in a conda environment
    ```
    conda create --name labdocs python=3.9
    conda activate labdocs
    conda install pip
    pip install mkdocs
    pip install mkdocs-material
    ```

2. Clone the ZamanianLabDocs repo:

    `git clone https://github.com/zamanianlab/ZamanianLabDocs.git`

3. Create and edit a <a href="https://yakworks.github.io/docmark/cheat-sheet/" target="blank">Markdown file</a> (save in `/docs/` with the `.md` extension). 

    *NOTE*: if adding/editing a protocol, make a new folder `/docs/protocols` titled `{protocol_name}`. If adding images, make a new folder called `img` in `/docs/protocols/{protocol_name}`

4. Push to GitHub

5. Build and deploy site

    `mkdocs build && mkdocs gh-deploy`

  - Optional: before deploying with `gh-deploy`, view the site locally with `mkdocs serve`

6. After deploying, check to ensure everything deployed as expected by visiting <https://www.zamanianlab.org/ZamanianLabDocs/>
