# Introduction
**SQL** (Structured Query Language) is a fundamental tool for accessing, managing, and analyzing data stored in relational databases. **SQL** provides a structured approach to querying and manipulating data, which is crucial for drawing meaningful insights from complex datasets.

SQL queries ? [Project_SQL Folder](/Project_SQL/)
# Background
This is one of my projects to showcase my progress on **SQL** and my improvement to solve complex queries on Data Analyst job market data packed with insights on job titles, salaries, locations and essential skills.

### The questions I wanted to answer through my SQL queries were:

1. What are the top paying Data Analyst jobs?
2. What skills are required for the Top paying Data Analyst jobs ?
3. What are the most in-demand skills for Data Analysts ?
4. What is the most paying skills for Data Analyst based on Salary ?
5. What are the most optimal skills to learn ?

# Tools I Used
- SQL

- PostgreSQL

- Visual Studio Code

- Git & Github
# The Analysis
These queries collectively aim to provide a comprehensive view of the data analyst job market, focusing on most demanded skills, most paying jobs, most paying job skill etc.

Here's how I approached one of the question:
### 1. What is the Top 20 most paying skills for Data Analyst based on Salary
```sql
SELECT 
    Skills,
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
````
Skills Based On Average Salary Insight:
- **Highest Salaries:** Skills related to specific technologies or platforms that are either highly specialized or emerging tend to command higher salaries.
- **Specialized Technologies:** Skills such as SVN, Solidity, and Couchbase indicate a high level of specialization and thus a higher average salary.
- **Advanced AI/ML Skills:** Deep learning frameworks (e.g., TensorFlow, Keras) and machine learning platforms (e.g., DataRobot) also command high salaries due to their complexity and demand.

# Conclusion

Overall, this project underscores the importance of SQL in the data analytics field and provides valuable insights for navigating career development and opportunities within this dynamic industry. Not only did I enchance my SQL skills but I learned new skills along the way which will be detrimental for the career I am trying to pursuit .