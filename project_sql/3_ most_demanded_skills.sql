Select 
    skills_dim.skills as skills_name,
    count(job_postings_fact.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
Inner JOIN skills_dim On skills_job_dim.skill_id = skills_dim.skill_id
group By skills_name
order by demand_count desc
limit 10