# Introduction

This resource is both an introduction and documentation for the computational aspects of the Zamanian Lab at the University of Wisconsin-Madison. Here you will find a general explanation for how we organize our computational pipelines, as well as steps to take to maintain cross-machine compatibility, reproducibility, and a commitment to open source code.

## How to Use this Guide

Below there will be a short explanation of how we think about all of our internal pipelines. There will be a brief defense of this organization and an explanation for how to use the pipelines, update them, and collaborate with other lab members.

The rest of this resource will be a brief and not comprehensive explanation of tools that the Zamanian lab uses. The user will need to do a good amount of background reading and trialing, but this guide will provide the resources needed in order to gain a thorough and working knowledge of all the tools we use.

## Pipeline Organization

We organize our pipelines into 3 tiers, each of which be structued in slightly different ways. Pipelines are categorized into one of the following:

1.  Core Pipelines (performed entirely on our BRC server)

    -   ImageXpress

2.  Mixed Pipelines (performed using a mix of local machines and the server)

    -   WormViz
    -   Tierpsy

3.  Simple Pipelines (performed entirely locally)
    -   qPCR
    -   EPG
    -   Sensory assays

## Tools

There are four pieces of software and four languages we will use to accomplish the above goals (each link will take you to our internal documentation for using these tools and languages):

### Software

1.  [GitHub](github.md) (<https://github.com/>)
2.  [Homebrew](homebrew.md) (<https://brew.sh>)
3.  [Box Sync](box.md) (<https://box.com>)
4.  [conda](conda.md) (<https://docs.conda.io/en/latest/>)

### Languages

1.  Python
2.  R
3.  Bash
4.  NextFlow

## Usage

This repository is primarily imagined as a first introduction to the Zamanian Lab organization, but it can also be used as a reference for veteran users. New lab members should follow the [onboarding guide](onboarding.md).

Throughout the docs, you will see certain types of code blocks. Code to be run in bash will not include a prompt sequence, for instance:

`python L3_motility_analysis.py 20180830`

Code to be run in Python will include the Python prompt:

`>>> import numpy as np`

And code to be run in R will include the R prompt:

`> install.packages('tidyverse')`

## Updating

This resource is by nature an open, living, and collaborative document. We are using [MkDocs](https://www.mkdocs.org/) as our site generator which uses a simply structured GitHub repository that includes Markdown files as the documentation and a few ancillary files to help in generation. You will need to have your own [GitHub](https://github.com/) account and will need to be a member of the [@zamanianlab](https://github.com/orgs/zamanianlab/dashboard) organization in order to gain editing privileges. To edit this document, please follow the instructions in the [Updating](updating.md) page.
