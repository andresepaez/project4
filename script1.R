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
subject<-fread(filetoread)

filetoread<-"X_test.txt"
x<-fread(filetoread)

filetoread<-"y_test.txt"
y<-fread(filetoread)

names(y)<-"activity"
names(subject)<-"subject"
names(x)<-titlesy
a1<-bind_cols(y,subject,x)
a1$activity[a1$activity==1]<-"WALKING"
a1$activity[a1$activity==2]<-"WALKING_UPSTAIRS"
a1$activity[a1$activity==3]<-"WALKING_DOWNSTAIRS"
a1$activity[a1$activity==4]<-"SITTING"
a1$activity[a1$activity==5]<-"STANDING"
a1$activity[a1$activity==6]<-"LAYING"

workdirectory<-"D:/workspace/R/4project/UCI HAR Dataset/train"
setwd(workdirectory)

filetoread<-"subject_train.txt"
subject<-fread(filetoread)

filetoread<-"X_train.txt"
x<-fread(filetoread)

filetoread<-"y_train.txt"
y<-fread(filetoread)

names(y)<-"activity"
names(subject)<-"subject"
names(x)<-titlesy
a2<-bind_cols(y,subject,x)
a2$activity[a2$activity==1]<-"WALKING"
a2$activity[a2$activity==2]<-"WALKING_UPSTAIRS"
a2$activity[a2$activity==3]<-"WALKING_DOWNSTAIRS"
a2$activity[a2$activity==4]<-"SITTING"
a2$activity[a2$activity==5]<-"STANDING"
a2$activity[a2$activity==6]<-"LAYING"
a3<-bind_rows(a1,a2)

rm(a1,a2,features,subject,x,xtrain,y)
c1<-c(1,2,grep("mean",colnames(a3)),grep("Mean",colnames(a3)),grep("std",colnames(a3)))

a4<-select(a3,c1)
names(a4)<-gsub("()","",names(a4),fixed=TRUE)
names(a4)<-gsub("BodyAcc","BA",names(a4),fixed=TRUE)
names(a4)<-gsub("BodyGyro","BG",names(a4),fixed=TRUE)
names(a4)<-gsub("GravityAcc","GrA",names(a4),fixed=TRUE)

a5<-group_by(a4,a4$subject,a4$activity)

a5<-a4%>%group_by(subject,activity)%>%summarise_all(mean)


#test1
#test2