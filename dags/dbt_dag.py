from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.utils.dates import days_ago

default_args = {
    'owner': 'airflow',
}

with DAG(
    'dbt_dag',
    default_args=default_args,
    description='A simple dbt DAG',
    schedule_interval='@daily',
    start_date=days_ago(2),
    catchup=False,
) as dag:

    run_dbt_seed = BashOperator(
        task_id='dbt_seed',
        bash_command='dbt seed --profiles-dir /usr/local/airflow/dbt',
    )

    run_dbt_run = BashOperator(
        task_id='dbt_run',
        bash_command='dbt run --profiles-dir /usr/local/airflow/dbt',
    )

    run_dbt_test = BashOperator(
        task_id='dbt_test',
        bash_command='dbt test --profiles-dir /usr/local/airflow/dbt',
    )

    run_dbt_seed >> run_dbt_run >> run_dbt_test