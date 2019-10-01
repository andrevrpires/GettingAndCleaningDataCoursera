# Human Activity Recognition Using Smartphones Dataset
### Cleaned Version


This repo contains the cleaned version of the dataset found in

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The work here is an assignment to the course "Getting and Cleaning Data" from Coursera.

Above is the original dataset description

#######################################################

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment."

#######################################################

Besides this information, the original dataset contains a description of the 561-feature vector

#######################################################

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ\
tGravityAcc-XYZ\
tBodyAccJerk-XYZ\
tBodyGyro-XYZ\
tBodyGyroJerk-XYZ\
tBodyAccMag\
tGravityAccMag\
tBodyAccJerkMag\
tBodyGyroMag\
tBodyGyroJerkMag\
fBodyAcc-XYZ\
fBodyAccJerk-XYZ\
fBodyGyro-XYZ\
fBodyAccMag\
fBodyAccJerkMag\
fBodyGyroMag\
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value\
std(): Standard deviation\
mad(): Median absolute deviation\
max(): Largest value in array\
min(): Smallest value in array\
sma(): Signal magnitude area\
energy(): Energy measure. Sum of the squares divided by the number of values.\
iqr(): Interquartile range\
entropy(): Signal entropy\
arCoeff(): Autorregresion coefficients with Burg order equal to 4\
correlation(): correlation coefficient between two signals\
maxInds(): index of the frequency component with largest magnitude\
meanFreq(): Weighted average of the frequency components to obtain a mean frequency\
skewness(): skewness of the frequency domain signal\
kurtosis(): kurtosis of the frequency domain signal\
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.\
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean\
tBodyAccMean\
tBodyAccJerkMean\
tBodyGyroMean\
tBodyGyroJerkMean"

#######################################################

