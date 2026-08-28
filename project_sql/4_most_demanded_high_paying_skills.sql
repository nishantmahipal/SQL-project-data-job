Select 
    skills_dim.skills as skills_name,
    count(job_postings_fact.job_id) as demand_count,
    round(avg(job_postings_fact.salary_year_avg), 2) as salary
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
Inner JOIN skills_dim On skills_job_dim.skill_id = skills_dim.skill_id
where job_postings_fact.salary_year_avg is not NULL and 
        job_postings_fact.job_title_short = 'Data Analyst' and 
        job_postings_fact.job_work_from_home = true
group By skills_name
order by 
     salary desc,
    demand_count desc
limit 25