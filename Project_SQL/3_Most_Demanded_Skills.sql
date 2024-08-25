/*
QUESTION : What are the most in-demand skills for Data Analysts ?
- Join job postings to inner join table similar to query 2.
- Identify the Top 5 in-demand skills for Data anaylst.
- Focus on all job postings
- WHY ? Retrieves the Top 5 skills with the highest demand in the job market for job seekers.
*/

SELECT 
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
GROUP BY
    skills
ORDER BY
    DMD_count DESC
LIMIT 5


/*
Skills In-Demand Insight:
- SQL is mentioned almost twice as much as Excel, indicating it is the primary skill required across most job postings.
- Python is slightly less in demand than Excel but still crucial, reflecting its growing importance in data science and advanced analytics.
- Tableau and Power BI are also in demand, with Tableau being slightly more prevalent than Power BI. This shows a strong need for data visualization skills.


~ RESULTS

[
  {
    "skills": "sql",
    "dmd_count": "92628"
  },
  {
    "skills": "excel",
    "dmd_count": "67031"
  },
  {
    "skills": "python",
    "dmd_count": "57326"
  },
  {
    "skills": "tableau",
    "dmd_count": "46554"
  },
  {
    "skills": "power bi",
    "dmd_count": "39468"
  }
]

*/