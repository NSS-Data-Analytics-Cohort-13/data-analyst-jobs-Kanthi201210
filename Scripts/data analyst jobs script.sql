--Q1) 1793
--Q2) ExxonMobil
--Q3) 21;27
--Q4) 416
--Q5) 151
--Q6) NE
--Q7) 881
--Q8) 230
--Q9) 41 (including "null)
--Q10) General Motors
--Q11) 1636
--Q12) 39;  Many of the resulting job titles may still contain the word analyst , but the case is not is not the exact same (Ex. ANALYST, analyst) 


--Q1)How many rows are in the data_analyst_jobs table?
--SELECT COUNT(*)
--FROM data_analyst_jobs;

--Q2)Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
--SELECT *
--FROM data_analyst_jobs
--Limit (10);

--Q3)How many postings are in Tennessee? 

--SELECT COUNT(*)
--FROM data_analyst_jobs
--Where location= 'TN';

--How many are there in either Tennessee or Kentucky?
--SELECT COUNT (*)
--FROM data_analyst_jobs
--WHERE location='TN' OR location='KY';

--Q4)How many postings in Tennessee have a star rating above 4?
--SELECT COUNT(*)
--FROM data_analyst_jobs
--WHERE star_rating>4.0;

--Q5)How many postings in the dataset have a review count between 500 and 1000?

--SELECT COUNT(*)
--FROM data_analyst_jobs
--WHERE review_count>=500 and review_count <=1000;

--SELECT COUNT(*)
--FROM data_analyst_jobs
--WHERE review_count BETWEEN 500 AND 1000;

--Q6)Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?
--SELECT DISTINCT location AS state, AVG(star_rating) AS avg_rating
--FROM data_analyst_jobs
--GROUP BY location
--ORDER BY avg_rating;

--Q7)Select unique job titles from the data_analyst_jobs table. How many are there?
--SELECT COUNT (DISTINCT title)
--FROM data_analyst_jobs;

--Q8)How many unique job titles are there for California companies?
--SELECT COUNT (DISTINCT title)
--FROM data_analyst_jobs
--WHERE location='CA';

--Q9)Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
--SELECT company, AVG(star_rating)
--FROM data_analyst_jobs
--WHERE review_count>5000
--GROUP BY company;


--Q10)Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
--SELECT company, AVG(star_rating)
--FROM data_analyst_jobs
--WHERE review_count>5000
--GROUP BY company
--ORDER BY AVG(star_rating) DESC;

--Q11)Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

--SELECT title
--FROM data_analyst_jobs
--WHERE title LIKE '%Analyst%';

--SELECT COUNT (title)
--FROM data_analyst_jobs
--WHERE title LIKE '%Analyst%';

--Q12)How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

--SELECT COUNT (title)
--FROM data_analyst_jobs
--WHERE title NOT like '%Analyst%' AND title NOT like'%Analytics%';

--SELECT (title)
--FROM data_analyst_jobs
--WHERE title NOT like '%Analyst%' AND title NOT like'%Analytics%';