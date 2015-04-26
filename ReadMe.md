The run_analysis funcion is used to perform an initial analysis on the data obtained by Non Linear Complex Systems Laboratory of Università degli Studi di Genova.
The function first extracts data about:
•	Activities
•	Features
•	Test data (contained in 3 files)
•	Train data (contained in 3 files)
All of this data is contained in .txt files and read.table() is used for data extraction.
The data (now stored as data frame in R) are then joined into one large data frame using cbind and rbind.
Features vector is used to name columns in the data frame.
The activities in the data frame are changed from numeric variables to descriptive names.
From the large data frame, all columns now related to non-mean and non-standard deviation parameters are removed.
Finally, the data is collapsed using ddply to find averages for each Subject across all instances of the same activity.
The resulting data frame is stored as a .txt file.


