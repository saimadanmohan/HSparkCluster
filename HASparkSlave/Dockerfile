FROM ubuntu:16.04
LABEL maintainer="AMSG2"

USER root

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    openjdk-8-jdk \
    wget \
    vim \
    ssh \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://archive.apache.org/dist/hadoop/core/hadoop-2.7.2/hadoop-2.7.2.tar.gz https://github.com/google/protobuf/releases/download/v2.5.0/protobuf-2.5.0.tar.gz http://apache.claz.org/tez/0.9.0/apache-tez-0.9.0-src.tar.gz
RUN tar -xvzf hadoop-2.7.2.tar.gz
RUN tar -xvzf protobuf-2.5.0.tar.gz
RUN tar -xvzf apache-tez-0.9.0-src.tar.gz
RUN mv apache-tez-0.9.0-src ~/apache-tez-0.9.0-src
#RUN mv hadoop-2.7.2/etc/hadoop/mapred-site.xml.template hadoop-2.7.2/etc/hadoop/apred-site.xml
RUN mv hadoop-2.7.2 ~/hadoop
RUN mv protobuf-2.5.0 ~/protobuf-2.5.0
RUN rm hadoop-2.7.2.tar.gz protobuf-2.5.0.tar.gz apache-tez-0.9.0-src.tar.gz
COPY files /tmp
RUN cat tmp/bootstrap.sh >  /etc/bootstrap.sh
RUN cat tmp/core-site.xml >  ~/hadoop/etc/hadoop/core-site.xml
RUN cat tmp/hdfs-site.xml > ~/hadoop/etc/hadoop/hdfs-site.xml
RUN cat tmp/fair-scheduler.xml > ~/hadoop/etc/fair-scheduler.xml
RUN cat tmp/mapred-site.xml > ~/hadoop/etc/hadoop/mapred-site.xml
RUN mv tmp/slaves ~/hadoop/etc/hadoop/slaves
RUN chmod +x /tmp/setup.sh
RUN chmod +x /etc/bootstrap.sh
RUN chmod +x /tmp/master-node.sh
RUN /tmp/setup.sh
#RUN cp /tmp/id_rsa ~/.ssh/
#RUN cp /tmp/id_rsa.pub ~/.ssh/
#RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys;
#RUN echo 'StrictHostKeyChecking no' >> ~/.ssh/config
CMD ["/etc/bootstrap.sh", "-d"]

