# CodeBook
## Overview
This was built as part of Module 3 Getting and Cleaning Data Course.
It uses data collected from the accelerometers of Samsung Galaxy S smartphones. The original source of the data is:

[https://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones]

The goal of this project is to create a tidy dataset that contains the average of each variable for each activity and subject.

---


## Raw Data Description

The original dataset contains the following:

- **Subjects:** 30 volunteers (each assigned a number from 1 to 30).
- **Activities:** Six different physical activities:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING
- **Features:** 561 features recorded for each activity/subject combination, including signals derived from body acceleration and gyroscope readings.
  
## Cleaning and Transformation Steps

The following steps were applied in `run_analysis.R`:

1. **Merged** the training and test datasets to create one complete dataset.
2. **Labeled** the dataset with descriptive variable names derived from `features.txt`.
3. **Extracted** only the measurements related to the mean and standard deviation (`mean()` and `std()`).
4. **Replaced** activity codes with descriptive activity names.
5. **Created** a second, independent tidy dataset containing the **average** of each measurement for each subject and activity.

## Tidy Dataset Description

The final tidy dataset includes:

- **subject:** The ID of the volunteer (integer from 1 to 30).
- **activity:** The name of the activity performed.
- **measurement columns:** Average of the original measurements (e.g., `tBodyAcc-mean()-X`, `tBodyGyro-std()-Z`), one for each mean/std variable.

In total:
- **180 rows** (30 subjects × 6 activities)
- **68 columns** (66 measurements + subject + activity)
