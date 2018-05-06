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
    git \
    maven \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://archive.apache.org/dist/hadoop/core/hadoop-2.7.2/hadoop-2.7.2.tar.gz https://github.com/google/protobuf/releases/download/v2.5.0/protobuf-2.5.0.tar.gz http://apache.claz.org/tez/0.9.0/apache-tez-0.9.0-src.tar.gz http://mirror.navercorp.com/apache/spark/spark-2.0.2/spark-2.0.2-bin-hadoop2.7.tgz
RUN git clone  https://github.com/intel-hadoop/HiBench

RUN tar -xvzf hadoop-2.7.2.tar.gz
RUN tar -xvzf protobuf-2.5.0.tar.gz
RUN tar -xvzf apache-tez-0.9.0-src.tar.gz
RUN tar -xvzf spark-2.0.2-bin-hadoop2.7.tgz

RUN mv spark-2.0.2-bin-hadoop2.7 ~/spark
RUN mv apache-tez-0.9.0-src ~/apache-tez-0.9.0-src
RUN mv HiBench ~/HiBench
RUN mv hadoop-2.7.2 ~/hadoop
RUN mv protobuf-2.5.0 ~/protobuf-2.5.0
RUN rm hadoop-2.7.2.tar.gz protobuf-2.5.0.tar.gz apache-tez-0.9.0-src.tar.gz spark-2.0.2-bin-hadoop2.7.tgz

RUN mkdir ~/hadoop/tez_jars
RUN mkdir ~/hadoop/etc/tez
#RUN tar -xvzf ~/apache-tez-0.9.0-src/tez-dist/target/tez-0.9.0-minimal.tar.gz -C  ~/hadoop/tez_jars
#RUN mv tez_jars ~/hadoop/tez_jars
COPY files /tmp
#RUN cat tmp/bootstrap.sh >  /etc/bootstrap.sh
RUN cat tmp/core-site.xml >  ~/hadoop/etc/hadoop/core-site.xml
RUN cat tmp/hdfs-site.xml > ~/hadoop/etc/hadoop/hdfs-site.xml
RUN cat tmp/fair-scheduler.xml > ~/hadoop/etc/fair-scheduler.xml
RUN cat tmp/mapred-site.xml > ~/hadoop/etc/hadoop/mapred-site.xml
RUN cat tmp/yarn-site.xml > ~/hadoop/etc/hadoop/yarn-site.xml
RUN cat tmp/tez-site.xml > ~/hadoop/etc/tez/tez-site.xml
RUN mv tmp/slaves ~/hadoop/etc/hadoop/slaves
RUN mv tmp/spark-slaves ~/spark/conf/slaves 
RUN cat tmp/spark-defaults.conf > ~/spark/conf/spark-defaults.conf
RUN chmod +x /tmp/setup.sh
RUN chmod +x /tmp/master-node.sh
RUN chmod +x /tmp/tez-script.sh
RUN chmod +x /tmp/spark-setup.sh
RUN chmod +x /tmp/hibench-setup.sh
RUN /tmp/setup.sh

RUN /tmp/hibench-setup.sh
RUN echo '{ "allow_root": true }' > /root/.bowerrc

RUN /tmp/tez-script.sh
RUN tar -xvzf ~/apache-tez-0.9.0-src/tez-dist/target/tez-0.9.0-minimal.tar.gz -C  ~/hadoop/tez_jars
VOLUME /data

RUN cat tmp/bootstrap.sh >  /etc/bootstrap.sh
RUN chmod +x /etc/bootstrap.sh
CMD ["/etc/bootstrap.sh", "-d"]
