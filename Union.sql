SELECT 
    job_title_short,
    company_id,
    job_location
FROM   
    january_jobs

UNION

SELECT 
    job_title_short,
    company_id,
    job_location
FROM   
    feburary_jobs

UNION

SELECT 
    job_title_short,
    company_id,
    job_location
FROM   
    march_jobs;




SELECT 
    job_title_short,
    company_id,
    job_location
FROM   
    january_jobs

UNION ALL

SELECT 
    job_title_short,
    company_id,
    job_location
FROM   
    feburary_jobs

UNION ALL

SELECT 
    job_title_short,
    company_id,
    job_location
FROM   
    march_jobs;

-- Practise Problem

SELECT
    job_title_short,
    job_location,
    job_via,
    job_posted_date :: date,
    salary_year_avg
FROM (SELECT *
FROM   
    january_jobs
UNION
SELECT *
FROM   
    feburary_jobs
UNION
SELECT *
FROM   
    march_jobs
)
WHERE salary_year_avg > 70000 AND job_title_short = 'Data Analyst'
ORDER BY 
    salary_year_avg DESC;