Having this data, the task was to create a R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The resulting dataset variable names are below. The first two are

 [1] "subject" - identifies the person who performed the movements (1 to 30) 
 [2] "activity" - the body activity being measured (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
 
 The other variable names describe multiple information for each column. These pieces of information are separated in:
 
- time domain or frequency domain\
- body or gravity\
- accelerometer or gyroscope\
- jerk\
- magnitude\
- mean or standarddeviation\
- xaxis, yaxis or zaxis
 
 The measurement units are:
 
- gravity standard units g for the accelerometer\
- radians/second for the gyroscope
                                                
                                                          
 [3] "timedomain-body-accelerometer-mean-xaxis"                           
 [4] "timedomain-body-accelerometer-mean-yaxis"                           
 [5] "timedomain-body-accelerometer-mean-zaxis"                           
 [6] "timedomain-body-accelerometer-standarddeviation-xaxis"              
 [7] "timedomain-body-accelerometer-standarddeviation-yaxis"              
 [8] "timedomain-body-accelerometer-standarddeviation-zaxis"              
 [9] "timedomain-gravity-accelerometer-mean-xaxis"                        
[10] "timedomain-gravity-accelerometer-mean-yaxis"                        
[11] "timedomain-gravity-accelerometer-mean-zaxis"                        
[12] "timedomain-gravity-accelerometer-standarddeviation-xaxis"           
[13] "timedomain-gravity-accelerometer-standarddeviation-yaxis"           
[14] "timedomain-gravity-accelerometer-standarddeviation-zaxis"           
[15] "timedomain-body-accelerometer-jerk-mean-xaxis"                      
[16] "timedomain-body-accelerometer-jerk-mean-yaxis"                      
[17] "timedomain-body-accelerometer-jerk-mean-zaxis"                      
[18] "timedomain-body-accelerometer-jerk-standarddeviation-xaxis"         
[19] "timedomain-body-accelerometer-jerk-standarddeviation-yaxis"         
[20] "timedomain-body-accelerometer-jerk-standarddeviation-zaxis"         
[21] "timedomain-body-gyroscope-mean-xaxis"                               
[22] "timedomain-body-gyroscope-mean-yaxis"                               
[23] "timedomain-body-gyroscope-mean-zaxis"                               
[24] "timedomain-body-gyroscope-standarddeviation-xaxis"                  
[25] "timedomain-body-gyroscope-standarddeviation-yaxis"                  
[26] "timedomain-body-gyroscope-standarddeviation-zaxis"                  
[27] "timedomain-body-gyroscope-jerk-mean-xaxis"                          
[28] "timedomain-body-gyroscope-jerk-mean-yaxis"                          
[29] "timedomain-body-gyroscope-jerk-mean-zaxis"                          
[30] "timedomain-body-gyroscope-jerk-standarddeviation-xaxis"             
[31] "timedomain-body-gyroscope-jerk-standarddeviation-yaxis"             
[32] "timedomain-body-gyroscope-jerk-standarddeviation-zaxis"             
[33] "timedomain-body-accelerometer-magnitude-mean"                       
[34] "timedomain-body-accelerometer-magnitude-standarddeviation"          
[35] "timedomain-gravity-accelerometer-magnitude-mean"                    
[36] "timedomain-gravity-accelerometer-magnitude-standarddeviation"       
[37] "timedomain-body-accelerometer-jerk-magnitude-mean"                  
[38] "timedomain-body-accelerometer-jerk-magnitude-standarddeviation"     
[39] "timedomain-body-gyroscope-magnitude-mean"                           
[40] "timedomain-body-gyroscope-magnitude-standarddeviation"              
[41] "timedomain-body-gyroscope-jerk-magnitude-mean"                      
[42] "timedomain-body-gyroscope-jerk-magnitude-standarddeviation"         
[43] "frequencydomain-body-accelerometer-mean-xaxis"                      
[44] "frequencydomain-body-accelerometer-mean-yaxis"                      
[45] "frequencydomain-body-accelerometer-mean-zaxis"                      
[46] "frequencydomain-body-accelerometer-standarddeviation-xaxis"         
[47] "frequencydomain-body-accelerometer-standarddeviation-yaxis"         
[48] "frequencydomain-body-accelerometer-standarddeviation-zaxis"         
[49] "frequencydomain-body-accelerometer-meanfrequency-xaxis"             
[50] "frequencydomain-body-accelerometer-meanfrequency-yaxis"             
[51] "frequencydomain-body-accelerometer-meanfrequency-zaxis"             
[52] "frequencydomain-body-accelerometer-jerk-mean-xaxis"                 
[53] "frequencydomain-body-accelerometer-jerk-mean-yaxis"                 
[54] "frequencydomain-body-accelerometer-jerk-mean-zaxis"                 
[55] "frequencydomain-body-accelerometer-jerk-standarddeviation-xaxis"    
[56] "frequencydomain-body-accelerometer-jerk-standarddeviation-yaxis"    
[57] "frequencydomain-body-accelerometer-jerk-standarddeviation-zaxis"    
[58] "frequencydomain-body-accelerometer-jerk-meanfrequency-xaxis"        
[59] "frequencydomain-body-accelerometer-jerk-meanfrequency-yaxis"        
[60] "frequencydomain-body-accelerometer-jerk-meanfrequency-zaxis"        
[61] "frequencydomain-body-gyroscope-mean-xaxis"                          
[62] "frequencydomain-body-gyroscope-mean-yaxis"                          
[63] "frequencydomain-body-gyroscope-mean-zaxis"                          
[64] "frequencydomain-body-gyroscope-standarddeviation-xaxis"             
[65] "frequencydomain-body-gyroscope-standarddeviation-yaxis"             
[66] "frequencydomain-body-gyroscope-standarddeviation-zaxis"             
[67] "frequencydomain-body-gyroscope-meanfrequency-xaxis"                 
[68] "frequencydomain-body-gyroscope-meanfrequency-yaxis"                 
[69] "frequencydomain-body-gyroscope-meanfrequency-zaxis"                 
[70] "frequencydomain-body-accelerometer-magnitude-mean"                  
[71] "frequencydomain-body-accelerometer-magnitude-standarddeviation"     
[72] "frequencydomain-body-accelerometer-magnitude-meanfrequency"         
[73] "frequencydomain-body-accelerometer-jerk-magnitude-mean"             
[74] "frequencydomain-body-accelerometer-jerk-magnitude-standarddeviation"
[75] "frequencydomain-body-accelerometer-jerk-magnitude-meanfrequency"    
[76] "frequencydomain-body-gyroscope-magnitude-mean"                      
[77] "frequencydomain-body-gyroscope-magnitude-standarddeviation"         
[78] "frequencydomain-body-gyroscope-magnitude-meanfrequency"             
[79] "frequencydomain-body-gyroscope-jerk-magnitude-mean"                 
[80] "frequencydomain-body-gyroscope-jerk-magnitude-standarddeviation"    
[81] "frequencydomain-body-gyroscope-jerk-magnitude-meanfrequency" 
