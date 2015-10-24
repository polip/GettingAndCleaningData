---
title: "CodeBook "
author: "Ivan Lozo"
date: "24. listopada 2015."
output: html_document
---

##Project Description

This is a project of collecting and transforming data collected from the accelerometers from the Samsung Galaxy S smartphone for Coursera "Getting and cleaning data" course.

##Collection of the raw data

Raw data was collected from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.
ZIP file contains text files with data already partitioned on training and testing parts, separately for the mesurements, subjects and type of activity.

##Creating the tidy datafile
In order to create tidy dataset, training and testing datasets with measurements should be merged together. Before merging training and testing datasets they should be prepared separately by naming measurements columns with features and merging measurements data with data on activity and subject ID.

After merging training and test dataset only measurements with the "mean()" were extracted in order to calcalate means grouped by activity and subject.

Readme document with description:
https://github.com/polip/GettingAndCleaningData/blob/master/README.md

R script for preparation of tidy dataset:
https://github.com/polip/GettingAndCleaningData


##Description of the variables in the 



`{r}
summary(AggregatedData)

`

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
