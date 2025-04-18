https://github.com/apache/spark-docker/blob/master/3.5.5/scala2.12-java11-python3-r-ubuntu/Dockerfile


using Dockerfile
docker build -t ray_spark_image:latest .
<!-- Explanation:
-it: Runs the container in interactive mode with a terminal.
--rm: Automatically removes the container after it stops.
ray_spark_image:latest: Specifies the image name and tag to run. -->

docker run -it --rm ray_spark_image:latest

docker run -it --rm -p 8080:8080 -p 4040:4040 -v "${PWD}:/app" ray_spark_image:latest
<!-- Additional Notes:
-p 8080:8080: Maps port 8080 on the host to port 8080 in the container (useful for Spark's web UI).
-v $(pwd):/app: Mounts the current directory to /app in the container (adjust as needed). -->

<!-- For Local Mode -->
spark-submit --master local[*] /app/test.py

<!-- For Cluster Mode -->
docker run -it --rm -p 8080:8080 -p 4040:4040 -v "D:\Github\ray_spark:/app" ray_spark_image:latest

