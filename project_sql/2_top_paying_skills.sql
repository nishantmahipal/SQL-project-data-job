With top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        name as company_name,
        job_location,
        job_schedule_type,
        salary_year_avg
    from job_postings_fact as j
    Left JOIN company_dim as cd
        on j.company_id = cd.company_id

    where 
        job_title_short = 'Data Analyst' AND
        job_location = 'India' and 
        salary_year_avg is not NULL
    order by 
            salary_year_avg desc
    Limit 10 
)
SELECT 
    row_number() OVER (ORDER BY salary_year_avg DESC) AS sr_no,
    top_paying_jobs.*,
    skills
from top_paying_jobs
INNER JOIN skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
Inner JOIN skills_dim On skills_job_dim.skill_id = skills_dim.skill_id
order By
     salary_year_avg desc
