cd ~/protobuf-2.5.0
./configure
make
make check
make install
ldconfig
cd ~/apache-tez-0.9.0-src
mvn clean package -DskipTests=true -Dmaven.javadoc.skip=true
~/hadoop/bin/hadoop dfs -mkdir /apps
~/hadoop/bin/hadoop dfs -mkdir /apps/tez
~/hadoop/bin/hadoop dfs -copyFromLocal ~/apache-tez-0.9.0-src/tez-dist/target/tez-0.9.0.tar.gz /apps/tez/

