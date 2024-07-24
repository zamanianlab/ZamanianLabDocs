# conda

[conda](https://conda.io/docs/) is used for "package, dependency and environment managing" that is cross platform and enables reproducibility of old code, even when some packages and dependencies have been updated in the meantime. conda can be used for any language and can even act as a manager for bioinformatic software. We will also be using it to manage our Python environments. Conda will make it easy to invoke different Python versions as needed for different tasks. Instead of installing software to the entire machine, you install it only in a contained environment. Below are instructions on installing and setting up conda, and a representative example of how virtual environments work.

## Installation

There are two flavors of conda - Anaconda and Miniconda. We recommend you use the more lightweight Miniconda, which can be installed on macOS using the commands below:

``` bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
```

`bash ~/miniconda.sh -p $HOME/miniconda3`

These commands will download the miniconda installer, run it, and install it to your `$HOME` folder by following the prompts. It will also add the path `$HOME/miniconda3/bin` to your lookup `$PATH`, which allows you to run conda executables without referring explicitly to their location.

## Usage and an Example

Now that conda is installed, let's look at how virtual environments work. First, let's create a new environment that uses Python 3.9:

`conda create --name test_environment python=3.9`

The environment has now been created. You can see a list of all the environments that you have ever created with `conda env list`.

Here is a list of current environments on my machine (* marks current environment):

```bash
# conda environments:
#
base                  *  /Users/$username/miniconda3
dev                      /Users/$username/miniconda3/envs/dev
test_environment         /Users/$username/miniconda3/envs/test_environment
```

To activate the `test_environment` that you just created:

`source activate test_environment`

Now you are in the virtual environment, using Python 3.9 as a default. You can check to make sure this is the case with `python --version`.

You can also see the path to your environment's Python with `which python`.

Now that you are in the correct environment, you can begin adjusting it to suit your purposes. The main way to do this is by installing certain Python packages that you may use in your analysis. There are multiple ways to install a Python package. The primary means of installation `conda install {package name}`. If you receive a `PackagesNotFoundError`, search to identify other means of conda installation. This may include tapping different channels such as [bioconda](https://bioconda.github.io/user/install.html) or [conda-forge](https://conda-forge.org/docs/user/introduction.html) (e.g., `conda install --channel bioconda {package name}`).

If a package is not available from conda, you may use `pip install {package name}`. While conda attempts to be compatible with pip, you may occasionally run into issues with packages installed through this route.

**Package installation example:** As an example, we will use conda to install numpy. Numpy is a popular package used for scientific computing, typically computing that involve matrices. First make sure you are in the correct environment, then run:

`conda install numpy`

You should receive a message reporting the successful installation of the package. You can ensure successful installation by running Python with `python` and then attempting to load the package with `>>> import numpy as np`. If the package was successfully loaded, you will get no message. If it was unsuccessful, you will see:

```python
 ModuleNotFoundError: No module named 'numpy'
```

## Zamanian Lab Environments

Whenever we begin a new analysis that will include Python scripts, it is the developer's responsibility to build a conda environment that is suitable for those scripts. Instructions for creating this environment should be included in the README file on the main page of the associated GitHub repo.

## Cleaning

conda environments can tend to take up a lot of disk space unless you tend to use the same package versions across environments. It's good practice to delete environments that aren't being actively used or updated (but keep notes on what packages and versions you would need to reproduce this environment). conda also has its own cleanup command that should be regularly run:

`conda clean -ay`

## Useful Resources

[conda cheatsheet](https://conda.io/docs/_downloads/conda-cheatsheet.pdf)
