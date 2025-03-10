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

## 3️⃣ Full Code and Queries
The complete SQL queries for **Data Cleaning** and **Exploratory Data Analysis (EDA)** can be found here:  

📌 **Data Cleaning SQL Script:**  
🔗 [SQL_tutorial_&_project/Project_porfolio_from_Alex_Analyst.sql](https://github.com/harlesky/Sql_Tutorial_-_Project/blob/main/SQL_tutorial_%26_project/Project_porfolio_from_Alex_Analyst.sql)  

📌 **Exploratory Data Analysis (EDA) SQL Script:**  
🔗 [SQL_tutorial_&_project/Project2_Exploratory_Data_analysis.sql](https://github.com/harlesky/Sql_Tutorial_-_Project/blob/main/SQL_tutorial_%26_project/Project2_Exploratory_Data_analysis.sql)  

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

# Project2: Exploratory Data Analysis (EDA) on Layoffs Data

## Overview
This section analyzes layoffs data to uncover trends in workforce reductions across various industries and companies. The analysis includes identifying maximum layoffs, layoff percentages, and insights into funding vs. layoffs.

---

## 1️⃣ Viewing Cleaned Data
Before analysis, we confirm that the data is properly cleaned and structured.

```sql
SELECT *
FROM layoffs_staging2;
```
## So here we look at the percentage of layoffs, companies with 100 percent layoffs and others
```sql
SELECT MAX(percentage_laid_off),  MIN(percentage_laid_off)
FROM world_layoffs.layoffs_staging2
WHERE  percentage_laid_off IS NOT NULL;

---
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE  percentage_laid_off = 1;
```

## 🔍 Conclusion

This analysis of layoffs data reveals key workforce reduction trends across various industries. The findings indicate that:

- **Startups were hit hardest**, with some companies shutting down entirely.  
- The **technology sector experienced significant layoffs**, possibly due to economic downturns and shifts in market demand.  
- Some companies **raised millions in funding but still faced mass layoffs**, highlighting potential financial mismanagement or unsustainable growth models.  

### 📌 Key Takeaways:
✅ Layoffs were widespread, affecting multiple industries.  
✅ Companies with **high funding** still experienced downsizing.  
✅ **100% layoffs** were primarily startups, indicating complete business closures.  

This exploratory data analysis provides insights into **corporate downsizing patterns**, helping us understand the **impact of economic factors on employment trends**.  





