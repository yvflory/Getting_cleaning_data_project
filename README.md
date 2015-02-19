# Readme file for the code and data in this repository

The code in run_analysis.R assumes that the folder UCI HAR Dataset is in your working directory, containing the following  folders and files:
- features.txt
- test/subject_test.txt
- test/X_test.txt
- test/Y_test.txt
- train/subject_train.txt
- train/X_train.txt
- train/Y_train.txt
  
run_analysis.R reads those files and gives as output the average values for all those variables measuring a mean and standard deviation. The output file is ordered by subject and activity type, and contains 88 variables (columns) and 180 datapoints (rows). The columns are separated by one empty space.  
The output file is called tidy\_data.txt and is saved in the working directory.  
  
A detailed description of the variables can be found in the codebook of this repository. Variables were not renamed from the original datasets. Any attempt to make them clearer would have resulted in much longer variables which are not necessarily better to read.
