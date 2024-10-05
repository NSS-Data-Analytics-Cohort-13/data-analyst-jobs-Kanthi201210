--Q1) 1793
--Q2) ExxonMobil
--Q3) 21;27
--Q4) 416-- did not include TN; corrected answer is 3
--Q5) 151
--Q6) NE-- correct answer but need to add DESC and remove DISTINCT since GROUP BY function will already narrow the field
--Q7) 881
--Q8) 230
--Q9) 41 (including "null)--Corrected answer: When adding WHERE company IS NOT NULL, number becomes 40--
--Q10) General Motors--Correction using corrected query from question 9 results in 6 companies: Nike, Unilever, General Motors, Kaiser, Microsoft, American Express
--Q11) 1636--correction using DISTINCT and ILIKE results in 774
--Q12) 39;  Many of the resulting job titles may still contain the word analyst, but the case is not is not the exact same (Ex. ANALYST, analyst) --corrected to 4, using ILIKE; this results in Tableau-related jobs, such as data visualization, developer, PM/BA


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

--Corrected query:
--SELECT COUNT (*)
--FROM data_analyst_jobs
--WHERE location='TN' OR location='KY';

--Q4)How many postings in Tennessee have a star rating above 4?
--SELECT COUNT(*)
--FROM data_analyst_jobs
--WHERE star_rating>4.0;

--CORRECTION
--SELECT COUNT(*)
--FROM data_analyst_jobs
--WHERE location = 'TN' AND star_rating>'4.0';


--Q5)How many postings in the dataset have a review count between 500 and 1000?

--SELECT COUNT(*)
--FROM data_analyst_jobs
--WHERE review_count>=500 and review_count <=1000;

--2nd option:
--SELECT COUNT(*)
--FROM data_analyst_jobs
--WHERE review_count BETWEEN 500 AND 1000;

--Q6)Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?
--SELECT DISTINCT location AS state, AVG(star_rating) AS avg_rating
--FROM data_analyst_jobs
--GROUP BY location
--ORDER BY avg_rating;

--CORRECTION
--SELECT location AS state, AVG(star_rating) AS avg_rating
--FROM data_analyst_jobs
--GROUP BY location
--ORDER BY avg_rating DESC;

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

--CORRECTION
--SELECT company, AVG(star_rating) AS avg_star_rating
--FROM data_analyst_jobs
--WHERE company IS NOT NULL
--GROUP BY company
--HAVING MIN(review_count)>5000;

--What is this for?
--SELECT company, title, location, review_count, star_rating
--FROM data_analyst_jobs
--order by company


--Q10)Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
--SELECT company, AVG(star_rating)
--FROM data_analyst_jobs
--WHERE review_count>5000
--GROUP BY company
--ORDER BY AVG(star_rating) DESC;

--CORRECTION
--SELECT company, AVG(star_rating) AS avg_star_rating
--FROM data_analyst_jobs
--WHERE company IS NOT NULL
--GROUP BY company
--HAVING MIN(review_count)>5000
--ORDER BY AVG(star_rating) DESC;

--Q11)Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

--SELECT title
--FROM data_analyst_jobs
--WHERE title ILIKE '%Analyst%';

--CORRECTION
--SELECT DISTINCT title
--FROM data_analyst_jobs
--WHERE title ILIKE '%Analyst%';

--SELECT COUNT (title)
--FROM data_analyst_jobs
--WHERE title LIKE '%Analyst%';

--Q12)How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

--SELECT DISTINCT COUNT (title)
--FROM data_analyst_jobs
--WHERE title NOT like '%Analyst%' AND title NOT like'%Analytics%';

--SELECT DISTINCT (title)
--FROM data_analyst_jobs
--WHERE title NOT like '%Analyst%' AND title NOT like'%Analytics%';

--CORRECTION
--SELECT DISTINCT COUNT (title)
--FROM data_analyst_jobs
--WHERE title NOT ilike '%Analyst%' AND title NOT ilike'%Analytics%';

--SELECT DISTINCT (title)
--FROM data_analyst_jobs
--WHERE title NOT ilike '%Analyst%' AND title NOT ilike'%Analytics%';