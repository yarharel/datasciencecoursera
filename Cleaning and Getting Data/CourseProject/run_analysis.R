library(dplyr)
## Train_set creation
train_set_values<-read.table(file='train//X_train.txt',sep='',strip.white=TRUE,quote='')
train_set_labels<-read.table(file='train//Y_train.txt',sep='',strip.white=TRUE,quote='')
train_set_subject<-read.table(file='train//subject_train.txt',sep='',strip.white=TRUE,quote='')
train_set<-cbind(train_set_subject,train_set_labels,train_set_values)

## Test_set creation
test_set_values<-read.table(file='test//X_test.txt',sep='',strip.white=TRUE,quote='')
test_set_labels<-read.table(file='test//Y_test.txt',sep='',strip.white=TRUE,quote='')
test_set_subject<-read.table(file='test//subject_test.txt',sep='',strip.white=TRUE,quote='')
test_set<-cbind(test_set_subject,test_set_labels,test_set_values)

## Create complete set
set<-rbind(train_set,test_set)

## remove temp varaibles
remove(train_set_subject,test_set_subject,test_set,test_set_values,test_set_labels,train_set,train_set_values,train_set_labels)

## Assign names to table process
feature_list<-read.table(file='features.txt',stringsAsFactors = FALSE)

## remove brackets and replace minus sign with underscore for better description 
feature_list<-sapply(feature_list[,2],function(x){
    gsub("-","_",gsub('\\(','',gsub('\\)','',x)))
})
names(set)<-c('subject','label',feature_list)


##extract only Mean and STD features
LogicalMeanSTD<-sapply(names(set),FUN = function (x){
    grepl(pattern = 'mean',x) | grepl(pattern = 'std',x)
    })
LogicalMeanSTD[1:2]<-c(TRUE,TRUE)    
MSset<-set[LogicalMeanSTD]

## turn activty label(column 2) to have the activity names instead of id
## Mean or STD Descriptive Set
MSDS<-MSset
MSDS$label<-sapply(MSDS$label,FUN=function(x){
    switch(as.character(x),'1'='WALKING',
           '2'='Walking_Upstairs',
           '3'='Walking_Downstairs',
           '4'='Sitting',
           '5'='Standing',
           '6'='Laying')
})

## Summary of each subject/label over all varaibles, flow:
## Pass set to dplyr's group_by, which takes subject and label
## summarise this result over each variable using summarise_each
## do a mean over these variables.
OutputSet<-MSDS %>% group_by(subject,label) %>% summarise_each(funs(mean))

##write output
write.table(OutputSet,file = "output.txt",row.name=FALSE)
    