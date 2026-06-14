select 
    skills,
    round(avg(salary_year_avg), 2) as avg_salary
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where
    job_title_short = 'data analyst'
    and salary_year_avg is not null
    and job_work_from_home = true 
group by
    skills
order by
    avg_salary desc
limit 25;
