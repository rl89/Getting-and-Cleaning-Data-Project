run_analysis <- function(){
     activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE)
     activity_labels[1] <- NULL
     activity_labels[] <- lapply(activity_labels, as.character)
     activity_labels <- activity_labels[,1]
     
     ##print(activity_labels)
     features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
     features[1] <- NULL
     ##print(class(features))
     features[] <- lapply(features, as.character)
     features <- features[,1]
     
     ## TEST DATA
     
     subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
     names(subject_test) <- "Subject"
     ##print(head(subject_test,20))
     ##print(dim(subject_test))
     
     
     x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
     ##print(head(x_test, 10))
     ##print(dim(x_test))
     
     y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
     ##print(head(y_test, 10))
     ##print(dim(y_test))
     
     ## TRAIN DATA
     subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
     names(subject_train) <- "Subject"
     ##print(head(subject_train,20))
     ##print(dim(subject_train))
     
     x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
     ##print(head(x_train, 10))
     ##print(dim(x_train))
     
     y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
     ##print(head(y_train, 10))
     ##print(dim(y_train))
     
     
     ##Combine the data
     testDF <- data.frame()
     testDF <- cbind(subject_test, y_test, x_test)
     ##print(dim(testDF))
     
     trainDF <- data.frame()
     trainDF <- cbind(subject_train, y_train, x_train)
     ##print(dim(trainDF))
     
     mainDF <- data.frame()
     mainDF <- rbind(testDF, trainDF)
     names(mainDF) <- c("Subject", "Activity", features)
     
     mainDF$Activity[mainDF$Activity==1] <- activity_labels[1]
     mainDF$Activity[mainDF$Activity==2] <- activity_labels[2]
     mainDF$Activity[mainDF$Activity==3] <- activity_labels[3]
     mainDF$Activity[mainDF$Activity==4] <- activity_labels[4]
     mainDF$Activity[mainDF$Activity==5] <- activity_labels[5]
     mainDF$Activity[mainDF$Activity==6] <- activity_labels[6]
     
     ##print(dim(mainDF))
     ##print(names(mainDF))
     
     indices1 <- grep("mean()", names(mainDF))
     indices2 <- grep("std()", names(mainDF))
     indices <- sort(c(1, 2, indices1, indices2))
     ##print(indices)
     
     ##print(head(mainDF))

     mainDFSubset <- mainDF[,indices]
     mainDFSubset <- ddply(mainDFSubset, c("Subject","Activity"), numcolwise(mean))
     ##print(head(mainDFSubset,16))
     write.table(mainDFSubset, "Project.txt", row.name = FALSE)
     
}
