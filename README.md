# 🧹 SQL Data Cleaning: Handling Messy Datasets

## Overview
This repository contains a practical exercise in data pre-processing and cleaning using SQL. It demonstrates the ability to identify and resolve common data quality issues such as inconsistent formatting, missing values, and logical errors in a raw dataset.

## Version 1: Foundational Cleaning (Current)
The current script (`Crime_Data_Cleaning.sql`) focuses on direct data manipulation using fundamental SQL functions. 
**Key techniques demonstrated:**
* **String Manipulation:** Standardizing text format and removing extra spaces using `TRIM`, `UPPER`, `LOWER`, and `SUBSTRING`.
* **Conditional Logic:** Handling missing or blank values (`N/A`, `''`) and converting them to `NULL` using `CASE WHEN`.
* **Numerical Corrections:** Converting negative values to positive using `ABS` and filtering out illogical constraints (e.g., ages > 100).
* **Data Standardization:** Unifying abbreviations and geographical coordinates.

## Next Steps (Version 2 - Upcoming)
To transition from direct mutation to a scalable data engineering pipeline, the next iteration will focus on:
1. Building a **Staging Table / View** to preserve raw data integrity.
2. Implementing **Lookup Tables** to automate the correction of hardcoded text variations.
3. Consolidating update logic into a comprehensive `SELECT` statement.
