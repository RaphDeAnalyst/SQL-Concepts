/*There are more than one schema in this data base and I have to specify the one I am using for this excercise*/
USE test_salaries;

-- Using the SELECT statement
SELECT 
    *
FROM
    salaries;
/*In most cases we my want to see only some rows, we can use LIMIT to do that, here I am limiting the number of rows to 10*/
SELECT 
    *
FROM
    salaries
LIMIT 10;

-- Selecting specific columns
SELECT 
    job_title, salary_in_usd
FROM
    salaries;    

-- AlIAS
/* ALIAS denoted by AS is used to give descriptiv names to coulmns this can be helpful to avoid conflicting column names especially when working with more than one tables*/
SELECT 
	Job_title AS position, salary_in_usd AS "salary in dollars"
FROM
	salaries;

-- Using the Aggregate functions statement /* basic aggregate functions are: COUNT, MIN, MAX and SUM)*/
-- COUNT
SELECT 
    COUNT(*)
FROM
    salaries;
    
-- MIN
SELECT 
    MIN(salary_in_usd)
FROM
    salaries;

-- MAX
SELECT 
    MAX(salary_in_usd)
FROM
    salaries;
 
 -- SUM
 SELECT 
    SUM(salary_in_usd)
FROM
    salaries;
 
 -- AVG
 
  SELECT 
    AVG(salary_in_usd) as average_salary
FROM
    salaries;
 
-- Using DISTINCT
/* A popular way to use DISTINCT is to know the number of unique values in a specific column or field, the DISTINCT statement can be used*/
SELECT DISTINCT
    work_year
FROM
    salaries;
/*we can see that we have four years (2021 - 2023) in the work_year column. better still the COUNT(DISTINCT) can be used to get the actual number of the unique values*/
SELECT 
    COUNT(DISTINCT work_year) AS "no. of years"
FROM
    salaries;

-- Using the WHERE clause
/* The WHERE clause is used to specify the rows you want to query to affect*/
SELECT 
    *
FROM
    salaries
WHERE
    work_year = 2022;

SELECT 
	* 
FROM 
	salaries
WHERE 
	salary_in_usd > 50000;

SELECT 
	* 
FROM 
	salaries
WHERE 
	work_year = 2023;

SELECT 
	* 
FROM 
	salaries
WHERE 
	job_title like "%Engineer%";


-- Group BY statement
/* When using aggregate functions to return selected columns, the group by statement must be used to group the results by unaggregated columns*/
SELECT 
	work_year, MIN(salary_in_usd) AS minimum_salary, MAX(salary_in_usd) AS maximum_salary
FROM
    salaries
GROUP BY work_year;
/* In order to make the aggregated columns have descriptive name, ALIAS can be use by applying the keyword AS*/
SELECT 
    work_year,
    MIN(salary_in_usd) AS minimum_salary,
    MAX(salary_in_usd) AS maximum_salary
FROM
    salaries
GROUP BY work_year;

-- ORDER BY statement
/*In most cases we may want to see the table in a particular order (Ascending or Descending) based off of a particular column*/
SELECT 
    work_year,
    MIN(salary_in_usd) AS minimum_salay,
    MAX(salary_in_usd) AS maximum_salary
FROM
    salaries
GROUP BY work_year;

SELECT 
    work_year,
    MIN(salary_in_usd) AS minimum_salay,
    MAX(salary_in_usd) AS maximum_salary
FROM
    salaries
GROUP BY work_year
ORDER BY work_year;
/* Using the ORDER BY statement by default the table is returned in Ascending order except specified otherwise by adding the 'DESC' keyword after the column name*/
SELECT 
    work_year,
    MIN(salary_in_usd) AS minimum_salay,
    MAX(salary_in_usd) AS maximum_salary
FROM
    salaries
GROUP BY work_year
ORDER BY work_year DESC;