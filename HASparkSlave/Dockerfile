FROM ubuntu:16.04
LABEL maintainer="AMSG2"

USER root

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    openjdk-8-jdk \
    wget \
    vim \
    ssh \
    curl \
    net-tools \
    openssh-server \
    build-essential \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://archive.apache.org/dist/hadoop/core/hadoop-2.7.2/hadoop-2.7.2.tar.gz http://mirror.navercorp.com/apache/spark/spark-2.0.2/spark-2.0.2-bin-hadoop2.7.tgz
RUN tar -xvzf hadoop-2.7.2.tar.gz
#RUN tar -xvzf protobuf-2.5.0.tar.gz
#RUN tar -xvzf apache-tez-0.9.0-src.tar.gz
RUN tar -xvzf spark-2.0.2-bin-hadoop2.7.tgz

RUN mv spark-2.0.2-bin-hadoop2.7 ~/spark
#RUN mv apache-tez-0.9.0-src ~/apache-tez-0.9.0-src
#RUN mv hadoop-2.7.2/etc/hadoop/mapred-site.xml.template hadoop-2.7.2/etc/hadoop/apred-site.xml
RUN mv hadoop-2.7.2 ~/hadoop
#RUN mv protobuf-2.5.0 ~/protobuf-2.5.0
RUN rm hadoop-2.7.2.tar.gz  spark-2.0.2-bin-hadoop2.7.tgz
COPY files /tmp
RUN cat tmp/bootstrap.sh >  /etc/bootstrap.sh
RUN cat tmp/core-site.xml >  ~/hadoop/etc/hadoop/core-site.xml
RUN cat tmp/hdfs-site.xml > ~/hadoop/etc/hadoop/hdfs-site.xml
RUN cat tmp/fair-scheduler.xml > ~/hadoop/etc/fair-scheduler.xml
RUN cat tmp/mapred-site.xml > ~/hadoop/etc/hadoop/mapred-site.xml
RUN cat tmp/yarn-site.xml > ~/hadoop/etc/hadoop/yarn-site.xml
RUN mv tmp/slaves ~/hadoop/etc/hadoop/slaves
RUN mv tmp/spark-slaves ~/spark/conf/slaves
RUN cat tmp/spark-defaults.conf > ~/spark/conf/spark-defaults.conf
RUN chmod +x /tmp/setup.sh
RUN chmod +x /etc/bootstrap.sh
RUN chmod +x /tmp/master-node.sh
RUN chmod +x /tmp/spark-setup.sh
RUN /tmp/setup.sh
VOLUME /data

RUN apt-get update && \
    apt-get install -y --force-yes software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get install -y  python2.7
#RUN cp /tmp/id_rsa ~/.ssh/
#RUN cp /tmp/id_rsa.pub ~/.ssh/
#RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys;
#RUN echo 'StrictHostKeyChecking no' >> ~/.ssh/config
CMD ["/etc/bootstrap.sh", "-d"]

