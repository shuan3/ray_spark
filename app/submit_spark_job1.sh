#!/bin/bash

submit_spark_job() {
  local script_path="$1"
  local app_name="${2:-SparkApp}"  # Optional second arg

  spark-submit \
  --master spark://spark-master:7077 \
  --deploy-mode client \
  "$script_path"
}

# Call the function with path inside the container
submit_spark_job "/opt/bitnami/spark/app/test.py" 