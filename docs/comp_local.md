# Local OS X Environment

For the most part, the Zamanian lab requires use of macOS on personal computers. The following is a guide for setting up one's local machine for in order to unify machines across the lab.

1. Update your macOS version to Catalina (v10.15.1)

2. Install core software:

    - [Adobe products](https://kb.wisc.edu/69772)
    - [Box Drive](https://www.box.com/resources/downloads/drive) (cloud-based shared file storage)
    - [Cyberduck](https://cyberduck.io/) (SFTP client)
    - [iTerm](https://iterm2.com/) (feature-rich terminal replacement)
    - [Atom](https://atom.io/) (Versatile IDE with useful [packages](https://atom.io/packages) and [themes](https://atom.io/themes))
    - [XQuartz](https://www.xquartz.org/) (open-source window system on which some apps rely)
    - [XCode](https://apps.apple.com/us/app/xcode/id497799835?mt=12) (command line tools for macOS)
    - [RStudio](https://rstudio.com/) (IDE for R scripting and plotting)
    - [Sublime Text](https://www.sublimetext.com/) (lightweight text editor)
    - [Slack](<http://www.slack.com>) (primary lab communication tool)
    - [UW VPN](https://kb.wisc.edu/helpdesk/page.php?id=90370) (VPN for off-campus resource access)
    - [Zoom](https://zoom.us/download) (video meeting software)
    - [Paperpile](https://paperpile.com/) (reference management)

3. If the Mac is UW-owned, follow the instructions to install [Parallels Mac Management](https://it.vetmed.wisc.edu/pmm-for-sccm-client-install/). This will allow you to directly install UW software.

4. Install additional bioinformatics and imaging software:

    - [Fiji](https://fiji.sc/) (primary software used for image analysis)
    - [FigTree](https://github.com/rambaut/figtree/releases) (graphical viewer of phylogenetic trees)
    - [4Peaks](https://nucleobytes.com/4peaks/index.html) (editing of sequence trace files)


5. Replace your `~/.bash_profile` with the lab `.bash_profile` (direct link: [.bash_profile](https://raw.githubusercontent.com/zamanianlab/ZamanianLabDocs/master/resources/.bash_profile)).

6. Create your R environment:
    - Use [CRAN](https://cloud.r-project.org/bin/macosx/R-4.0.2.pkg) to install or update R to version 4.0.2

      *NOTE: We will upgrade to new versions of R as a group.*

    - Run [Setup.R](https://raw.githubusercontent.com/zamanianlab/ZamanianLabDocs/master/resources/R_setup.R) to install core lab packages. You are free to to install additional packages that are specific to you and your projects. This will also install our [ZamanianLabREnvironment](https://github.com/zamanianlab/ZamanianLabREnvironment).

7. Manage your Python environment using [Miniconda](comp_conda.md).

8. Use [Homebrew](comp_homebrew.md) to install other command-line software (optional).
