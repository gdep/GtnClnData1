
# CodeBook - run_analysis.R

## Variables

* xTrain: measurements training set
* xTest: measurements test set
* yTrain: performed activity to observation mapping, training set
* yTest: performed activity to observation mapping, test set
* sTrain: subject ID to observation mapping, training set
* sTest: subject ID to observation mapping, test set
* feat: feature labels
* act_labels: activity name to activity ID mapping
* X: concatenated training + test measurements
* Y: concatenated training + test performed activity to observation mapping
* S: concatenated training + test subject ID to observation mapping
* xMeanStd: filtered measurements, selecting only the features refering to mean and standard deviation
* summarizedX: summarized measurements data, containing the mean for each filtered measurement for each subject (30) and each activity (6), totalling 180 observations.

## Data

The data represents experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Data was captured on 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.


## Transformations

* Train and test sets were merged into a single data.frame for all cases, since the split is not necessary for our purposes.
* Labels from act_label were properly added as column names to the measurements data.
* Mappings ( subject to observation and activity name to activity ID) were consolidated with the measurements, creating a data.frame where each row indicates the subject ID, the activity performed and each measurement taken for that subject/activity combination.
* Measurements were filtered, selecting only those that refered to the mean and standard deviation.
* The data was summarized, grouping measurements by subject ID and activity performed, and taking the mean for each group combination.
