# HR Employment Analysis

![HR Employment Dashboard](https://github.com/barnascript/hr/assets/142545558/7a6caf80-883a-473e-93b2-2c257835df4b)


## About
This project aims to leverage MySQL and Tableau for a comprehensive HR analysis, examining gender, race, termination rates, net change, city distribution, age, and average tenure to provide actionable insights into workforce dynamics and guide informed decision-making for organizational development.

## Purpose Of The Project
The purposes of this project include leveraging MySQL to analyze HR data, exploring dimensions such as gender, race, termination rates, net change, city distribution, age, and average tenure, with the goal of extracting meaningful insights to inform strategic HR decisions and enhance organizational effectiveness.

## About Data
The dataset under analysis is robust, comprising 22 columns and 22,215 rows, offering a comprehensive and detailed repository of HR information for thorough exploration and data-driven insights.


## Analysis List

#### Workforce Demographics Analysis
1. **Gender Distribution:** Assess the distribution of employees based on gender to understand workforce demographics.
2. **Race Diversity:** Analyze race demographics to identify and address diversity within the organization.

#### Employee Turnover Analysis
3. **Termination Rates:** Examine termination rates to identify patterns and factors contributing to employee exits.
4. **Retention Strategies:** Develop strategies to improve retention based on turnover analysis.

#### Workforce Growth and Reduction Analysis
5. **Net Change in Workforce:** Explore workforce fluctuations over specific periods to inform HR planning.
6. **Resource Allocation:** Use net change data to optimize resource allocation and workforce planning.

#### Geographic Distribution Analysis
7. **City-wise Employee Distribution:** Analyze employee distribution across different cities to understand regional workforce trends.
8. **Location-specific HR Strategies:** Develop strategies tailored to the geographic distribution of employees.

#### Age and Tenure Analysis
9. **Age Distribution:** Categorize employees into age groups to gain insights into the age demographics of the workforce.
10. **Average Tenure:** Analyze average tenure to understand employee longevity and plan for succession.

This focused analysis list aims to provide actionable insights into key dimensions of workforce demographics, turnover, growth, geographic distribution, age, and tenure, facilitating strategic decision-making for HR initiatives.


## Approach Used

**Data Wrangling:**  In the data cleaning process using MySQL, diverse transformations, including format standardization, type modification, null value handling, and age derivation, were applied to ensure consistency and integrity in preparation for subsequent analysis.
   
#### Exploratory Data Analysis (EDA): Exploratory data analysis is done to answer the listed questions and aims of this project.

#### Conclusion:


## Business Questions To Answer

**Exploratory Data Analysis Questions:**

1. What is the Gender breakdown of employees in the company?

2. What is the Race/Ethnicity breakdown of employees in the company?

3. What is the age distribution of employees in the company?

4. How many employees work at headquarters vs remote locations?

5. What is the average length of employment for employees who have been terminated?

6. How does the gender distribution vary across departments?

7. What is the distribution of job titles across the country?

8. Which department has the highest termination rate?

9. What is the distribution of employees by city and state?

10. How has the company's employee count changed based on hire and term dates?

11. What is the tenure distribution for each department?


## Code

For the rest of the code, click <a href="https://github.com/barnascript/hr/blob/main/hr.sql">here<a> 

```-- create database
CREATE DATABASE projects;

set sql_safe_updates = 0;
-- use database
USE projects;

select * from hr;



