# SQL_Data_Cleaning_Project
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

