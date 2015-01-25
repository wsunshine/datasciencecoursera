Data collect and clean of Smartphones Data Set  
Wang,haipeng
This project is to handle the real human activity recognition data which are from the smart phone.demonstrating the steps of how to collect, work with, and clean a data set. The main tasks of this project including:

1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


1.	Merges the training and the test sets to create one data set.
	The experiments have been carried out with a group of 30 volunteers.Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), wearing a smartphone on the waist. Using its embedded accelerometer and gyroscope, there captured 3-axial linear acceleration and 3-axial angular velocity. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. This part of project is to merges the training and the test sets to create one complete data set.

	According the README.txt, the data is included in the following 
	- 'train/X_train.txt': Training set.
	- 'test/X_test.txt': Test set.
	- 'activity_labels.txt': Links the class labels with their activity name.
	- 'train/y_train.txt': Training labels.
	- 'test/y_test.txt': Test labels.
	- ‘train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

	I had already download the data set and set the R's work directory to the directory where data set saved. My working environment is windows 8.R language edition is 3.1.1
	At first, I read the data in train and test individually.X file contain the data,y file contains labels. subject_train file contains subject 
	Then ,I use cbind() to merge subjects, label and data in each folder. 
	Finally,I use rbind() to merge the test data and train data

2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
	First, I read all 561 features as string ,stored the result in 'features'. assign the  561 variables name with 561 features 
    Then ,using grep() and union() to get the numeric list which contains the index of feature number that has "mean" or "std" in its name,taskshere comes out 79 results.using index to Extracts only the measurements on the mean and standard deviation for each measurement.
    Finallyinally I get the new data set that contains subject, activity label and extraction data
		
3.	Uses descriptive activity names to name the activities in the data set
	According the activity_labels.txt description, each label of activity means:
	1 WALKING,2 WALKING_UPSTAIRS,3 WALKING_DOWNSTAIRS 4 SITTING,5 STANDING, 6 LAYING
    I Use the sub() to substitute the label with corresponding descriptive activity names 
	
4.	Appropriately labels the data set with descriptive variable names. 
	Names of variables should be
        -All lower case when possible
        -Descriptive(Diagnosis versus Dx)
        -Not duplicated
        -Not have underscores or dots or white spaces
	To get this goal. there are 4 steps I took
	First,I assign the first 2 columns of new data set descriptive name-subject, activity
	Second, substitute the 79 results name that have the first letter as f in label with frequency,t with time and string "acc" with accelerator
    Third, I get rid of the "()" and change "BodyBody" to "Body" using gsub
	
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
   At this part, I use reshape2 library ,with melt() and dcast() the dataset to obtain the final tidy dataset