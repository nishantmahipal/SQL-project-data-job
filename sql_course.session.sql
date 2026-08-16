/*Select 
   Count(job_id) as number_of_jobs,
    
    CASE
        WHEN salary_year_avg <=50000 THEN 'Low Salary'
        WHEN salary_year_avg >50000 and salary_year_avg <= 100000 THEN 'Standard Salary'
        Else 'High Salary'
    END AS DAta_Analyst_Salary
FROM
    job_postings_fact
WHERE
    salary_year_avg is not Null
    and job_title_short = 'Data Analyst'
GROUP BY
    DAta_Analyst_Salary


SELECT 
    skill_count.skill_id,
    Skills_dim.skills,
    skill_count.demand_count
from (
    SELECT 
    skill_id,
    Count(job_id) as demand_count
    From skills_job_dim
    Group By skill_id
    ) as skill_count
Left Join skills_dim
On skills_dim.skill_id = skill_count.skill_id
order by skill_count.demand_count desc
Limit 5*/

WITH skill_job_count AS (
Select 
    skills_job_dim.skill_id,
    skills_dim.skills,
    Count (*) as number_of_jobs
FROM
    skills_dim
Inner JOIN skills_job_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
Inner JOIN job_postings_fact
    On job_postings_fact.job_id = skills_job_dim.job_id
WHERE
    job_postings_fact.job_work_from_home = 'true'
    GROUP BY
    skills_dim.skills, skills_job_dim.skill_id )

SELECT 
   *
froM  skill_job_count
order by number_of_jobs DESC

