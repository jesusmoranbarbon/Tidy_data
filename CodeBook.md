Dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

This dataset represents the moves which one person realize when wearing a Samsung Galaxy S II and capture the acceleration and the velocity using the accelerometer and the gyroscope
  
The dataset is splitting in two parts: the test part who represents the 30% of the total data, and the training data, who represent the 70%.

For each record:
-	Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
-	Triaxial Angular velocity from the gyroscope. 
-	A 561-feature vector with time and frequency domain variables. 
-	Its activity label. 
-	An identifier of the subject who carried out the experiment.

The changes realizing by the original dataset are:
-	Merge of the training and test datasets
-	Rename the columns for the labels proportionated
-	Obtain the mean and the standar deviation for some variables
-	In the activity id, replace the activity id by its name
-	Obtain the average of each variable for each activity and each subject

The dataset is proportioned by Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.





Readme.md

To execute the code, you should have the dataset in the working directory and execute the code
