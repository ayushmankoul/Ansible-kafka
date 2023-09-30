#!/bin/bash
source /opt/kafka-config/zookeeper_param.txt
echo '# The number of milliseconds of each tick'>zookeeper.properties
echo 'tickTime='$tickTime>>zookeeper.properties
echo '# The number of ticks that the initial'>>zookeeper.properties
echo '# synchronization phase can take'>>zookeeper.properties
echo 'initLimit='$initLimit>>zookeeper.properties
echo '# The number of ticks that can pass between'>>zookeeper.properties
echo '# sending a request and getting an acknowledgement'>>zookeeper.properties
echo 'syncLimit='$syncLimit>>zookeeper.properties
echo '# the directory where the snapshot is stored.'>>zookeeper.properties
echo '# do not use /tmp for storage, /tmp here is just'>>zookeeper.properties
echo '# example sakes.'>>zookeeper.properties
echo 'dataDir=/var/zk-data'>>zookeeper.properties
echo '#dataLogDir=/var/zk-logs'>>zookeeper.properties
echo '# the port at which the clients will connect'>>zookeeper.properties
echo 'clientPort=2181'>>zookeeper.properties
echo '# the maximum number of client connections.'>>zookeeper.properties
echo '# increase this if you need to handle more clients'>>zookeeper.properties
echo '#maxClientCnxns=200'>>zookeeper.properties
echo '#'>>zookeeper.properties
echo '# Be sure to read the maintenance section of the'>>zookeeper.properties
echo '# administrator guide before turning on autopurge.'>>zookeeper.properties
echo '#'>>zookeeper.properties
echo '# http://zookeeper.apache.org/doc/current/zookeeperAdmin.html#sc_maintenance'>>zookeeper.properties
echo '#'>>zookeeper.properties
echo '# The number of snapshots to retain in dataDir'>>zookeeper.properties
echo '#autopurge.snapRetainCount=3'>>zookeeper.properties
echo '# Purge task interval in hours'>>zookeeper.properties
echo '# Set to "0" to disable auto purge feature'>>zookeeper.properties
echo '#autopurge.purgeInterval=1'>>zookeeper.properties
echo '#'>>zookeeper.properties
echo '# Zookeeper Ensemble (as example for XX.YY.ZZ.7):'>>zookeeper.properties
IFS=$'\n'
ip_addr = $ip_address
for line in `ip_addr`
do
 	ip=`echo $line|cut -d" " -f1`
	id=`echo $ip|cut -d"." -f4`
	echo "server."$id=$ip":2888:3888">>zookeeper.properties
done


cp zookeeper.properties /opt/zookeeper-3.4.11/conf/zoo.cfg