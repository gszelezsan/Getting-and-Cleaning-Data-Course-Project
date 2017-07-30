# Project CodeBook

Description of  variables, the data and transformations to get the clean data.


# 1. Description of the study: 
Human Activity Recognition database built from the recordings of 30 subjects,
performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# 2. Link to the collected (and used) data: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# 3. Dataset Characteristics:  

	Multivariate, Time-Series
	Number of Instances: 10299
	Area: Computer
	Attribute Characteristics: N/A
	Number of Attributes: 561
	Date Donated: 2012-12-10
	Associated Tasks: Classification, Clustering
	Missing Values?: N/A

# 4. The dataset includes the following files:

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

# 5. Sources:

Lichman, M. (2013). UCI Machine Learning Repository [http://archive.ics.uci.edu/ml] 
Irvine, CA: University of California, School of Information and Computer Science.

Authors:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
A Public Domain Dataset for Human Activity Recognition Using Smartphones. 
21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning
ESANN 2013. Bruges, Belgium 24-26 April 2013.
