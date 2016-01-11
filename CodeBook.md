# Codebook

## Introduction

This document contains is a description of the data used and the
transformations and summaries calculated to produce the final output.

## Data Source

The data used for this project was taken from the ["Human Activity Recognition
Using Smartphones Data Set"] [UCI] [1]. However, the dataset itself was 
downloaded from the following web address on January 08, 2016:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Transformations and Summaries

The [dataset] downloaded for this project comes split into two separate sets 
(training and test). Each set consists of 3 files with subjects, activities and 
measurements. These files were read into 3 separate tables, setting the column 
names accordingly to the description provided by [1][UCI]. Also, only the 
measurements that are means or standard deviations (i.e. contain *mean* or 
*std* in the column name) were kept for further analysis, all other columns were 
discarded. 

The next step consisted in merging both training and test data frames to create 
a single data frame (binding matching tables by row). This single data frame was 
then summarized by taking the 
mean of each of the measurements described above for each combination of subject 
and activity. Therefore, the measurements in the resulting data frame are means 
of means and means of standard deviations. The variables contained in it are 
listed below.

This analysis can be reproduced by running this [run_analysis.R][script] in R.
Make sure to create the directory structure as stated at the beginning of the 
script before attempting to run it.

## Variables

The output of this analysis consists of a data frame with 81 columns. The first 
column is Integer. Column 2 is Factor. All other columns are Numeric.

The levels of column 2 are listed below. The name of the 81 columns is listed 
after Activity levels.

### Activity levels

1. WALKING
2. WALKING UPSTAIRS
3. WALKING DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

### Fields

1. subject
2. activity
3. tBodyAcc.mean.X
4. tBodyAcc.mean.Y
5. tBodyAcc.mean.Z
6. tBodyAcc.std.X
7. tBodyAcc.std.Y
8. tBodyAcc.std.Z
9. tGravityAcc.mean.X
10. tGravityAcc.mean.Y
11. tGravityAcc.mean.Z
12. tGravityAcc.std.X
13. tGravityAcc.std.Y
14. tGravityAcc.std.Z
15. tBodyAccJerk.mean.X
16. tBodyAccJerk.mean.Y
17. tBodyAccJerk.mean.Z
18. tBodyAccJerk.std.X
19. tBodyAccJerk.std.Y
20. tBodyAccJerk.std.Z
21. tBodyGyro.mean.X
22. tBodyGyro.mean.Y
23. tBodyGyro.mean.Z
24. tBodyGyro.std.X
25. tBodyGyro.std.Y
26. tBodyGyro.std.Z
27. tBodyGyroJerk.mean.X
28. tBodyGyroJerk.mean.Y
29. tBodyGyroJerk.mean.Z
30. tBodyGyroJerk.std.X
31. tBodyGyroJerk.std.Y
32. tBodyGyroJerk.std.Z
33. tBodyAccMag.mean
34. tBodyAccMag.std
35. tGravityAccMag.mean
36. tGravityAccMag.std
37. tBodyAccJerkMag.mean
38. tBodyAccJerkMag.std
39. tBodyGyroMag.mean
40. tBodyGyroMag.std
41. tBodyGyroJerkMag.mean
42. tBodyGyroJerkMag.std
43. fBodyAcc.mean.X
44. fBodyAcc.mean.Y
45. fBodyAcc.mean.Z
46. fBodyAcc.std.X
47. fBodyAcc.std.Y
48. fBodyAcc.std.Z
49. fBodyAcc.meanFreq.X
50. fBodyAcc.meanFreq.Y
51. fBodyAcc.meanFreq.Z
52. fBodyAccJerk.mean.X
53. fBodyAccJerk.mean.Y
54. fBodyAccJerk.mean.Z
55. fBodyAccJerk.std.X
56. fBodyAccJerk.std.Y
57. fBodyAccJerk.std.Z
58. fBodyAccJerk.meanFreq.X
59. fBodyAccJerk.meanFreq.Y
60. fBodyAccJerk.meanFreq.Z
61. fBodyGyro.mean.X
62. fBodyGyro.mean.Y
63. fBodyGyro.mean.Z
64. fBodyGyro.std.X
65. fBodyGyro.std.Y
66. fBodyGyro.std.Z
67. fBodyGyro.meanFreq.X
68. fBodyGyro.meanFreq.Y
69. fBodyGyro.meanFreq.Z
70. fBodyAccMag.mean
71. fBodyAccMag.std
72. fBodyAccMag.meanFreq
73. fBodyBodyAccJerkMag.mean
74. fBodyBodyAccJerkMag.std
75. fBodyBodyAccJerkMag.meanFreq
76. fBodyBodyGyroMag.mean
77. fBodyBodyGyroMag.std
78. fBodyBodyGyroMag.meanFreq
79. fBodyBodyGyroJerkMag.mean
80. fBodyBodyGyroJerkMag.std
81. fBodyBodyGyroJerkMag.meanFreq

## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. 
Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using 
Smartphones. 21th European Symposium on Artificial Neural Networks, 
Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 
24-26 April 2013.

[//]:# (Links used in this document)

[UCI]: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
[dataset]: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
[script]: <./run_analysis.R>