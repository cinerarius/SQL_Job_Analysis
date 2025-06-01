# SQL Job Analysis Project

This project analyzes job postings and skills data using SQL. The queries in this repository help answer key business questions about job demand, salaries, and optimal skills for various roles. The data is organized in several CSV files and loaded into a database using the provided SQL scripts.

## Folder Structure

- **csv_files/**: Contains the raw data files (`company_dim.csv`, `job_postings_fact.csv`, `skills_dim.csv`, `skills_job_dim.csv`).
- **project_sql/**: Contains main analysis queries for business insights.
- **sql_load/**: Scripts to create and modify the database and tables.
- **sql_queries/**: Additional queries for monthly, quarterly, and skill-based analysis.

## Query Walkthrough

### project_sql/
- **1_top_paying_jobs.sql**: Finds the highest paying jobs by analyzing average yearly salaries.
- **2_top_paying_job_skills.sql**: Identifies which skills are most common among top-paying jobs.
- **3_most_demanding_skills.sql**: Lists the most in-demand skills based on job postings.
- **4_top_skills_to_role.sql**: Maps top skills to specific job roles.
- **5_optimal_skills.sql**: Determines the optimal skills for a given role (e.g., Data Analyst) by combining demand and salary data.

### sql_load/
- **1_create_database.sql**: Script to create the main database.
- **2_create_tables.sql**: Defines the schema for all tables.
- **3_modify_tables.sql**: Alters tables as needed for analysis.

### sql_queries/
- **monthly_table_create.sql**: Creates separate tables for each month's job postings.
- **quarter_salary.sql**: Analyzes salary data by quarter.
- **skills_to_jobs.sql**: Maps skills to job postings.
- **sql_commands.sql**: Contains various example queries for filtering, joining, and aggregating job and skill data.

## How to Use

1. **Load the Data**: Use the scripts in `sql_load/` to create the database and tables, then import the CSV files.
2. **Run Analysis Queries**: Execute the queries in `project_sql/` and `sql_queries/` to generate insights about job demand, salaries, and optimal skills.
3. **Modify or Extend**: Adapt the queries to answer additional business questions or to focus on different roles/skills.

## Example Insights
- What are the top-paying jobs?
- Which skills are most in demand?
- What skills should a Data Analyst learn to maximize salary and job opportunities?
- How does job demand change month-to-month or quarter-to-quarter?

---

For more details, review the individual SQL files in each folder. Each script is commented to explain its logic and purpose.