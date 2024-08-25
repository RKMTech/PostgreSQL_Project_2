/*
Question: What are the most optimal skills to learn ?
- Identify the high demand skills with a demand count higher than 20 that is associated with high average salaries for Data Analyst roles.
- Concentrate on remote positions with specified salaries.
- WHY ? To target skills that offer job security (high demand) and financial benefits (high salaries).
*/

WITH most_demanded_skills AS ( SELECT 
    skills_dim.skill_id,
    skills,
    COUNT(skills_job_dim.job_id) AS DMD_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
AND
    job_work_from_home = True
AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
),
most_paying_skills AS ( SELECT 
    skills_dim.skill_id,
    skills,
    ROUND( AVG(salary_year_avg),2) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
AND
    job_work_from_home = True
AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
)

SELECT 
    most_demanded_skills.skill_id,
    most_paying_skills.skills,
    DMD_count,
    avg_salary
FROM
    most_demanded_skills
INNER JOIN most_paying_skills
ON most_demanded_skills.skill_id = most_paying_skills.skill_id
WHERE 
    dmd_count > 20
ORDER BY 
    avg_salary DESC,
    dmd_count DESC


-- Rewriting The Same Query More Concisely

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS DMD_count,
    ROUND( AVG(job_postings_fact.salary_year_avg),2) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
AND
    job_work_from_home = True
AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 20
ORDER BY
    avg_salary DESC,
    dmd_count DESC


/*
Most Optimal Skils Insight:
- High Average Salaries: Skills like Go, Hadoop, Snowflake, and Azure are associated with high average salaries and are in high demand, indicating their importance and specialized nature.
- Consistent Demand: Skills such as Python, R, and Tableau show strong demand and competitive salaries, reflecting their broad utility in data analysis.
- Emerging Tools: Tools like Looker and platforms like Snowflake and Azure highlight the evolving landscape of data analysis and visualization technologies.


~RESULTS 

[
  {
    "skill_id": 8,
    "skills": "go",
    "dmd_count": "27",
    "avg_salary": "115319.89"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "dmd_count": "22",
    "avg_salary": "113192.57"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "dmd_count": "37",
    "avg_salary": "112947.97"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "dmd_count": "34",
    "avg_salary": "111225.10"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "dmd_count": "32",
    "avg_salary": "108317.30"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "dmd_count": "37",
    "avg_salary": "104533.70"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "dmd_count": "49",
    "avg_salary": "103795.30"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "dmd_count": "236",
    "avg_salary": "101397.22"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "dmd_count": "148",
    "avg_salary": "100498.77"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "dmd_count": "230",
    "avg_salary": "99287.65"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "dmd_count": "63",
    "avg_salary": "98902.37"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "dmd_count": "63",
    "avg_salary": "98902.37"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "dmd_count": "35",
    "avg_salary": "97785.73"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "dmd_count": "110",
    "avg_salary": "97431.30"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "dmd_count": "398",
    "avg_salary": "97237.16"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "dmd_count": "28",
    "avg_salary": "97200.00"
  },
  {
    "skill_id": 199,
    "skills": "spss",
    "dmd_count": "24",
    "avg_salary": "92169.68"
  },
  {
    "skill_id": 22,
    "skills": "vba",
    "dmd_count": "24",
    "avg_salary": "88783.29"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "dmd_count": "58",
    "avg_salary": "88701.09"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "dmd_count": "256",
    "avg_salary": "87288.21"
  },
  {
    "skill_id": 192,
    "skills": "sheets",
    "dmd_count": "32",
    "avg_salary": "86087.79"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "dmd_count": "48",
    "avg_salary": "82576.04"
  }
]

*/