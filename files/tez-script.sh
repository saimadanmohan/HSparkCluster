cd ~/protobuf-2.5.0
./configure
make
make check
make install
ldconfig

cd ~/apache-tez-0.9.0-src
mvn clean package -DskipTests=true -Dmaven.javadoc.skip=true
tar -xvzf ~/apache-tez-0.9.0-src/tez-dist/target/tez-0.9.0-minimal.tar.gz -C  ~/hadoop/tez_jars

#hadoopclasspath="export HADOOP_CLASSPATH=~/Hadoop/etc/tez:hadoop/tez_jars/*:hadoop/tez_jars/lib/*"
#hadoop_envfile=~/hadoop/etc/hadoop/hadoop-env.sh
#echo -e "$hadoopclasspath\n$(cat $hadoop_envfile)" > $hadoop_envfile
