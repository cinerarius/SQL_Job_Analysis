/*
Find job postings from the first quarter that have a salary greater than 70k
    -Combine job posting tables from the first quarter of 2023
    -Gets job postings with an average yearly salary > 70k
*/

WITH first_quarter_jobs AS 
    (
    SELECT 
        job_id,
        job_title_short,
        job_location,
        salary_year_avg,
        EXTRACT(MONTH FROM job_posted_date) AS job_posted_month,
        EXTRACT(YEAR FROM job_posted_date) AS job_posted_year
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) IN (1, 2, 3, 4, 5, 6) AND
            EXTRACT(YEAR FROM job_posted_date) = 2023
    )

SELECT 
    job_id,
    job_title_short,
    job_location,
    salary_year_avg,
    job_posted_month
FROM first_quarter_jobs
WHERE salary_year_avg > 70000
ORDER BY salary_year_avg DESC;