library(dplyr)
setwd("d:\\datascience\\gettingandcleaningdata\\data")
fileurl="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "projectdata.zip")
unzip("projectdata.zip")
setwd("d:\\datascience\\gettingandcleaningdata\\data\\UCI HAR Dataset")
features<-read.table("features.txt",header=FALSE)
colLabels<-as.character(features$V2)
xtest<-read.table("test\\X_test.txt")
colnames(xtest)<-colLabels
subjectest<-read.table("test\\subject_test.txt",header=FALSE)
colnames(subjectest)<-"Subjects"
ytest<-read.table("test\\Y_test.txt",header = FALSE)
colnames(ytest)<-"Activities"
newtestdata<-cbind(subjectest,ytest,xtest)
subjectrain<-read.table("train\\subject_train.txt")
xtrain<-read.table("train\\X_train.txt")
ytrain<-read.table("train\\Y_train.txt")
newtraindata<-cbind(subjectrain,ytrain,xtrain)
colnames(newtraindata)<-names(newtestdata)
test.train<-rbind(newtestdata,newtraindata)
actLabels<-read.table("activity_labels.txt")
newdata<-inner_join(test.train,actLabels,by=c("Activities"="V1"),copy=FALSE)
newdata$Activities<-newdata$V2
newdata$V2<-NULL
columnNames<-colnames(newdata)
valid_col_names <- make.names(columnNames, unique = TRUE, allow_ = TRUE)
colnames(newdata)<-valid_col_names
meandata<-select(newdata,contains("mean",ignore.case=TRUE))
stddata<-select(newdata,contains("std",ignore.case=TRUE))
subject_acticity<-select(newdata,Subjects:Activities)
finaldataset<-cbind(subject_acticity,meandata,stddata)
library(plyr)
Result_Data<-ddply(finaldataset,.(Subjects,Activities),colwise(mean))
setwd("d:\\datascience\\gettingandcleaningdata")
write.table(Result_Data,file="Project_Tidy_Data.txt",row.name=FALSE)

