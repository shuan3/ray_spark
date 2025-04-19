#!/bin/bash

submit_spark_job_test() {
  local script_path="$1"
  local app_name="${2:-SparkApp}"  # Optional second arg

  docker exec -it spark-submit \
  --master spark://spark-master:7077 \
  --deploy-mode cluster \
  "$script_path"
}

# Call the function with path inside the container
submit_spark_job_test "/opt/bitnami/spark/test.py" 