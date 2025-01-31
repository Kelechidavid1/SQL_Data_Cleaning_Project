SELECT *
FROM layoffs;

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM layoffs;


WITH dup_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs
)
DELETE 
FROM dup_cte
WHERE row_num > 1;

CREATE TABLE `layoffs1` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT *
FROM layoffs1;

INSERT INTO layoffs1
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs;

SELECT *
FROM layoffs1
WHERE row_num > 1;

DELETE 
FROM layoffs1
WHERE row_num > 1;

SELECT *
FROM layoffs1;

-- STANDARDIZATION

SELECT company, (TRIM(company))
FROM layoffs1;

UPDATE layoffs1
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoffs1
WHERE industry LIKE 'Crypto%';

UPDATE layoffs1
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT industry
FROM layoffs1;

SELECT *
FROM layoffs1;

SELECT DISTINCT country, TRIM(country)
FROM layoffs1
WHERE country LIKE 'United States%'
ORDER BY 1;

SELECT DISTINCT country, TRIM(TRAILING '.'FROM country)
FROM layoffs1
ORDER BY 1;

UPDATE layoffs1
SET country = TRIM(TRAILING '.'FROM country)
WHERE country LIKE 'United States%';

SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs1;

UPDATE layoffs1
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

SELECT `date`
FROM layoffs1;

ALTER TABLE layoffs1
MODIFY COLUMN `date` DATE;

SELECT *
FROM layoffs1;

SELECT *
FROM layoffs1
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

UPDATE layoffs1
SET industry = NULL
WHERE industry = '';

SELECT *
FROM layoffs1
WHERE industry IS NULL
OR industry = '';

SELECT *
FROM layoffs1
WHERE company = 'Airbnb';


SELECT t1.industry, t2.industry
FROM layoffs1 AS t1
JOIN layoffs1 AS t2
	ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

UPDATE layoffs1 t1
JOIN layoffs1 AS t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL;

DELETE 
FROM layoffs1
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT*
FROM layoffs1;

ALTER TABLE layoffs1
DROP COLUMN row_num;










































































