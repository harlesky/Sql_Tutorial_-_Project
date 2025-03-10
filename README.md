# Sql_Tutorial_-_Project

# SQL Tutorial and Project on Layoffs Data

## Overview
This tutorial introduces SQL concepts and applies them in a real-world project using a dataset on layoffs from various companies. The project primarily involves **Exploratory Data Analysis (EDA)**, which includes **Data Cleaning** and **Exploratory Data Analysis (EDA) steps**.

---

## 1️⃣ SQL Concepts Covered
This tutorial covers the following SQL concepts:

- **Basic Queries**: `SELECT`, `WHERE`, `ORDER BY`
- **Filtering Data**: `LIKE`, `BETWEEN`, `IN`, `LIMIT`
- **Sorting and Grouping**: `GROUP BY`, `HAVING`
- **Joins**: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- **Aggregations**: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`
- **Subqueries and CTEs**: `WITH`, nested queries
- **Data Modification**: `INSERT INTO`, `UPDATE`, `DELETE`
- **Creating Views and Indexing**: `CREATE VIEW`, `INDEX`

---

## 2️⃣ Project: Layoffs Data Analysis

### **Dataset Description**
The dataset used for this project contains information on company layoffs, including:
- Company Name
- Industry
- Total Layoffs
- Date of Layoff
- Country
- Percentage of Workforce Laid Off

---

## 3️⃣ Data Cleaning Steps
Before analyzing the data, we perform **data cleaning** to ensure accuracy. The following steps are taken:

### **Step 1: Create a Backup Table**
To avoid mistakes while cleaning, we first duplicate the raw table.

```sql
CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;


INSERT layoffs_staging
SELECT * 
FROM layoffs;
```

### **Step 2: Remove Duplicates**
```sql
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM layoffs_staging;
```

### **Step 3: Standardize the Data**
```sql
SELECT company, (TRIM(company))
FROM layoffs_staging2;
```

### **Step 4: Null Values or blank values**
```sql
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;
```

### **Step 5: Remove Any Columns or rows you feel and sure are unnecessary**
```sql
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;
```


