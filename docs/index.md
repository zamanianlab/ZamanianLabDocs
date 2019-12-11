# Introduction

This resource is both an introduction and documentation for the computational aspects of the Zamanian Lab at the University of Wisconsin-Madison. Here you will find a general explanation for how we organize our computational pipelines, as well as steps to take to maintain cross-machine compatibility, reproducibility, and a commitment to open source code.

## Contents

There are four main tools we will use to accomplish the above goals:

1. `GitHub <https://github.com>`_
2. `Homebrew <https://brew.sh/>`_
3. `Box Sync <https://box.com>`_
4. `conda <https://conda.io/docs/>`_

## Usage

This repository is primarily imagined as a first introduction to the Zamanian Lab organization, but it can also be used as a reference for veteran users. Throughout the docs, you will see certain types of code blocks. Code to be run in bash will not include a prompt sequence, for instance:

``python L3_motility_analysis.py 20180830``

Code to be run in Python will include the Python prompt:

``>>> import numpy as np``

And code to be run in R will include the R prompt:

``> install.packages('tidyverse')``
