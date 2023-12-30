# HR Employment Analysis

## About

This project aims to leverage MySQL and Tableau for a comprehensive HR analysis, examining gender, race, termination rates, net change, city distribution, age, and average tenure to provide actionable insights into workforce dynamics and guide informed decision-making for organizational development.

## Purposes Of The Project
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

#### Data Wrangling: This is the first step where inspection of data is done to make sure NULL values and missing values are detected and data replacement methods are used to replace, missing or NULL values.

1. Build a database
2. Create table and insert the data.
3. Select columns with null values in them. There are no null values in our database as in creating the tables, we set NOT NULL for each field, hence null values are filtered out.

#### Feature Engineering: This will help use generate some new columns from existing ones.



4. Add a new column named  <span style="color:grey">
time_of_day
</span>to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.
5. Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.
6. Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.
   
#### Exploratory Data Analysis (EDA): Exploratory data analysis is done to answer the listed questions and aims of this project.

#### Conclusion:


## Business Questions To Answer

### Generic Question

1. How many unique cities does the data have?
2. In which city is each branch?


### Product

3. How many unique product lines does the data have?
4. What is the most common payment method?
5. What is the most selling product line?
6. What is the total revenue by month?
7. What month had the largest COGS?
8. What product line had the largest revenue?
9. What is the city with the largest revenue?
10. What product line had the largest VAT?
11. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
12. Which branch sold more products than average product sold?
13. What is the most common product line by gender?
14. What is the average rating of each product line?


### Sales

15. Number of sales made in each time of the day per weekday
16. Which of the customer types brings the most revenue?
17. Which city has the largest tax percent/ VAT (Value Added Tax)?
18. Which customer type pays the most in VAT?

    
### Customer

19. How many unique customer types does the data have?
20. How many unique payment methods does the data have?
21. What is the most common customer type?
22. Which customer type buys the most?
23. What is the gender of most of the customers?
24. What is the gender distribution per branch?
25. Which time of the day do customers give most ratings?
26. Which time of the day do customers give most ratings per branch?
27. Which day fo the week has the best avg ratings?
28. Which day of the week has the best average ratings per branch?


## Code

For the rest of the code, check the  <a href="https://github.com/barnascript/Walmart_sales_analysis/blob/main/walmart_sales.sql">SQL_queries.sql<a> file

``` -- Create database
CREATE DATABASE IF NOT EXISTS WalmartSales;

-- Create table`WalmartSales`
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);



