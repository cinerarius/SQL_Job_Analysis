WITH skills_demand AS
    (SELECT
        skills_dim.skill_id,
        COUNT(job_postings_fact.job_id) AS job_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title = 'Data Analyst' AND
        salary_year_avg IS NOT NULL 
    GROUP BY skills_dim.skill_id
),
average_salary AS
    (SELECT
        skills_dim.skill_id,
        ROUND(AVG(salary_year_avg), 2) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL 
    GROUP BY skills_dim.skill_id
)
SELECT 
    skills_demand.skill_id,
    skills_dim.skills,
    skills_demand.job_count,
    average_salary.avg_salary
FROM
    skills_demand
    INNER JOIN average_salary ON average_salary.skill_id = skills_demand.skill_id
    INNER JOIN skills_dim ON skills_demand.skill_id = skills_dim.skill_id;