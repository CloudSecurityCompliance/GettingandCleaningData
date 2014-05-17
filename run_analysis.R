run_analysis <- function() {
    
    ##Step1 Read Train Data Sets
    traindata <- read.table("X_train.txt")
    subjecttraindata <- read.table("subject_train.txt")
    activitytraindata <- read.table("y_train.txt")
    
    ##Step2 Consolidate Train Data Set
    traindata <- data.frame (traindata, subjecttraindata, activitytraindata)
    
    ##Step3 Read Test Data Sets
    testdata <- read.table("X_test.txt")
    subjecttestdata <- read.table("subject_test.txt")
    activitytestdata <- read.table("y_test.txt")
    
    ##Step4 Consolidate Test Data Set
    testdata <- data.frame (testdata, subjecttestdata, activitytestdata)
    
    ##Step5 Merge Train and Test Data Set 
    mergedata <- rbind(traindata, testdata)
    
    ##Step6 Replace numeric activity numbers with descriptive activity names
    activitydata <- read.table("activity_labels.txt")
    mergedata[,563] <-  activitydata[mergedata[,563],2]
    
    ##Step7 Subset: Keeping columns that contain Mean or STD as they relate to axial measurement i.e. X, Y, Z
    subsetdata <- mergedata[, c(1:6,41:46,81:86,121:126,161:166,266:271,345:350,424:429,562:563)]
   
    ##Step8 Replace chosen columns names with appropriate labels
    colnames(subsetdata)[1]<-"Body Acc mean X"
    colnames(subsetdata)[2]<-"Body Acc mean Y"
    colnames(subsetdata)[3]<-"Body Acc mean Z"
    colnames(subsetdata)[4]<-"Body Acc std X"
    colnames(subsetdata)[5]<-"Body Acc std Y"
    colnames(subsetdata)[6]<-"Body Acc std Z"
    colnames(subsetdata)[7]<-"Gravity Acc mean X"
    colnames(subsetdata)[8]<-"Gravity Acc mean Y"
    colnames(subsetdata)[9]<-"Gravity Acc mean Z"
    colnames(subsetdata)[10]<-"Gravity Acc std X"
    colnames(subsetdata)[11]<-"Gravity Acc std Y"
    colnames(subsetdata)[12]<-"Gravity Acc std Z"
    colnames(subsetdata)[13]<-"Body Acc Jerk mean X"
    colnames(subsetdata)[14]<-"Body Acc Jerk mean Y"
    colnames(subsetdata)[15]<-"Body Acc Jerk mean Z"
    colnames(subsetdata)[16]<-"Body Acc Jerk std X"
    colnames(subsetdata)[17]<-"Body Acc Jerk std Y"
    colnames(subsetdata)[18]<-"Body Acc Jerk std Z"
    colnames(subsetdata)[19]<-"Body Gyro mean X"
    colnames(subsetdata)[20]<-"Body Gyro mean Y"
    colnames(subsetdata)[21]<-"Body Gyro mean Z"
    colnames(subsetdata)[22]<-"Body Gyro std X"
    colnames(subsetdata)[23]<-"Body Gyro std Y"
    colnames(subsetdata)[24]<-"Body Gyro std Z"
    colnames(subsetdata)[25]<-"Body Gyro Jerk mean X"
    colnames(subsetdata)[26]<-"Body Gyro Jerk mean Y"
    colnames(subsetdata)[27]<-"Body Gyro Jerk mean Z"
    colnames(subsetdata)[28]<-"Body Gyro Jerk std X"
    colnames(subsetdata)[29]<-"Body Gyro Jerk std Y"
    colnames(subsetdata)[30]<-"Body Gyro Jerk std Z"
    colnames(subsetdata)[31]<-"fBody Acc mean X"
    colnames(subsetdata)[32]<-"fBody Acc mean Y"
    colnames(subsetdata)[33]<-"fBody Acc mean Z"
    colnames(subsetdata)[34]<-"fBody Acc std X"
    colnames(subsetdata)[35]<-"fBody Acc std Y"
    colnames(subsetdata)[36]<-"fBody Acc std Z"
    colnames(subsetdata)[37]<-"fBody Acc Jerk mean X"
    colnames(subsetdata)[38]<-"fBody Acc Jerk mean Y"
    colnames(subsetdata)[39]<-"fBody Acc Jerk mean Z"
    colnames(subsetdata)[40]<-"fBody Acc Jerk std X"
    colnames(subsetdata)[41]<-"fBody Acc Jerk std Y"
    colnames(subsetdata)[42]<-"fBody Acc Jerk std Z"
    colnames(subsetdata)[43]<-"fBody Gyro mean X"
    colnames(subsetdata)[44]<-"fBody Gyro mean Y"
    colnames(subsetdata)[45]<-"fBody Gyro mean Z"
    colnames(subsetdata)[46]<-"fBody Gyro std X"
    colnames(subsetdata)[47]<-"fBody Gyro std Y"
    colnames(subsetdata)[48]<-"fBody Gyro std Z"
    colnames(subsetdata)[49]<-"User"
    colnames(subsetdata)[50]<-"Activity"
    
    ##Step 9
    ##Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    #First Calculate Mean of each Mean column for each row
    subsetdata <- transform(subsetdata, MeanofMeans = rowMeans(subsetdata[,c(1:3,7:9,13:15,19:21,25:27,31:33,37:39,43:45)]))
    #Second Calculate Mean of each STD column for each row
    subsetdata <- transform(subsetdata, MeanofSTD = rowMeans(subsetdata[,c(4:6,10:12,16:18,22:24,28:30,34:36,40:42,46:48)]))
    #Third Calculate Mean of each column by user by activity
    #We get a file that has 180 rows (30 users by 6 activity) and 4 columns (User, Activity, Mean of Means,Mean of STD)
    newsummary <- aggregate( subsetdata[,51:52], subsetdata[,49:50], FUN = mean )
    
    ##Step 10 Write dataframe to CSV delimited file
    write.table(newsummary, "newdataanalysis.txt", sep="\t",col.names=NA)
}
