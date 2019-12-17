![Tropical Diseases](http://www.zamanianlab.org/images/parasites/tropicaldiseases.png "Tropical Diseases")

# Introduction

This resource is both an introduction and documentation for the computational aspects of the Zamanian Lab at the University of Wisconsin-Madison. Here you will find a general explanation for how we organize our computational pipelines, as well as steps to take to maintain cross-machine compatibility, reproducibility, and a commitment to open source code.

## How to Use this Guide

This resource is a brief and not comprehensive explanation of tools that the Zamanian lab uses. The user will need to do a good amount of background reading and trialing, but this guide will provide the resources needed in order to gain a thorough and working knowledge of all the tools we use.

This is primarily imagined as a first introduction to the Zamanian Lab organization, but it can also be used as a reference for veteran users. New lab members should follow the computational onboarding [guide](onboarding.md).

Throughout the docs, you will see certain types of code blocks. Code to be run in bash will not include a prompt sequence, for instance:

``` bash
python L3_motility_analysis.py 20180830
```

Code to be run in Python will include the Python prompt:

``` python
>>> import numpy as np
```

And code to be run in R will include the R prompt:

``` r
> install.packages('tidyverse')
```

## Updating

This resource is by nature an open, living, and collaborative document. We are using [MkDocs](https://www.mkdocs.org/) as our site generator which uses a simply structured GitHub repository that includes Markdown files as the documentation and a few ancillary files to help in generation. You will need to have your own [GitHub](https://github.com/) account and will need to be a member of the [@zamanianlab](https://github.com/orgs/zamanianlab/dashboard) organization in order to gain editing privileges. To edit this document, please follow the instructions in the [Updating](updating.md) page.
