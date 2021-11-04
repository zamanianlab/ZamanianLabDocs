# Lab Docs

This resource provides documentation for general wet lab and dry lab organization and pipelines for the Zamanian Lab at the University of Wisconsin-Madison. This is an evolving resource.


## How to Use this Guide

New lab members should first orient themselves with our [Lab Manual](labmanual.md) and [Computational Onboarding](comp_overview.md) documents. All finalized lab protocols are maintained on the [Protocols](protocols/protocols.md) page. [Lab Sheets](labsheets.md) provides links to important Google sheets that are maintained by the laboratory. [Pipelines](pipelines_overview.md) provides more detailed information on how to run established computational (e.g., phenotyping and sequencing) pipelines locally or using available servers. This resource complements and describes our use of other systems in place for lab organization and management (i.e., Quartzy, Benchling, and Box).


## Updating

This resource is by nature an open, living, and collaborative document. We are using [MkDocs](https://www.mkdocs.org/) as our site generator which uses a simply structured GitHub repository that includes Markdown files as the documentation and a few ancillary files to help in generation. You will need to have your own [GitHub](https://github.com/) account and will need to be a member of the [@zamanianlab](https://github.com/orgs/zamanianlab/dashboard) organization in order to gain editing privileges. To edit this document, please follow the instructions below.

1. Install MkDocs and the [Material](https://squidfunk.github.io/mkdocs-material/) theme

      `conda install -c conda-forge mkdocs=1.1.2`

      `conda install -c conda-forge mkdocs-material=6.1.7`

      `conda install -c conda-forge mkdocs-material-extensions=1.0.1`

2. Clone the ZamanianLabDocs repo:

      `git clone https://github.com/zamanianlab/ZamanianLabDocs.git`

3. Create and edit a Markdown file
    - Use previous documentation as a guide
    - Save in `/docs/` with the `.md` extension
        - **NOTE**: if adding/editing a protocol, make a new folder `/docs/protocols` titled `{protocol_name}` (without the {}); if adding images, make a new folder called `img` in `/docs/protocols/{protocol_name}`
    - Use the <a href="https://yakworks.github.io/mkdocs-material-components/cheat-sheet/" target="blank">cheatsheet</a> for reference
    - Use an online editor (like <a href="https://markdown.pioul.fr/" target="blank">this</a> one) or use [Atom](comp_local.md) combined with the <a href="https://atom.io/packages/markdown-preview-plus" target="blank">Markdown Preview Plus</a> extension

4. Push to GitHub

5. Build and deploy site

      `mkdocs build && mkdocs gh-deploy`

  - Optional: before deploying with `gh-deploy`, view the site locally with `mkdocs serve` and copy/paste <https://127.0.0.1:8000/> into your browser

6. After deploying, check to ensure everything deployed as expected by visiting <https://www.zamanianlab.org/ZamanianLabDocs/>
