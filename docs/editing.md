# Editing or Adding New Documentation

1. Install MkDocs and the [Material](https://squidfunk.github.io/mkdocs-material/) theme

      `pip install mkdocs && pip install mkdocs-material`

2. Clone the ZamanianLabDocs repo:

      `git clone https://github.com/zamanianlab/ZamanianLabDocs.git`

3. Create and edit a Markdown file
    - Use previous documentation as a guide
    - Save in `/docs/` with the `.md` extension
    - Use the GitHub [cheatsheet](https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf) for reference

4. Push to GitHub

5. Build and deploy site

      `mkdocs build && mkdocs gh-deploy`

  - Optional: before deplying with `gh-deploy`, view the site locally with `mkdocs serve` and copy/paste <https://127.0.0.1:8000/> into your browser


6. After deploying, check to ensure everything deployed as expected by visiting <http://www.zamanianlab.org/ZamanianLabDocs/>
