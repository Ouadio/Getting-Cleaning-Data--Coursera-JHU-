#Code Book
This document underlines the main informations to understand the input and output of the run_analysis.R script

##Overview
Source of the original raw Data: 

* Code book: [CodeBook](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)      

* Data file: [Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  

Data sets used in this project:
* 'train/X_train.txt': *Training set.*

* 'train/y_train.txt': *Training labels.*

* 'test/X_test.txt': *Test set.*

* 'test/y_test.txt': *Test labels.*

* 'features.txt': *List of all features.*

* 'activity_labels.txt': *Links the class labels with their activity name.*

* 'train/subject_train.txt': *Rows identifie the subject who performed the activity [1-30].*

##About the variables:
The variable names (the features' labels) have been modified to be more descriptive and clear.

* Subject: The subjects who performed the activity [1-30]

* Activity: The 6 activities performed in the experience

The features variables' names are combinations of the following words:

* Time: Time domain signals

* Freq: Frequency domain signals

* Acc: Acceleration signal

* Gyro: Gyroscope signal

* Mean: Average of the mean for a specific subject and specific activity

* SD: Average of the Standard Deviation for a specific subject and specific activity

* Jerk: Jerk signals obtained by derivation in time 

* Mag: Magnitude of the signal calculated using the Euclidean norm

* XYZ: X, Y or Z Axis

* Gravity: Gravity component of the signal

* Body: Body component of the signal



