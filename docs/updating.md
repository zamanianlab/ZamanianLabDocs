# Adding New Documentation

1. Install MkDocs
  ```bash
  pip install mkdocs
  ```

2. Clone the ZamanianLabDocs repo:
  ```bash
  git clone https://github.com/zamanianlab/ZamanianLabDocs.git
  ```

3. Create and edit a Markdown file
  - Use previous documentation as a guide
  - Save in `/docs/` with the `.md` extension

4. Push to GitHub

5. Build and deploy site
  ```bash
  mkdocs build
  mkdocs gh-deploy
  ```
  - Optional: before deplying with `gh-deploy`, view the site locally with `mkdocs serve` and copy/paste http://127.0.0.1:8000/ into your browser

6. After deploying, check to ensure everything deployed as expected by visiting http://www.zamanianlab.org/ZamanianLabDocs/
