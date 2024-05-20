#!/bin/bash

# Get the service type (webserver or scheduler)
SERVICE_TYPE=${1}

# Shift the positional parameters to the left so that the remaining parameters can be passed to the Airflow entrypoint
shift 1

# Execute the Airflow entrypoint with the remaining parameters
if [ "${SERVICE_TYPE}" = "webserver" ]; then
  exec /entrypoint airflow webserver "${@}"
elif [ "${SERVICE_TYPE}" = "scheduler" ]; then
  exec /entrypoint airflow scheduler "${@}"
else
  echo "Unknown service type: ${SERVICE_TYPE}"
  exit 1
fi
