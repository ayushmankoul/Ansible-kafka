#!/bin/bash

 ip_addr=`hostname -i|cut -d" " -f1`
 broker_id=`echo $ip_addr|cut -d"." -f4`
 echo $broker_id
 var=""
 i=1
 IFS=$'\n'
for line in $ip_address
do
 	 ip=`echo $line`
	 if [[ $i -eq 1 ]]
	 then
		 var=$ip":2181"
		 i=$((i+1))
	else
		var=$var","$ip":2181"
	 fi

	 
done
source /opt/kafka-config/param.txt

 echo $val
 echo "############################# Server Basics #############################">server.properties
 echo>>server.properties
 echo "# The id of the broker. This must be set to a unique integer for each broker.">>server.properties
 echo "broker.id="$broker_id>>server.properties
 echo "listeners=SSL://0.0.0.0:9092">>server.properties
 echo "advertised.listeners=SSL://"$ip_addr":9092">>server.properties
 echo "# Rack of the broker. This will be used in rack aware replication assignment for fault tolerance.">>server.properties
 echo "broker.rack=RACK1">>server.properties
 echo "############################# Socket Server Settings #############################">>server.properties
 echo "# The number of threads that the server uses for receiving requests from the network and sending responses to the network" >> server.properties
 echo 'num.network.threads= '$num_network_threads>>server.properties
 echo ' '>>server.properties
