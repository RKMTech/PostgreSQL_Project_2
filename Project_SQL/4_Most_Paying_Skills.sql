/*
QUESTION : What is the most paying skills for Data Analyst based on Salary
- Look at the average salary associated with each skill for Data Analyst positions
- Identify the Top 20 most paying skills for Data Analyst based on the average salary
- Focus on roles with specified salaries, regardless of location
- WHY ? It reveals how different skills impact salary levels for Data Analyst
*/

SELECT 
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
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 20


/*
Skills Based On Average Salary Insight:
- Highest Salaries: Skills related to specific technologies or platforms that are either highly specialized or emerging tend to command higher salaries.
- Specialized Technologies: Skills such as SVN, Solidity, and Couchbase indicate a high level of specialization and thus a higher average salary.
- Advanced AI/ML Skills: Deep learning frameworks (e.g., TensorFlow, Keras) and machine learning platforms (e.g., DataRobot) also command high salaries due to their complexity and demand.


~RESULTS 

[
  {
    "skills": "svn",
    "avg_salary": "400000.00"
  },
  {
    "skills": "solidity",
    "avg_salary": "179000.00"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515.00"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155485.50"
  },
  {
    "skills": "golang",
    "avg_salary": "155000.00"
  },
  {
    "skills": "mxnet",
    "avg_salary": "149000.00"
  },
  {
    "skills": "dplyr",
    "avg_salary": "147633.33"
  },
  {
    "skills": "vmware",
    "avg_salary": "147500.00"
  },
  {
    "skills": "terraform",
    "avg_salary": "146733.83"
  },
  {
    "skills": "twilio",
    "avg_salary": "138500.00"
  },
  {
    "skills": "gitlab",
    "avg_salary": "134126.00"
  },
  {
    "skills": "kafka",
    "avg_salary": "129999.16"
  },
  {
    "skills": "puppet",
    "avg_salary": "129820.00"
  },
  {
    "skills": "keras",
    "avg_salary": "127013.33"
  },
  {
    "skills": "pytorch",
    "avg_salary": "125226.20"
  },
  {
    "skills": "perl",
    "avg_salary": "124685.75"
  },
  {
    "skills": "ansible",
    "avg_salary": "124370.00"
  },
  {
    "skills": "hugging face",
    "avg_salary": "123950.00"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "120646.83"
  },
  {
    "skills": "cassandra",
    "avg_salary": "118406.68"
  }
]

*/