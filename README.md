# 💧 Cape Town Dam Levels Normalization Project 🇿🇦

This project demonstrates how to normalize a flat `dam_levels` dataset from a single table to **1NF**, **2NF**, and **3NF** using SQL.

---

## 📁 Dataset Description

The original table `damm_levels` contains data about:
- Yearly water levels for major dams in Cape Town
- Assessment officer info
- Geolocation of each dam (latitude & longitude)

---

## 🧱 Steps Performed

### ✅ 1NF: First Normal Form
- Created a new table `dam_levels_1nf` with a **primary key `AssessmentId`** to uniquely identify each row.
- Removed any repeating or nested data (flat structure achieved).

```sql
CREATE TABLE dam_levels_1nf (...);
INSERT INTO dam_levels_1nf
SELECT ... FROM damm_levels;
```

##✅ 2NF: Second Normal Form
-Split the data into two tables:
-assessments: stores year, officer info, water level
-dams: stores dam name and location
-Created linking table dam_assessments (maps assessment to dam)  to map each assessment to its dam.
```sql 
CREATE TABLE assessments (...);
CREATE TABLE dams (...);
CREATE TABLE dam_assessments (...);
```
##✅ 3NF: Third Normal Form
-Removed transitive dependency (officer_reg → officer_name)
-Created an officers table and moved officer info out of assessments.
```sql
CREATE TABLE water_level_assessments (...);
CREATE TABLE officers (...);
```

📦 Tools Used
-MySQL
-SQL queries for normalization
-Sample dam-level data related to Cape Town’s water crisis (2012–2021)

🎓 Project Context
-This project was created as part of ALX Africa's data learning path to demonstrate SQL normalization skills in practice.



## ALX AFRICA 


👩‍💻 By:
Fatma Badawy

