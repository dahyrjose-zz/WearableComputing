WearableComputing
=================

The given script: run_analysis.R performs data transformation to generate a unique file containing training and test sets with proper column names and descriptive row values.

###Instructions

1. After cloning the repository set the R working directory one level above the downloaded folder
2. Inside the WearableComputing folder is also the data folder uncompressed, so you won't need to download or run anything else
3. The sqldf package needs to be installed as the script runs library(sqldf)
3. The reshape2 package needs to be installed as the script runs library(reshape2) and uses the melt function
4. In R command line run source("./WearableComputing/run_analysis.R")
5. After the code runs you will find the tidy data sets outside the WearableComputing folder: tidy_dataset.txt and dataset_summary.txt
6. To test the files you should use read.csv(file_path), where file_path is one of the resulting data sets as the files are saved in CSV format using sep = ","


More information about the original data set:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones



Dahyr J. Vergara Suárez