echo 'num.io.threads='$num_io_threads>>server.properties
echo ' '>>server.properties
echo '# The send buffer (SO_SNDBUF) used by the socket server'>>server.properties
echo 'socket.send.buffer.bytes='$socket_send_buffer_bytes>>server.properties
echo ' '>>server.properties
echo '# The receive buffer (SO_RCVBUF) used by the socket server'>>server.properties
echo 'socket.receive.buffer.bytes='$socket_receive_buffer_bytes>>server.properties
echo ' '>>server.properties
echo '# The maximum size of a request that the socket server will accept (protection against OOM)'>>server.properties
echo 'socket.request.max.bytes='$socket_request_max_bytes>>server.properties
echo ' '>>server.properties
echo ' '>>server.properties
echo '############################# Log Basics #############################'>>server.properties
echo '# A comma seperated list of directories under which to store log files'>>server.properties
echo 'log.dirs=/kafka-logs'>>server.properties
echo ' '>>server.properties
echo '# The default number of log partitions per topic. More partitions allow greater'>>server.properties
echo '# parallelism for consumption, but this will also result in more files across'>>server.properties
echo '# the brokers.'>>server.properties
echo 'num.partitions='$num_partitions>>server.properties
echo ' '>>server.properties
echo '# The default replication factor for topics'>>server.properties
echo 'default.replication.factor='$default_replication_factor>>server.properties
echo ' '>>server.properties
echo '# Minimum number of required in sync replicas'>>server.properties
echo 'min.insync.replicas='$min_insync_replicas>>server.properties
echo ' '>>server.properties
echo '# The number of threads per data directory to be used for log recovery at startup and flushing at shutdown.'>>server.properties
echo '# This value is recommended to be increased for installations with data dirs located in RAID array.'>>server.properties
echo 'num.recovery.threads.per.data.dir='$num_recovery_threads_per_data_dir>>server.properties
echo ' '>>server.properties
echo '############################# Topic Basics #############################'>>server.properties
echo '# Enable auto creation of topic on the server.'>>server.properties
echo 'auto.create.topics.enable=false'>>server.properties
echo ' '>>server.properties
echo '# Enables delete topic. Delete topic through the admin tool will have no effect if this config is turned off.'>>server.properties
echo 'delete.topic.enable=true'>>server.properties
echo ' '>>server.properties
echo '# Enables auto leader balancing. A background thread checks and triggers leader balance if required at regular intervals.'>>server.properties
echo 'auto.leader.rebalance.enable=true'>>server.properties
echo ' '>>server.properties
echo '# Specify the final compression type for a given topic. This configuration accepts the standard compression codecs'>>server.properties
echo '# ('gzip', 'snappy', lz4). It additionally accepts 'uncompressed' which is equivalent to no compression; and 'producer''>>server.properties
echo '# which means retain the original compression codec set by the producer.'>>server.properties
echo 'compression.type=producer'>>server.properties
echo ' '>>server.properties
echo '############################# Graceful Shutdown #############################'>>server.properties
echo '# Enable controlled shutdown of the server.'>>server.properties
echo 'controlled.shutdown.enable=true'>>server.properties
echo ' '>>server.properties
echo '# Controlled shutdown can fail for multiple reasons. This determines the number of retries when such failure happens.'>>server.properties
echo 'controlled.shutdown.max.retries='$controlled_shutdown_max_retries>>server.properties
echo ' '>>server.properties
echo '# Before each retry, the system needs time to recover from the state that caused the previous failure'>>server.properties
echo '# (Controller fail over, replica lag etc). This config determines the amount of time to wait before retrying.'>>server.properties
echo 'controlled.shutdown.retry.backoff.ms='$controlled_shutdown_retry_backoff_ms>>server.properties
echo ' '>>server.properties
echo '############################# Internal Topic Settings  #############################'>>server.properties
echo '# The replication factor for the group metadata internal topics "consumer_offsets" and "transaction_state"'>>server.properties
echo '# For anything other than development testing, a value greater than 1 is recommended for to ensure availability such as 3.'>>server.properties
echo 'offsets.topic.replication.factor='$offsets_topic_replication_factor>>server.properties
echo 'transaction.state.log.replication.factor='$transaction_state_log_replication_factor>>server.properties
echo 'transaction.state.log.min.isr='$transaction_state_log_min_isr>>server.properties
echo ' '>>server.properties
echo '############################# Log Flush Policy #############################'>>server.properties
echo ' '>>server.properties
echo '# Messages are immediately written to the filesystem but by default we only fsync() to sync'>>server.properties
echo '# the OS cache lazily. The following configurations control the flush of data to disk.'>>server.properties
echo '# There are a few important trade-offs here:'>>server.properties
echo '#    1. Durability: Unflushed data may be lost if you are not using replication.'>>server.properties
echo '#    2. Latency: Very large flush intervals may lead to latency spikes when the flush does occur as there will be a lot of data to flush.'>>server.properties
echo '#    3. Throughput: The flush is generally the most expensive operation, and a small flush interval may lead to exceessive seeks.'>>server.properties
echo '# The settings below allow one to configure the flush policy to flush data after a period of time or'>>server.properties
echo '# every N messages (or both). This can be done globally and overridden on a per-topic basis.'>>server.properties
echo ' '>>server.properties
echo '# The number of messages to accept before forcing a flush of data to disk'>>server.properties
echo '#log.flush.interval.messages=10000'>>server.properties
echo ' '>>server.properties
echo '# The maximum amount of time a message can sit in a log before we force a flush'>>server.properties
echo '#log.flush.interval.ms=1000'>>server.properties
echo ' '>>server.properties
echo '############################# Log Retention Policy #############################'>>server.properties
echo ' '>>server.properties
echo '# The following configurations control the disposal of log segments. The policy can'>>server.properties
echo '# be set to delete segments after a period of time, or after a given size has accumulated.'>>server.properties
echo '# A segment will be deleted whenever *either* of these criteria are met. Deletion always happens'>>server.properties
echo '# from the end of the log.'>>server.properties
echo ' '>>server.properties
echo '# The minimum age of a log file to be eligible for deletion due to age'>>server.properties
echo 'log.retention.hours='$log_retention_hours>>server.properties
echo ' '>>server.properties
echo '# A size-based retention policy for logs. Segments are pruned from the log unless the remaining'>>server.properties
echo '# segments drop below log.retention.bytes. Functions independently of log.retention.hours.'>>server.properties
echo '#log.retention.bytes=1089767'>>server.properties
echo ' '>>server.properties
echo '# The maximum size of a log segment file. When this size is reached a new log segment will be created.'>>server.properties
echo 'log.segment.bytes='$log_segment_bytes>>server.properties
echo ' '>>server.properties
echo '# The interval at which log segments are checked to see if they can be deleted according'>>server.properties
echo '# to the retention policies'>>server.properties
echo 'log.retention.check.interval.ms='$log_retention_check_interval_ms>>server.properties
echo ' '>>server.properties
echo '############################# Zookeeper #############################'>>server.properties
echo ' '>>server.properties
echo '# Zookeeper connection string (see zookeeper docs for details).'>>server.properties
echo '# This is a comma separated host:port pairs, each corresponding to a zk'>>server.properties
echo '# server. e.g. "127.0.0.1:3000,127.0.0.1:3001,127.0.0.1:3002".'>>server.properties
echo '# You can also append an optional chroot string to the urls to specify the'>>server.properties
echo '# root directory for all kafka znodes.'>>server.properties
echo 'zookeeper.connect='$var>>server.properties
echo '# Timeout in ms for connecting to zookeeper'>>server.properties
echo 'zookeeper.connection.timeout.ms='$zookeeper_connection_timeout_ms>>server.properties
echo ' '>>server.properties
echo '############################# Group Coordinator Settings #############################'>>server.properties
echo ' '>>server.properties
echo '# The following configuration specifies the time, in milliseconds, that the GroupCoordinator will delay the initial consumer rebalance.'>>server.properties
echo '# The rebalance will be further delayed by the value of group.initial.rebalance.delay.ms as new members join the group, up to a maximum of max.poll.interval.ms.'>>server.properties
echo '# The default value for this is 3 seconds.'>>server.properties
echo '# We override this to 0 here as it makes for a better out-of-the-box experience for development and testing.'>>server.properties
echo '# However, in production environments the default value of 3 seconds is more suitable as this will help to avoid unnecessary, and potentially expensive, rebalances during application startup.'>>server.properties
echo 'group.initial.rebalance.delay.ms='$group_initial_rebalance_delay_ms>>server.properties
echo ' '>>server.properties
echo '############################# TLS Server Configuration #############################'>>server.properties
echo 'ssl.endpoint.identification.algorithm='$ssl_endpoint_identification_algorithm>>server.properties
echo '# TLS Server Keystore Configuration:'>>server.properties
echo 'ssl.keystore.location=/opt/kafka-config/kafka.server.keystore.jks'>>server.properties
echo 'ssl.keystore.password='$keystore_password>>server.properties
echo 'ssl.keystore.type=JKS'>>server.properties

echo '# TLS Server Trust Keystore Configuration:'>>server.properties
echo 'ssl.truststore.location=/opt/kafka-config/kafka.server.truststore.jks'>>server.properties
echo 'ssl.truststore.password='$keystore_password>>server.properties
echo 'ssl.truststore.type=JKS'>>server.properties
echo ' '>>server.properties
echo '# A client cannot connect without providing certificates'>>server.properties
echo 'ssl.client.auth=required'>>server.properties


echo '# Enable TLS/SSL inter-broker communication:'>>server.properties
echo 'security.inter.broker.protocol=SSL'>>server.properties


cp server.properties /opt/kafka_2.12-3.5.1/config/server.properties
