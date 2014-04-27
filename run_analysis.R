#Function to help the datasets import
read_dt_uci <- function(type, name){
return (paste(type, "/",name, "_", type, ".txt", sep=""))
}

#Import the datasets
subject_test <- read.table(read_dt_uci("test", "subject")) 
x_test <- read.table(read_dt_uci("test", "X"))
y_test <- read.table(read_dt_uci("test", "y"))

subject_train <- read.table(read_dt_uci("train", "subject")) 
x_train <- read.table(read_dt_uci("train", "X"))
y_train <- read.table(read_dt_uci("train", "y"))

features <- read.table("features.txt")

# 4 named the columns
names(x_train) <- features$V2
names(x_test) <- features$V2

#Build datasets
dt_test <- cbind(subject_test, x_test, y_test)
dt_train <- cbind(subject_train, x_train, y_train)

#1 merge
dt_merge <- rbind(dt_test, dt_train)

#Extracts only the measurements on the mean and standard deviation for each measurement
#Obtain the colums to mean
ColumnToMean <- grep("mean()",names(dt_merge), fixed=TRUE)
ColumnToStd <- grep("std()",names(dt_merge), fixed=TRUE)

#Function to iterates the my_vector_1 and calculates the mean or std of the my_vector_2 column
meanOrStd <- function (my_vector_1, my_vector_2, type) {
	df_sol <- data.frame(t(rep(NA,2)))
	for ( i in 1: length (my_vector_1)) {
		num_column <- my_vector_1[i]
		if (type=="Mean")
			df_sol <- rbind(df_sol, c(names(my_vector_2[num_column]), mean(as.numeric(my_vector_2[, num_column])), na.rm=TRUE ))
		else if (type=="Std")
			df_sol <- rbind(df_sol, c(names(my_vector_2[num_column]), as.numeric(sd(my_vector_2[, num_column])), na.rm=TRUE ))
	}
	df_sol <- df_sol[-1,]
	if (type=="Mean")
		names(df_sol) <- c("Measure", "Mean")
	else if (type=="Std")
		names(df_sol) <- c("Measure", "Std")
	return (df_sol)
}

#Obtain the means and the standard deviation
means <- meanOrStd(ColumnToMean, dt_merge, "Mean")
stds <- meanOrStd(ColumnToStd, dt_merge, "Std")

# 3 Change the id by the activity name
act_labels <- read.table("activity_labels.txt")
names(dt_merge)[563]<- "ActivityName" 
for (i in 1:nrow(dt_merge)){
	id_activity <- dt_merge[i, "ActivityName"]
	dt_merge[i, "ActivityName"] <- act_labels[id_activity,"V2"]
}  #This code is slow

# 5 Create tidy data
names(dt_merge)[1] <- "Subject"

#Split the dataset for Subject and for ActivityName
library(reshape2)
my_melt <- melt(dt_merge, id=c("Subject", "ActivityName"), measure.vars=names(dt_merge)[2:262])
tidy_data <-dcast(my_melt, ActivityName + Subject ~ variable, mean)

#Write the tidy data
write.table(tidy_data, "Tidy_data.csv", sep=",")

