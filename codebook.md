Introduction
run_analysis.R contains within it the code to perform the 5 required steps.

1)
The data is merged using the rbind() function. As row binding is the only way that the data dimensionally fits together then this is necessarily the only way to bind the data.

2/3)
Using search terms 'std' and 'mean' only columns containing these are extracted, and named using the feature labels in features.txt. 

4) 
Activity labels from activity_labels.txt are used to label each activity (corresponding to 1:6). 

5) 
New dataset is generated with the features and variables required for each activity, and inserted into averages_data.txt.

Data:
x_train: downloaded data
y_train: downloaded data
x_test: downloaded data
y_test: downloaded data
subject_train: downloaded data
subject_test: downloaded data
x_data: merged x data from downloaded data
y_data: merged y data from downloaded data and 
subject_data: merge above datasets
features: x dataset names
all_data: merged x_data, y_data and subject_data
averages_data: output file