# Getting-and-Cleaning-Data-Course-Project
Coursera Getting and Cleaning Data Course : W4 Project submission

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set.

# Criteria
  1. The submitted data set is tidy.
  2. The Github repo contains the required scripts.
  3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
  4. The README that explains the analysis files is clear and understandable.
  5. The work submitted for this project is the work of the student who submitted it.

# Getting and Cleaning Data Course Project:

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Sample output of the script:
https://goo.gl/SLkXXA

# Description of how run_analysis.R script is built.

1. Script downloads file from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzips to current working directory, then changes output to new working directory
3. Load each important file to the Global Environment (this may take some time, as the files are big for PC)
	
	./test/X_test.txt
	
	./train/X_train.txt
	
	./test/subject_test.txt
	
	./train/subject_train.txt
	
	./test/y_test.txt
	
	./train/y_train.txt
	
	./features.txt
	
	./activity_labels.txt
4. Cleans the Features (variables of the measurements).
	Provides more descriptive names to variables
5. Joins the tables of the Participants, the Activity they performed, the Activity Type (was it a test or a training environment) and the Measurements of variables
6. Subsets the data for Standard Deviation and Mean values, and stores it in AllResults variable
7. Subsets AllResults and calculates MEAN of all variables, stores in AllResults_mean variable
8. Exports both AllResults and AllResults_mean to txt files, and cleans the Global Environment
	
	../UCI HAR CleanData
	
	../UCI HAR CleanData/AllResults.txt
	
	../UCI HAR CleanData/AllResults_mean.txt
9. Attempts to open the folder containing the output (Windows PC only)
