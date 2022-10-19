# Local OS X Environment

For the most part, the Zamanian lab requires use of macOS on personal computers. The following is a guide for setting up one's local machine for in order to unify machines across the lab.

1. Update your macOS version to Monterey (v12.6)

2. If the Mac is UW-owned, follow these instructions to install [Parallels Mac Management](https://it.vetmed.wisc.edu/pmm-for-sccm-client-install/). This will allow you to directly install/update UW-licensed software, including Adobe products, the UW VPN (Cisco Global Protect), Microsoft Office products, and Zoom.

3. Install core software (some of which can be installed/updated via Parallels; instructions for manually installing on a personal computer are linked):

    - [Adobe products](https://kb.wisc.edu/69772)
    - [Box Drive](https://www.box.com/resources/downloads/drive) (cloud-based shared file storage)
    - [Cyberduck](https://cyberduck.io/) (SFTP client)
    - [iTerm](https://iterm2.com/) (feature-rich terminal replacement)
    - [Paperpile](https://paperpile.com/) (reference management)
    - [RStudio](https://rstudio.com/) (IDE for R scripting and plotting)
    - [Slack](<https://www.slack.com>) (primary lab communication tool)
    - [Sublime Text](https://www.sublimetext.com/) (lightweight text editor)
    - [UW VPN](https://kb.wisc.edu/helpdesk/page.php?id=90370) (VPN for off-campus resource access)
    - [Visual Studio Code](https://code.visualstudio.com/) (Versatile IDE for general programming)
    - [XQuartz](https://www.xquartz.org/) (open-source window system on which some apps rely)
    - [XCode](https://apps.apple.com/us/app/xcode/id497799835?mt=12) (command line tools for macOS, can also be isntalled by running `xcode-select --install`)
    - [Zoom](https://zoom.us/download) (video meeting software)

4. Install additional bioinformatics and imaging software:

    - [Fiji](https://fiji.sc/) (primary software used for image analysis)
    - [FigTree](https://github.com/rambaut/figtree/releases) (graphical viewer of phylogenetic trees)
    - [4Peaks](https://nucleobytes.com/4peaks/index.html) (editing of sequence trace files)

5. Change the default Shell to `bash` (default on new Mac machines is `zsh`):

    - Open System Preferences
    - Click Users & Groups
    - Click bottom-left lock icon and enter password
    - Right-click (or hold Control and click) on your username in the left pane and select Advanced Options...
    - Choose `/bin/bash` as the Login shell

6. Add contents of the lab `.bash_profile` to your current `~/.bash_profile` (direct link: [.bash_profile](https://raw.githubusercontent.com/zamanianlab/ZamanianLabDocs/master/resources/.bash_profile)). Edit aliases as needed to include your net-id.

7. Create your R environment:

    - Use [CRAN](https://cran.r-project.org/bin/macosx/base/R-4.2.1.pkg) to install or update R to version 4.2.1

      *NOTE: We will upgrade to new versions of R as a group.*

    - Run [Setup.R](https://raw.githubusercontent.com/zamanianlab/ZamanianLabDocs/master/resources/R_setup.R) to install core lab packages. You are free to to install additional packages that are specific to you and your projects. This will also install our [ZamanianLabThemes](https://github.com/zamanianlab/ZamanianLabThemes).

8. Use [Homebrew](comp_homebrew.md) to install other command-line tools (you can use Homebrew to install many bioinformatics packages as well).

9. Manage your Python environment using [Miniconda](comp_conda.md).
