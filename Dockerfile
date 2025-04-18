FROM ubuntu:20.04

# Set timezone environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# Install dependencies
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk wget python3 python3-pip tzdata && \
    apt-get clean

# Install Python libraries
RUN pip3 install pandas

# Install Spark
ENV SPARK_VERSION=3.5.5
RUN wget https://downloads.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop3.tgz && \
    tar -xzf spark-${SPARK_VERSION}-bin-hadoop3.tgz -C /opt && \
    rm spark-${SPARK_VERSION}-bin-hadoop3.tgz
ENV SPARK_HOME=/opt/spark-${SPARK_VERSION}-bin-hadoop3
ENV PATH=$SPARK_HOME/bin:$PATH

# Start Spark master and worker
CMD ["/bin/bash", "-c", "$SPARK_HOME/sbin/start-master.sh && $SPARK_HOME/sbin/start-worker.sh spark://localhost:7077 && bash"]