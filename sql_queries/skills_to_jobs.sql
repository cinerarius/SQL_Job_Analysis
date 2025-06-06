/*
Find the count of the number of remote jobs posting per skill
    -Display the top 10 skills by their demand in remote jobs
    -Include skill_id, skill_name, and the count of remote jobs with that skill
*/

WITH remote_job_skills AS
    (SELECT 
        skill_id,
        COUNT(*) AS skill_count
    FROM skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS job_postings
        ON job_postings.job_id = skills_to_job.job_id
    WHERE
        job_postings.job_work_from_home = TRUE AND
        job_postings.job_title_short = 'Data Analyst'
    GROUP BY
        skill_id)

SELECT 
    skill.skill_id,
    skill.skills,
    skill_count
    FROM remote_job_skills
INNER JOIN skills_dim AS skill
    ON skill.skill_id = remote_job_skills.skill_id
ORDER BY
    skill_count DESC
LIMIT 10;