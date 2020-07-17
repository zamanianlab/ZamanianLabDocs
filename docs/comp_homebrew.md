# Homebrew

[Homebrew](https://brew.sh) is a package manager for macOS. Many of the core software used in bioinformatics and development can be installed using Homebrew, which automatically determines the necessary configuration for successful installation on your machine. Once installed, Homebrew will also keep a log of software that needs updating and will quickly update all of your installed software with only a few keystrokes. Install Homebrew with the following command:

``` bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Most of the core software used in the Zamanian Lab can be installed via Homebrew. If you need a piece of software, a good first step is to check if it has been implemented in Homebrew and install it from the source only if absolutely necessary. Below is a list of software that we recommend installing right off that bat. Run the following to automatically install these on your machine:

``` bash
sh ~/Github/ZamanianLabDocs/resources/zl_brew.sh
```
([Link](https://raw.githubusercontent.com/zamanianlab/ZamanianLabDocs/master/resources/zl_brew.sh) to bash installation script)

```
- autojump  
- SAMtools
- blast 
- fastx_toolkit
- fastqc 
- snpeff
- vcftools  
- bcftools 
- hmmer
- igv 
- hisat2
- trimmomatic
- bwa
- nextflow  
```

The following are GNU versions of command line tools that macOS already contains out-of-the-box, but the GNU versions are often faster and will play nicer with software developed in Linux:
```
- coreutils
- binutils
- diffutils
- findutils
- gawk
- gnu-indent
- gnu-sed
- gnu-tar
- gnu-which
- gnutls
- grep
- gzip
- watch
- wdiff
- wget
```
