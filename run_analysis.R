#loading dplyr package
library(dplyr)

#reading features data
features <- read.table("~/R/GettingAndCleaningData/data/UCI HAR Dataset/features.txt", quote="\"")

##PREPARING TRAINING DATA
        ## reading data
        X_train <- read.table("~/R/GettingAndCleaningData/data/UCI HAR Dataset/train/X_train.txt", quote="\"")
        y_train <- read.table("~/R/GettingAndCleaningData/data/UCI HAR Dataset/train/y_train.txt", quote="\"")

        ##y_train<-rename(y_train, Activity=V1)
        subject_train <- read.table("~/R/GettingAndCleaningData/data/UCI HAR Dataset/train/subject_train.txt", quote="\"")

        #assigning features as column names in data
        colnames(X_train)<-features$V2

        #renaming subject's column name
        subject_train<-rename(subject_train, Subject=V1)

        traindata<-cbind(y_train,subject_train,X_train)

## PREAPARING TEST DATA
        
        #reading data 
        X_test <- read.table("~/R/GettingAndCleaningData/data/UCI HAR Dataset/test/X_test.txt", quote="\"")
        y_test <- read.table("~/R/GettingAndCleaningData/data/UCI HAR Dataset/test/y_test.txt", quote="\"")
        ##y_test<-rename(y_test, Activity=V1)
        subject_test <- read.table("~/R/GettingAndCleaningData/data/UCI HAR Dataset/test/subject_test.txt", quote="\"")

        #assigning features as column names in data
        colnames(X_test)<-features$V2

        #renaming subject's column name
        subject_test<-rename(subject_test, Subject=V1)
        
        #merging complete
        testdata<-cbind(y_test,subject_test,X_test)


#MERGING TRAIN AND TEST DATA
CompleteData<-rbind(traindata,testdata)

#reading activity labels
activity_labels <- read.table("~/R/GettingAndCleaningData/data/UCI HAR Dataset/activity_labels.txt", quote="\"")


#getting activity labels in dataset
CompleteData<-inner_join(activity_labels,CompleteData)
#craete vector with column numbers, activity, subject plus columns with "mean"
colnumbers <-c(2,3, grep(pattern = "mean()",x = colnames(CompleteData),fixed=TRUE))
#new dataset 
CompleteDataMean <- CompleteData[,colnumbers]

#calculating averages for all subjcts and activities
AggregatedData <- CompleteDataMean%>%group_by(V2,Subject)%>%summarise_each(funs(mean))
#renaming first 2 columns to be more descriptive
AggregatedData <- AggregatedData%>%rename(Activity=V2,Subject_ID=Subject)

#write txt file on disk
write.table(x = AggregatedData,row.names = FALSE,file = "FinalTidyData.txt")
