---
title: Johannes Smit
contact:
  - display: h@nnes.dev
    link: mailto:h@nnes.dev
  - display: ha.nnes.dev
    link: https://ha.nnes.dev/
  - display: github.com/hasnep
    link: https://github.com/hasnep/
---

Data engineer with expertise in building data pipelines for analysis and machine learning solutions in both Taiwan and the UK.

### Employment

- November 2023 to Present: Data Engineer, Mobagel (Taipei, Taiwan)
  - Engineered a 90% cost reduction (from $2000 to $200) to onboard a new client with 10 billion historical events (5TB) and 13 million new daily events, 7 times larger than all previous clients combined. (BigQuery)
  - Debugged a problem where the model pipeline was 18 times slower for one client than all other clients (3 hours vs 10 minutes) which senior engineers had been unable to resolve.
    Through in-depth query plan analysis, identified that outliers in the data were causing a join to not be efficiently run in parallel.
  - Led the design and development of a new data pipeline and client-facing dashboard to bring insights about traffic sources to clients, while working closely with product team to iterate quickly on features. (Airflow, Looker)
  - Identified a risk in secret handling and designed a new secrets management strategy which secured all our systems. (GCP)
  - Introduced property-based unit testing to automatically generate thousands of test cases which found bugs and increased the team's confidence in our data quality. (Hypothesis)
  - Introduced code quality checks to catch errors before they were pushed. (GitLab CI)
- October 2021 to November 2022: Data Engineer, Sainsbury's (London, UK)
  - Maintained and developed ELT pipelines processing structured and semi-structured data from a variety of data sources including Kafka, SFTP and S3. (Airflow, Snowflake, AWS, Terraform)
  - Was part of a team to design and develop the data engineering department's new standardised data pipeline tool, integrating dbt with Airflow to allow for significantly faster development times and enabling efficient cross-team collaboration. (dbt, Airflow, GitHub Actions, Python)
  - Designed and built a robust application to download and process large (10GB) JSON files that couldn't fit in memory by streaming the data in chunks, reducing memory requirements and preventing crashes. (Python, boto3)
  - Identified and fixed DevOps issues across teams, implementing solutions to prevent future issues through CI and encouraging software engineering best practices. (GitHub Actions, Circle CI)
- July 2019 to October 2021: Strategic Consultant (Data engineering and data science), Amey Strategic Consulting (London, UK)
  - Technical lead of a GIS (Geographic Information System) dashboard creating insights into operations and tracking KPIs for a local county council.
    - Built an accessible interactive UI using maps and graphs to empower users to explore data. (React, Mapbox GL JS, Plotly)
    - Deployed and maintained a robust backend to power the UI while keeping a high uptime and remaining secure. (Flask, SQLAlchemy, Alembic, AWS, Terraform)
    - Created ETL pipelines to load data from APIs, emails and MQTT messages into a central database. (Python, Airflow, Postgres)
    - Identified an inefficiency in the client's work allocation and developed a predictive machine learning model to enable data-driven planning.
    - Designed and built a proof-of-concept application to manage and collect data from a network of custom IoT sensors in real-time while keeping power consumption at a minimum. (MQTT, Python, Postgres)
  - Collaborated with the HR department to analyse the gender pay gap of thousands of employees across all departments in the company. (Python, R)
    - The visualisations, statistics and forecasts I produced guided the company when becoming a living-wage employer.
    - Developed a Python package to automatically perform these forecasts and trained an HR analyst with no prior Python knowledge to use the package to produce new data reports.
  - Completed a focused two-week analytics sprint evaluating the output of a contract with a local council.
    - Collected user-stories and datasets from the client's team to understand their processes and goals.
    - Delivered an engaging presentation with insightful data visualisations highlighting key successes and opportunities for improvement.
  - Joined a team during "crunch time" to successfully complete delivery of an interactive computer-vision dashboard to review dashcam footage, removing the need for a human co-driver. (Python, Azure ML SDK)
- June 2018 to September 2018: Data Science Services Intern, Advant Analytics (Taipei, Taiwan)
  - Created extensions for data cleansing and data mining in SPSS and SPSS Modeller using Python and R.
    - Added features quickly, made an intuitive and powerful interface for the extensions and documented the processes used.
  - Wrote an in-depth tutorial on programming using SPSS Syntax from scratch, allowing new users to understand the important features of the language quickly and start analysing data.

### Education

- 2015 to 2019: MMath Mathematics, 2:1 (University of Exeter, UK)
  - Dissertation used regression and Gaussian processes to provide human-understandable insights of machine learning algorithms.
    - Successfully modelled a neural network using multiple techniques in a way that simplified the complex internal system to well-understood statistical processes. (R, Keras)
  - Other modules included statistical modelling, machine learning and spatio-temporal statistics.

### Skills

- As well as being fluent in Python, SQL and Terraform, I develop open-source projects in Gleam, Roc and Julia as a hobby.
  My portfolio of personal projects can be found on my website ([`ha.nnes.dev`](https://ha.nnes.dev/)).
- Languages: English (native), Afrikaans (fluent), Spanish (intermediate) and Mandarin (beginner).
