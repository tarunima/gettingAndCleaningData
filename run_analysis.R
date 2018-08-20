##-------------------------------------------------------
# Getting and Cleaning Data Course Project
#
# Tarunima Prabhakar
# 19 Aug 2018
#
#--------------------------------------------------------

## Prior to running script download and extract data:
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Place script in root of extracted folder (should be named UCI HAR Dataset). 
# Folder Structure, after copying this R script:
    #   test/
    #   train/
    #   run_analysis.R
    #   README.txt
    #   features.txt
    #   features_info.txt
    #   activity_labels
    #   run_analysis.R

## Read sensor values
    train <- read.table("train/X_train.txt",header = FALSE)
    test <- read.table("test/X_test.txt", header = FALSE)

    # Merge Data:
    mergeData <- rbind(train,test)

    # Name Columns:
    tbdNames <- read.table("features.txt")
    colnames(mergeData) <- tbdNames$V2

    # Find relevant columns - only mean and standard deviation
    t2 <- grep("mean|std",tbdNames$V2)

    # Selectr relevant columns from merged data
    fltr.mergeData <- mergeData[t2]
    rm(mergeData,train,test)


## Read Subject Data
    train_sub <- read.table("train/subject_train.txt",header = FALSE)
    test_sub <- read.table("test/subject_test.txt",header = FALSE)
    
    # Merge Data
    fltr.mergeData <- cbind(rbind(train_sub,test_sub),fltr.mergeData)
    
    # Rename Columns
    colnames(fltr.mergeData)[1] <- "subject"
    
    # Remove unneeded variables
    rm(train_sub,test_sub)

## Read activity data
    train_y <- read.table("train/Y_train.txt",header = FALSE)
    test_y <- read.table("test/Y_test.txt", header = FALSE)

    # Merge Data
    fltr.mergeData <- cbind(rbind(train_y,test_y),fltr.mergeData)
     
    # Read activity labels to match with *_y.txt
    activity_labels <- read.table("activity_labels.txt")
    
    # Vlookup activity level names based on number code
    fltr.mergeData <- merge(fltr.mergeData,activity_labels, by.x="V1", 
                             by.y="V1", all.x=TRUE)
    
    colnames(fltr.mergeData)[82] <- "Activity"
    fltr.mergeData$V1 <- NULL
    
    # Remove unneeded variables:
    rm(train_y,test_y,activity_labels)
    
    
## Create New Table with averages calculated by subject and activity
    agg.Tab <- aggregate(fltr.mergeData[,2:80],list(fltr.mergeData$subject,fltr.mergeData$Activity),mean)
    
    # Rename columns
    colnames(agg.Tab)[1:2] <- c("subject","activity")
    colnames(agg.Tab) <- gsub("[\\(\\)]","",colnames(agg.Tab))
    colnames(agg.Tab) <- sub("[-]","",colnames(agg.Tab))
    colnames(agg.Tab) <- gsub("^t","Time_",colnames(agg.Tab))
    colnames(agg.Tab) <- sub("^f","Frequency_",colnames(agg.Tab))
    
    #Write table to .txt file
    write.table(agg.Tab,file="tidy_data.txt")






