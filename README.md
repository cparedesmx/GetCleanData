# Getting and Cleaning Data Course Project

This repo contains both script and code book for the Course Project for Getting 
and Cleaning Data. A brief description of both files is provided below.

[Code book][codebook]: This file contains a description of the data used and the 
transformations and summaries calculated to produce the final output.

[R script][script]: This files contains R code to reproduce the analysis 
undertaken to produce the final output. In order to run the script, the 
[dataset] has to be unzipped keeping the directory structure. The script needs 
to be one level up from the directory 'UCI HAR Dataset'. There are no functions 
defined in the script. To run it, just source() the file and it will execute the 
analysis. This script was developed in R 3.2.2 with dplyr 0.4.3 attached (a 
library to manage data frames). It may be compatible with other versions of R 
and dplyr, but it hasn't been tested.

[//]:# (Links used in this document)

[dataset]: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
[codebook]: <./CodeBook.md>
[script]: <./run_analysis.R>