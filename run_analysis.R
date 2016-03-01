setwd("C:/USERS/MILA_/DOCUMENTS/Coursera")

require(dplyr)
#Create table of Activity Types
activitylabels <- read.table("./Data/activity_labels.txt",
                             col.names=c("ActivityCode","Activity"))
#Create table of table features (row headings)
features <- read.table("./Data/features.txt",
                       col.names=c("EntryNum","Measurement"),
                       stringsAsFactors = F)
#Load X_TRAIN.TXT
x_train<-read.table("./Data/train/X_Train.txt", 
                  col.names=features$Measurement,
                  stringsAsFactors = F)
x_train<-x_train[,grep("\\.mean\\.|\\.std\\.",names(x_train))] #Only keep columns that contain '.mean.' or '.std.'

#Load Y_TRAIN.TXT
y_train<-read.table("./Data/train/y_train.txt", 
                    stringsAsFactors = T)
names(y_train)<-"ActivityCode"
y_train$ActivityCode <- factor(y_train$ActivityCode)
levels(y_train$ActivityCode) <- activitylabels$Activity

#Load SUBJECT_TRAIN.TXT
subject_train<-read.table("./Data/train/subject_train.txt", 
                    stringsAsFactors = T, col.names = "subject")



#Load X_TEST.TXT
x_test<-read.table("./Data/test/X_Test.txt", 
                  col.names=features$Measurement,
                  stringsAsFactors = F)
x_test<-x_test[,grep("\\.mean\\.|\\.std\\.",names(x_test))] #Only keep columns that contain '.mean.' or '.std.'

#Load Y_test.TXT
y_test<-read.table("./Data/test/y_test.txt", 
                    stringsAsFactors = T)
names(y_test)<-"ActivityCode"
y_test$ActivityCode <- factor(y_test$ActivityCode)
levels(y_test$ActivityCode) <- activitylabels$Activity

#Load SUBJECT_TEST.TXT
subject_test<-read.table("./Data/test/subject_test.txt", 
                          stringsAsFactors = T, col.names = "subject")

#Assemble Training Set
x_train$ActivityCode <- y_train$ActivityCode
x_train$subject <- subject_train$subject

#Assemble Test set
x_test$ActivityCode <- y_test$ActivityCode
x_test$subject <- subject_test$subject

#Combine Data
combined_data <- rbind(x_train,x_test)

#Create Averages by Subject and Activity
combined_data %>% 
    select(everything()) %>% 
    group_by(subject,ActivityCode) %>% 
=======
setwd("./Coursera/GACD-Project")

require(dplyr)
#Create table of Activity Types
activitylabels <- read.table("./Data/activity_labels.txt",
                             col.names=c("ActivityCode","Activity"))
#Create table of table features (row headings)
features <- read.table("./Data/features.txt",
                       col.names=c("EntryNum","Measurement"),
                       stringsAsFactors = F)
#Load X_TRAIN.TXT
x_train<-read.table("./Data/train/X_Train.txt", 
                  col.names=features$Measurement,
                  stringsAsFactors = F)
x_train<-x_train[,grep("\\.mean\\.|\\.std\\.",names(x_train))] #Only keep columns that contain '.mean.' or '.std.'

#Load Y_TRAIN.TXT
y_train<-read.table("./Data/train/y_train.txt", 
                    stringsAsFactors = T)
names(y_train)<-"ActivityCode"
y_train$ActivityCode <- factor(y_train$ActivityCode)
levels(y_train$ActivityCode) <- activitylabels$Activity

#Load SUBJECT_TRAIN.TXT
subject_train<-read.table("./Data/train/subject_train.txt", 
                    stringsAsFactors = T, col.names = "subject")



#Load X_TEST.TXT
x_test<-read.table("./Data/test/X_Test.txt", 
                  col.names=features$Measurement,
                  stringsAsFactors = F)
x_test<-x_test[,grep("\\.mean\\.|\\.std\\.",names(x_test))] #Only keep columns that contain '.mean.' or '.std.'

#Load Y_test.TXT
y_test<-read.table("./Data/test/y_test.txt", 
                    stringsAsFactors = T)
names(y_test)<-"ActivityCode"
y_test$ActivityCode <- factor(y_test$ActivityCode)
levels(y_test$ActivityCode) <- activitylabels$Activity

#Load SUBJECT_TEST.TXT
subject_test<-read.table("./Data/test/subject_test.txt", 
                          stringsAsFactors = T, col.names = "subject")

#Assemble Training Set
x_train$ActivityCode <- y_train$ActivityCode
x_train$subject <- subject_train$subject

#Assemble Test set
x_test$ActivityCode <- y_test$ActivityCode
x_test$subject <- subject_test$subject

#Combine Data
combined_data <- rbind(x_train,x_test)

#Create Averages by Subject and Activity
combined_data %>% 
    select(everything()) %>% 
    group_by(subject,ActivityCode) %>% 
    summarise_each(funs(mean)) -> dfAverages
