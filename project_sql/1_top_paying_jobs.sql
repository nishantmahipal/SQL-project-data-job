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
    job_location = 'Anywhere' and 
    salary_year_avg is not NULL
order by 
        salary_year_avg desc
Limit 10 
    