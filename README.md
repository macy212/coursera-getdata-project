#README

## Goals of the Project

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## How to run the code
### Prequisites
* R (Recommended version 3.1.1)
* RStudio
* git

### Steps
1. Create a project folder.
2. Run command "git clone https://github.com/ffanzhang/coursera-getdata-project.git", this should create a folder called coursera-getdata-project. Change directory to go into this folder.
3. Download the following data set to the same directory as run_Analysis.R. [(Link to Data)](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
4. Unzip "getdata-projectfiles-UCI HAR Dataset.zip", doing so will create a folder called "UCI HAR Dataset" folder with data that is a child folder of the coursera-getdata-project folder.
5. Open RStudio. In the console, run setwd(directory_name) where directory_name is the location of the folder "coursera-getdata-project".
6. Run source("run_analysis.R"), this will update tidy.txt which contains the cleaned up data.
