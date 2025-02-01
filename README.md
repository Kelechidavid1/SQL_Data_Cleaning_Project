# SQL Data Cleaning Project
## 1. INTRODUCTION  
This project highlights the various techniques by which a raw dataset was cleaned and transformed into a usable format for further analysis. The purpose of this project was to clean and trasform raw data obtained into a more refined dataset. The data used was gotten from the web and the link is provided: [Raw Dataset](https://www.kaggle.com/datasets/swaptr/layoffs-2022).  
## 2. DATA COLLECTION AND SKILLS USED  
The data was collected from kaggle website and it shows the different coloums relevant to the intended analysis.
The four bssic steps used in the cleaning of this dataset set is as shown below:
1. Removal of Duplicates
2. Text Standadization
3. Blanks and Null
4. Removal of Redundant columns

 ### Removal of Duplicates
 A row number was used to match against all the columns in the dataset to find any duplicate after which a Common Table Expression (CTE) was used to comfirm that there was no row number greater than one. Row Number greater than one would signify a duplicate.

 ### Text Standadization  
First, the company column was trimmed and then the industry column was standadized so that there were no spelling errors as was particularly found in cryotocurrency. Also the country United States. was updated to remove the dot in front. In addition to those, the date column was updated from a string into a date format that SQL recognizes  

### Blank and Null  
Blank and Null dataset that can be populated were done by comparing to relevant data. Companies like Airbnb that had the industry name (Travel) for some rows and blank/null for another row as compared and made to update. This was done by setting all blank industries to NULL and then updated to the relevant industry type using the self join command.  

### Removing Redundant Rows and Columns  
Each rows that has both total_laid_off and percentage_laid_off as blank or null values were deleted because they will serve no function in subsequent Exploratoty Data Analysis. Also, the Row_Number column that was created in the earlier stages of the data cleaniing to remove duplicates was deleted because it is redundant and would not be used for further analysis.










