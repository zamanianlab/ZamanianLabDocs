# conda

`conda <https://conda.io/docs/>`\_ is used for "package, dependency and environment managing" that is cross platform and enables reproducibility of old code, even when some packages and dependencies have been updated in the meantime. conda can be used for any language and can even act as a manager for bioinformatic software such as bwa, bcftools, MrBayes, etc., but we will be using it to manage our Python environments.

While most of our plotting and some data analysis uses R, our image and video analyses use Python. There are certain similarities to these languages, and most bioinformatic data analyses can be performed using one or the other (or both). However, R development is more streamlined and centralized, and we only use a few third-party packages, while Python includes two major versions (2 and 3) that are still regularly used (I write in Python 3 while many developers still prefer Python 2, and scripts written in one version often won't work when run with the other version), and the packages that we use are diverse and maintained by a large crowd of different developers. Thus, we don't need package and environment management for R, but our Python pipelines are greatly enhanced with such management.

conda has several features that make it a powerful tool, but the main feature we will be using is the ability to create virtual environments and install packages to that specific environment. Normally, when you install a piece of software, it is available to run from any directory on your machine. This is good for some software, but sometimes a developer will encourage you to update the software, which inevitably breaks your code and makes debugging extremely difficult. Virtual environments are one solution to this problem. In these cases, instead of installing software to the entire machine, you install it only in a discrete, contained environment. Below are instructions on installing and setting up conda, and a representative example of how virtual environments work.

## Installation

There are two flavors of conda - Anaconda and Miniconda. Anaconda is 3 GB and contains quite a few packages and features that are unnecessary for our purposes.

```bash
wget https://repo.continuum.io/miniconda/Miniconda3-3.7.0-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
```

These commands will download the miniconda installer, run it, and install it to your `$HOME` folder. It will also add the path `/Users/[user]/software/miniconda3/bin` to your lookup `$PATH`, which allows you to run conda executables without referring explicitly to their location.

## Usage and an Example

Now that conda is installed, let's look at how virtual environments work.

First, let's create a new environment that uses Python 3.5:

`conda create --name test_environment python=3.5`

The environment has now been created. You can see a list of all the environments that you have ever created with `conda env list`.

Here is a list of current environments on my machine (the asterisk marks the current environment):

```bash
zamanian-3108:~ njwheeler$ conda env list
# conda environments:
#
base                  *  /Users/njwheeler/software/miniconda3
motility_analysis        /Users/njwheeler/software    
miniconda3/envs/motility_analysis
```

To activate the `test_environment` that you just created:

`source activate test_environment`

Now you are in the virtual environment, using Python 3.5 as a default. You can check to make sure this is the case with `python --version`.

You can also see the path to your environment's Python with `which python`.

Now that you are in the correct environment, you can begin adjusting it to suit your purposes. The main way to do this is by installing certain Python packages that you may use in your analysis. There are multiple ways to install a Python package, but the two main ways are using `conda install {package name}` and `pip install {package name}`. When installing a new package, you should first try to use the conda package manager. If that doesn't work, you will receive an error such as:

    PackagesNotFoundError: The following packages are not available from current channels

If you receive this error, use Google to try to find a way to install the package with conda. You may need to use a different channel such as `bioconda`, and then use `conda install --channel bioconda {package name}`. If the package is not available via conda, you will need to use `pip install {package name}`.

As an example, we will use conda to install numpy. Numpy is a popular package used for scientific computing, typically computing that involve matrices.
First make sure you are in the correct environment, then run:

`conda install numpy`

You should receive a message reporting the successful installation of the package. You can ensure successful installation by running Python with `python` and then attempting to load the package with `>>> import numpy as np`. If the package was successfully loaded, you will get no message. If it was unsuccessful, you will see:

```python
 ModuleNotFoundError: No module named 'numpy'
```

To demonstrate the utility of the conda virtual environment, first deactivate the `test_environment` with `source deactivate test_environment`. Then repeat the commands `python` and `>>> import numpy as np`. If done correctly, you will see that numpy isn't available outside of the `test_environment`. This way you can keep your base environment clean from unnecessary packages, and you can make sure the packages within a given environment aren't updated unless you explicitly make it so.

## Zamanian Lab Environments

Whenever we begin a new analysis that will include Python scripts, it is the developer's responsibility to build a conda environment that is suitable for those scripts. Instructions for creating this environment should be included in the README file on the mainpage of the GitHub repo. See Nic's
[BrugiaMotilityAnalysis](https://github.com/zamanianlab/BrugiaMotilityAnalysis)
repo as an example.

## Useful Resources

[conda cheatsheet](https://conda.io/docs/_downloads/conda-cheatsheet.pdf)
