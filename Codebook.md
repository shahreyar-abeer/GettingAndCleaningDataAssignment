# Codebook

## Human Activity Recognition Using Smartphones Dataset(Version 1.0)

### Description of the data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy SII) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. For more information about the data, please visit [here]()  

### The raw data

#### For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.  

The following files are available for the train and test data. Their descriptions are equivalent.  

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

#### Variables

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range  
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal  
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:  

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

The complete list of variables of each feature vector is available [here]()

### Obtaining the tidy data set

* In order to obtain the tidy set, we first merged the training and the test data into one data set.
* We were only interested in the **mean()** and **std()** values. So, we only kept these  variables.

#### Description of the variables

* The variable names in the raw set were not descriptive and so they are made as descriptive as possible by substituting as follows-  

tBody -> timeBody  
fBody -> frequencyBody  
tGravity -> timeGravity  
Acc -> Acceleration  
Gyro -> AngularVelocity  
AccJerk -> LinearJerk  
GyroJerk -> AngularJerk  
Mag -> Magnitude  

The names of the variables after renaming are:

Subject: Indicates the subject under study
Activity: Indicates the activity under study
timeBodyAcceleration-XYZ  
timeGravityAcceleration-XYZ  
timeBodyAccelerationJerk-XYZ  
timeBodyAngularVelocity-XYZ  
timeBodyAngularJerk-XYZ  
timeBodyAccelerationMagnitude  
timeGravityAccelerationMagnitude  
timeBodyAccelerationJerkMagnitude  
timeBodyAngularVelocityMagnitude  
timeBodyAngularJerkMagnitude  
frequencyBodyAcceleration-XYZ  
frequencyBodyAccelerationJerk-XYZ  
frequencyBodyAngularVelocity-XYZ  
frequencyBodyAccelerationMagnitude  
frequencyBodyAccelerationJerkMagnitude  
frequencyBodyAngularVelocityMagnitude  
frequencyBodyAngularJerkMagnitude  

"-XYZ" indicates 3 axial directions in the X, Y, Z axes.  

Since we are only interested in the *mean()* and *std()* values, only these two are included in the data set.  

*Note that,* in the data set, each axes, X, Y, Z are represented in a seperate column.

* Then we calculated the mean of the observations for each activity under each subject and saved that as one observation in the tidy data set. In this way, we calculated the 180 observations.
* Finally, the tidy data set was obtained by changing the activity labels.  

***
