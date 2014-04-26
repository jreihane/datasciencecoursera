============================================================================================================
ReadMe file and Code book for run_analysis.R
============================================================================================================

This doucment is created for the final project of Coursera course: Getting and Cleaning data

============================================================================================================

The run_analysis.R is created as a simple .R file. Code lines are executed one after another, no function is used.

I have separated the code into 7 parts, so that it is easier to check each functionality (in my opinion!)

1 - 	first part is consisted of data file address variables (ending with _url)
	then data files are read into "tables".
		test files (x and y) are read and bind together.
		train files (x and y) are read and bind together.

2- 	second part adds headers from "subject files" to test and train files.

3- 	third part combines two datasets (maybe it is better to combine then add headers. But I added headers 			first to avoid trapping into any uncontrollable situation)

4- 	forth parts extracts "mean()" and "std()" feature names from dataset
		first I find features containing "mean()" and "std()",
		then I create a vector with "mean()","std()" and the two most important features ("Activity", 		"Subjectid")
		then I find every row of those features.
		(Maybe there is a better approach for this. But as a beginner, I found it easier and more 		understandable)

5- 	fifth part, splits the dataset by the combination of activity and subject id,
	then finds the mean of each element of the list resulted from split
	then transposes the result. I think I understand why row and columns are replaced with each other but I did 	not find any better way.

6- 	sixth part replaces activity ids with their corresponding names. I did that by merging the activity_labels 	file and the frame I got from previous part

7- 	the last part, saves the tiny data into a file and a frame.


	
============================================================================================================

Wish the bests for you!
