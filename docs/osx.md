# Local OS X Environment

For the most part, the Zamanian lab requires use of macOS on personal computers. The following is a guide for setting up one's local machine for in order to unify machines across the lab.

1. Update your macOS version to Catalina (v10.15.1)
2. Install core software:
  - [Adobe products](https://kb.wisc.edu/69772.)
  - [Cyberduck](https://cyberduck.io/) (SFTP client)
  - [iTerm](https://iterm2.com/) (feature-rich terminal replacement)
  - [Atom](https://atom.io/) (GitHub-owned integrated development environment (IDE)
  - [RStudio](https://rstudio.com/) (IDE for R scripting and plotting)
  - [Fiji](https://fiji.sc/) (primary software used for image analysis)
  - [Sublime Text](https://www.sublimetext.com/) (lightweight but extensible text editor)
3. Replace your `~/.bash_profile` with the lab `.bash_profile` found in the `resources` directory of the GitHub repo that hosts this site.
4. Create your R environment:
  - Use [CRAN](https://cloud.r-project.org/) to install or update R to version 3.6.2
  - Install the [ZamanianLabREnvironment](https://github.com/wheelern/ZamanianLabREnvironment) R package to create a consistent, unified environment across machines.
5. Create your Python environment:
  - Install [miniconda3](https://docs.conda.io/en/latest/miniconda.html)
6. Use Homebrew to [install other core command-line software](homebrew.md)
