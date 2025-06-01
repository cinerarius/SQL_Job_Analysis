WITH job_posting AS
    (SELECT
        job_id,
        job_title,
        job_location,
        job_schedule_type,
        salary_year_avg,
        job_posted_date
    FROM job_postings_fact
    WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL 
    ORDER BY
        salary_year_avg DESC)

SELECT 
    skills_dim.skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_posting
INNER JOIN skills_job_dim
    ON job_posting.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY skills_dim.skills
ORDER BY avg_salary DESC
LIMIT 30;