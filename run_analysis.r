## Read in data

x_train       <- read.table("C:/git/train/X_train.txt")
y_train       <- read.table("C:/git/train/y_train.txt")
subject_train <- read.table("C:/git/train/subject_train.txt")

x_test        <- read.table("C:/git/test/X_test.txt")
y_test        <- read.table("C:/git/test/y_test.txt")
subject_test  <- read.table("C:/git/test/subject_test.txt")

# create 'x' data set
x_data        <- rbind(x_train, x_test)

# create 'y' data set
y_data        <- rbind(y_train, y_test)

# create 'subject' data set
subject_data  <- rbind(subject_train, subject_test)

# Step 2

features <- read.table("C:/git/features.txt")

# get columns with only 'mean' and 'std' in name
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, mean_and_std_features]

# correct the column names
names(x_data) <- features[mean_and_std_features, 2]

# Step 3

# get activity labels from text file
activities <- read.table("C:/git/activity_labels.txt")

# rename column names
y_data[, 1] <- activities[y_data[, 1], 2]

# rename columns
names(y_data) <- "activity"

# Step 4

# rename columns
names(subject_data) <- "subject"

# merge data into single dataset for output
all_data <- cbind(x_data, y_data, subject_data)

## Step 5

# 66 <- 68 columns but last two (activity & subject)
library(plyr)
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "c:/git/averages_data.txt", row.name=FALSE)
