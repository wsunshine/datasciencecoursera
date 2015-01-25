run_analysis<-function(){
        #  1.Merges the training and the test sets to create one data set.
    
        #I had already download the data set and set the R's work directory to 
        #the directory where data set saved.
        #read the data in train and test individually.X file contain the data,y file
        #contains labels. I use cbind() to merge label and data in each folder. 
        #then using rbind() to merge the test data and train data
      
        trainX <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
        trainy <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
        trainsubject<-read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
        traindata <-cbind(trainsubject,trainy,trainX)
        testX <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
        testy <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
        testsubject<-read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
        testdata <-cbind(testsubject,testy,testX)
        data<-rbind(traindata,testdata)
        #assign the name to merged data.The first 2 should be subject and activitylabel.
        #From 3th to 563th's column name come from feature.txt
        features <- 
        #   2.Extracts only the measurements on the mean and standard deviation for each measurement. 
        #read all 561 features as string
                features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors=FALSE,header = FALSE)
        #assign the 'data'last 561 variables name with 561 features which stored in features[,2]
        featuredata<-data[,3:563]
        names(featuredata) <-features[,2]
        
        #using grep() and union() to find the numeirc list which contains the index of feature number that has "mean" or "std" in its name
        #there comes out 79 results
        meanfeatureindex <-grep("mean",features[,2])
        stdfeatureindex <-grep("std",features[,2])
        unionfeatureindex <-union(meanfeature,stdfeature)
        #using index to Extracts only the measurements on the mean and standard deviation for each measurement.
        #finally get the newdata that contains subject, activity label and extraction data
        filterdata<-featuredata[,unionfeatureindex]
        newdata<-cbind(data[,1:2],filterdata)
        
        # 3.Uses descriptive activity names to name the activities in the data set.
        # The 2nd column of newdata is activity label.According the activity_labels.txt 
        # description, 1 WALKING,2 WALKING_UPSTAIRS,3 WALKING_DOWNSTAIRS
        #              4 SITTING,5 STANDING, 6 LAYING
        # Using the sub() to substitue the label with corresponding descriptive activity names 
       
        newdata[,2]=as.character(newdata[,2])
        newdata[,2]=sub("1","WALKING",newdata[,2])
        newdata[,2]=sub("2","WALKING_UPSTAIRS",newdata[,2])
        newdata[,2]=sub("3","WALKING_DOWNSTAIRS",newdata[,2])
        newdata[,2]= sub("4","SITTING",newdata[,2])
        newdata[,2]=sub("5","STANDING",newdata[,2])
        newdata[,2]=sub("6","LAYING",newdata[,2])
        # 4.Appropriately labels the data set with descriptive variable names. 
        #Names of variables should be
        #-All lower case when possible
        #-Descriptive(Diagnosis versus Dx)
        #-Not duplicated
        #-Not have underscores or dots or white spaces
        oldnames<-colnames(newdata)
      #Assign the first 2 columns descriptive name
      oldnames = sub("V1.1","activity",oldnames)
      oldnames = sub("V1","subject",oldnames)
      #substitute the 79 results name the first f/t in label with frequency,t with time
      #acc with accelerator
      feathername=oldnames[3:81]
      feathernamef<- sub("f","frequency", feathername)
      feathernameft <- sub("t","time",feathernamef)
      feathernamefta <-sub("[aA]cc","accelerator",feathernameft)
      #get rid of the "()" and change "BodyBody" to "Body"
      feathernameftag<-gsub("\\(\\)","",feathernamefta) 
      feathernameftagb <- gsub("BodyBody","Body",feathernameftag) 
        #         5.From the data set in step 4, creates a second, independent tidy data set
        #         with the average of each variable for each activity and each subject.
        
}