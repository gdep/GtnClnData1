# run_analysis.R script description

The run_analysis.R script is used for the "Getting and Cleaning Data" course project 1.

## Reading the data

The first operations performed are several read.tables, to read the data from text files into data.frames in R. The data is assumed to already be on the working directory, otherwise the script will not work.

The data was also previously partitioned into two sets: training and testing, common in machine learning scenarios. As this is not useful for us, we concatenate those two sets into one data.frame using rbind.

## Labeling and feature selection

Aside from there being two distinct (training and testing) data files, the proper feature (column) names are also in a separate file. As such, the next step takes the feature file and uses is to replace the non-descriptive names currently on the measurements data.

To follow project guidelines, the next step subsets the measurements data.frame, selecting only the measurements on the mean and standard deviation using the grep command.

Afterwards, the data.frame that indicates which subject performed which activity is joined with the data.frame that maps numbers (1 to 6) to the activity's actual label (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

With the subject IDs and their performed activity in hand we add those two columns (as the first two) to the measurements data, creating a data.frame that has the subject, the activity he performed and the measurements taken.

## Summarization and writing the resulting data

Finally, the data is summarized: with all the information in one tidy data.frame, we now group the data by subject and activity and take the mean for each measurement, that is, for each subject (30 in total) and each activity (6 in total) the data is consolidated into the mean of all observations refering to that subject doing that activity, resulting in a condensed 180 observations (6x30) of the measurements taken.
