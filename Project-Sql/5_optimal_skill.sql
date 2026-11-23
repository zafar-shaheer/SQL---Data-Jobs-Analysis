/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

SELECT 
    skills_job_dim.skill_id,
    skills_dim.skills,
    ROUND(AVG(jpf.salary_year_avg),0) AS salary,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim 
    ON skills_job_dim.job_id = jpf.job_id
INNER JOIN skills_dim
    ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    jpf.job_title_short = 'Data Analyst' AND
    jpf.job_location = 'Anywhere' AND 
    jpf.salary_year_avg IS NOT NULL
GROUP BY 
    skills_dim.skills,
    skills_job_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    demand_count DESC,
    salary DESC
LIMIT 25
