# dbt-Airflow-POC

This repository provides a proof-of-concept (POC) for using dbt (data build tool) and Airflow to manage data transformations across two PostgreSQL environments (`dev` and `staging`) using CI/CD practices with GitHub Actions and Airflow orchestration.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
  - [Clone the Repository](#clone-the-repository)
  - [Build and Run the Containers](#build-and-run-the-containers)
- [Running dbt Commands](#running-dbt-commands)
- [Directory Structure](#directory-structure)
- [Airflow DAGs](#airflow-dags)
- [License](#license)

## Prerequisites

- Docker
- Docker Compose

## Setup

### Clone the Repository

```sh
git clone https://github.com/noyb34/dbt-poc.git
cd dbt-poc
```

### Build and Run the Containers

```sh
docker-compose up -d --build
```

## Running dbt Commands

You can run dbt commands directly using Docker Compose. Make sure to navigate to the project root directory.

1. **Run dbt Seed to Load Sample Data:**

   ```sh
   docker-compose run dbt dbt seed
   ```

2. **Run dbt Models to Perform Transformations:**

   ```sh
   docker-compose run dbt dbt run 
   ```

3. **Run dbt Tests to Validate Transformations:**

   ```sh
   docker-compose run dbt dbt test
   ```

## Directory Structure

```
project-root/
├── config/
├── dags/
├── dbt_project/
│   ├── dbt_packages/
│   ├── logs/
│   ├── models/
│   ├── seeds/
│   ├── target/
│   ├── tests/
│   ├── .user.yml
│   ├── dbt_project.yml
│   └── profiles.yml
├── logs/
├── pg_config/
├── plugins/
├── .gitignore
├── docker-compose.yml
├── Dockerfile_dbt
├── Dockerfile_postgres
├── example.env
└── LICENSE
```

## Airflow DAGs

Place your Airflow DAGs in the `dags/` directory. Airflow will automatically pick up and schedule these DAGs.

## License

This project is licensed under the GPL-3.0 License. See the [LICENSE](./LICENSE) file for details.
