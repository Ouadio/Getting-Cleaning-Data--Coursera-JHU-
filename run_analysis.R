# Assuming that the actual working directory is "./UCI HAR Dataset"

library(dplyr)
library(plyr)
library(tidyr)

# Step 1
# Loading and preparing the required data: 

train<-read.table("train/X_train.txt")
test<-read.table("test/X_test.txt")
subject_train<-readLines("train/subject_train.txt")
subject_test<-readLines("test/subject_test.txt")
activity_train<-readLines("train/y_train.txt")
activity_test<-readLines("test/y_test.txt")
features<-readLines("features.txt")
activity_labels<-readLines("activity_labels.txt")

# Step 2
# Selecting only the indexes of features storing the mean or standard deviation for each measurement

features<-sub("[0-9]+ ", replacement = "", features)
pattern1<-"-(mean|std)\\()"    
selectionIndex<-grep(pattern = pattern1, features)

# Preparing the training data (Extract+Label+Join to activity and subject)
# For the training data

train<-train[selectionIndex]                      
names(train)<-features[selectionIndex]            
train<-cbind(subject_train,activity_train,train) 
names(train)[1:2]<-c("subject","activity")

# For the test data

test<-test[selectionIndex]
names(test)<-features[selectionIndex]
test<-cbind(subject_test, activity_test, test)
names(test)[1:2]<-c("subject","activity")

# Turning the factor-class variables into characters to avoid errors:
test[,1]<-as.character(test[,1])    ;  test[,2]<-as.character(test[,2])
train[,1]<-as.character(train[,1])  ;  train[,2]<-as.character(train[,2])

# Stepc3
# Merging train and test datasets

total<-rbind(train, test)

# Providing the "total" data with Descriptive activity names and clear variable names

activity_labels<-sub("[0-9] ", x=activity_labels, replacement = "")
total<-mutate(total, activity=activity_labels[as.numeric(activity)])
names(total)<-sub("^t","Time", names(total))
names(total)<-sub("^f","Freq", names(total))
names(total)<-gsub(pattern="-|\\()","", names(total))
names(total)<-names(total) %>% sub( pattern = "mean", replacement = "Mean_") %>% sub(pattern="std", replacement="SD_")
total0<-total

# Step 4
# Creating a NEW variable Subj_Acty containing subject_activity pairs to group data on it

total<- total %>% mutate(Subj_Acty=paste(subject, activity, sep = "_")) %>% select(69,3:68)
total<-group_by(total, Subj_Acty)

# Calculating the average of each columns for each pair (subject,activity)

total<-summarise_each(total, funs(mean))

# Separating the Double-variable column "Subj_Acty" to make data tidy

total<-separate(total, col = "Subj_Acty", into = c("Subject","Activity"))

# Arrange final data and write it in a txt file

total<-arrange(total, Activity)
write.table(total, file = "TidyAverage.txt", row.names = FALSE)