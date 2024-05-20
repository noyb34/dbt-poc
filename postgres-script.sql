CREATE USER airflow_user WITH PASSWORD 'airflow_pass';
CREATE DATABASE airflow_db;
ALTER DATABASE airflow_db OWNER TO airflow_user;
GRANT ALL PRIVILEGES ON DATABASE airflow_db TO airflow_user;
GRANT ALL ON SCHEMA public TO airflow_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO airflow_user;
ALTER USER airflow_user SET search_path = public;
