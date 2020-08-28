Step	Explanation
------------------------------------------------------------------------------------------------------------------------------------------
1	features files (features.txt) is loaded into workspace to extract activities
2	subject test file (subject.txt) is loaded into workspaces to extract who did the activity
3	original variables in test file (x_test.txt) are loaded into workspaces
4	activity perfomed for every subject (y_test.txt) is loaded into workspace
5	activity data is renamed, changing the id with the correspondet definition (1=walking, 2=walking_upstairs,...etc)
6	each column in every set of data is named (subject, activity and variables)
7	steps 2 to 6 are repeated with train data
8	test data and train data are combined
9	original data is removed from memory
10	mean and std variables are selected
11	original mean and std names variables are modified to have short definitions
12	from selected variables (mean and std), groups are formed by subject and activity, and mean function is applied to every group

