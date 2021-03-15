# Homebrew

[Homebrew](https://brew.sh) is a package manager for macOS. It allows you to install common software and automatically determines the necessary configuration for successful installation on your machine. Once installed, Homebrew will also keep a log of software that needs updating and will quickly update all of your installed software with only a few keystrokes. Install Homebrew with the following command:

``` bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

One of the main ways we use Homebrew is to maintain a development environment on our macOS's that will be consistent with the Linux OS on our CHTC node. For this reason, we install the GNU version of many command line tools (e.g. grep, sed, awk). After installing Homebrew, download and run [this Bash script](https://raw.githubusercontent.com/zamanianlab/ZamanianLabDocs/master/resources/zl_brew.sh) to install all of the relevant GNU tools. If you have this GitHub repo cloned in `$HOME/GitHub`, you can use the following command to install the GNU tools:

``` bash
sh ~/Github/ZamanianLabDocs/resources/zl_brew.sh
```

You can also install many common bionformatics packages with brew, for example:

``` bash
brew install blast
```
