library(data.table)
library(dplyr)

workdirectory<-"D:/workspace/R/4project/UCI HAR Dataset"
setwd(workdirectory)

filetoread<-"features.txt"
features<-fread(filetoread)
titlesy<-as.vector(t(features[,2]))

#Test Data
workdirectory<-"D:/workspace/R/4project/UCI HAR Dataset/test"
setwd(workdirectory)

filetoread<-"subject_test.txt"
subjecttestt<-fread(filetoread)

filetoread<-"X_test.txt"
xtrain<-fread(filetoread)

filetoread<-"y_test.txt"
ytrain<-fread(filetoread)

names(ytrain)<-"activity"
names(subjecttestt)<-"subject"
names(xtrain)<-titlesy
a1<-bind_cols(ytrain,subjecttestt,xtrain)

#test1
#test2