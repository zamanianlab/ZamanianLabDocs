# Homebrew

[Homebrew](https://brew.sh) is a package manager for macOS. You can install common bioinformatics software using Homebrew, which automatically determines the necessary configuration for successful installation on your machine. Once installed, Homebrew will also keep a log of software that needs updating and will quickly update all of your installed software with only a few keystrokes. Install Homebrew with the following command:

``` bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

While most bioinformatics tasks will be run using servers, you may choose to use Homebrew to install bionformatics programs to your local computer to carry out some tasks locally. The following command installs a list of informatics programs to your computer, which should be modified based on your needs.

``` bash
sh ~/Github/ZamanianLabDocs/resources/zl_brew.sh
```
[Link](https://raw.githubusercontent.com/zamanianlab/ZamanianLabDocs/master/resources/zl_brew.sh) to bash installation script that includes common informatics programs and GNU versions of command line tools.
