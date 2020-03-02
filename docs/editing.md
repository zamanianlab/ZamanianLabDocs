# Editing or Adding New Documentation

1. Install MkDocs and the [Material](https://squidfunk.github.io/mkdocs-material/) theme

      `pip install mkdocs && pip install mkdocs-material`

2. Clone the ZamanianLabDocs repo:

      `git clone https://github.com/zamanianlab/ZamanianLabDocs.git`

3. Create and edit a Markdown file
    - Use previous documentation as a guide
    - Save in `/docs/` with the `.md` extension
        - **NOTE**: if adding/editing a protocol, make a new folder `/docs/protocols` titled `{protocol_name}` (without the {}); if adding images, make a new folder called `img` in `/docs/protocols/{protocol_name}`
    - Use the <a href="https://yakworks.github.io/mkdocs-material-components/cheat-sheet/" target="blank">cheatsheet</a> for reference
    - Use an online editor (like <a href="http://markdown.pioul.fr/" target="blank">this</a> one) or use [Atom](osx.md) combined with the <a href="https://atom.io/packages/markdown-preview-plus" target="blank">Markdown Preview Plus</a> extension

4. Push to GitHub

5. Build and deploy site

      `mkdocs build && mkdocs gh-deploy`

  - Optional: before deploying with `gh-deploy`, view the site locally with `mkdocs serve` and copy/paste <http://127.0.0.1:8000/> into your browser

6. After deploying, check to ensure everything deployed as expected by visiting <http://www.zamanianlab.org/ZamanianLabDocs/>
