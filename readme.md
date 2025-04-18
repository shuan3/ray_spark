https://github.com/apache/spark-docker/blob/master/3.5.5/scala2.12-java11-python3-r-ubuntu/Dockerfile


using Dockerfile
docker build -t ray_spark_image:latest .
<!-- Explanation:
-it: Runs the container in interactive mode with a terminal.
--rm: Automatically removes the container after it stops.
ray_spark_image:latest: Specifies the image name and tag to run. -->


<!-- Additional Notes:
-p 8080:8080: Maps port 8080 on the host to port 8080 in the container (useful for Spark's web UI).
-v $(pwd):/app: Mounts the current directory to /app in the container (adjust as needed). -->

<!-- For Local Mode -->
spark-submit --master local[*] /app/test.py

<!-- For Cluster Mode -->
docker run -it --rm -p 8080:8080 -p 4040:4040 -v "D:\Github\ray_spark:/app" ray_spark_image:latest


docker run -it --rm -p 8080:8080 -p 7077:7077 -p 4040:4040 -v "D:\Github\ray_spark:/app" ray_spark_image:latest

<!-- -p 8080:8080: Maps the Spark Master UI to your host.
-p 7077:7077: Maps the Spark master port for cluster communication.
-p 4040:4040: Maps the Spark Job Monitoring UI. -->
spark-submit \
  --master spark://localhost:7077 \
  --deploy-mode cluster \
  /app/test.py



spark-submit \
  --master spark://53946e27214b:7077 \
  --deploy-mode client \
  /app/test.py

spark-submit \
  --master spark://<container-ip>:7077 \
  --deploy-mode client \
  /app/test.py

docker-compose up --build
docker-compose down


  http://localhost:8080


  docker exec -it spark-master /opt/bitnami/spark/bin/spark-submit \
  --master spark://spark-master:7077 \
  --deploy-mode client \
  /opt/bitnami/spark/test.py


spark-submit \
  --master spark://spark-master:7077 \
  --deploy-mode client \
  /opt/bitnami/spark/bin/spark-submit