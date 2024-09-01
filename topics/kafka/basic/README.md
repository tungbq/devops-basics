## Kafka Basics

Here's a basic "Hello World" example for Apache Kafka using Docker and Docker Compose. This will set up a Kafka broker and a Zookeeper instance, allowing you to produce and consume messages.

### 1. Create a `docker-compose.yml` File

Create a [docker-compose.yml](./docker-compose.yml) file that defines the services for Zookeeper and Kafka.

### 2. Start Kafka and Zookeeper

Run the following command to start the Kafka and Zookeeper containers:

```bash
cd devops-basics/topics/kafka/basic
docker-compose up -d
```

This command will start Zookeeper and Kafka in the background.

### 3. Create a Kafka Topic

Once the containers are running, create a Kafka topic named `helloworld`.

```bash
docker exec kafka kafka-topics.sh --create --topic helloworld --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1
```

### 4. Produce Messages to the Kafka Topic

To send a message to the `helloworld` topic:

```bash
docker exec -it kafka kafka-console-producer.sh --topic helloworld --bootstrap-server localhost:9092
```

Type a message (e.g., `Hello, Kafka!`) and press Enter. This sends the message to the Kafka topic.

### 5. Consume Messages from the Kafka Topic

To read the message from the `helloworld` topic:

```bash
docker exec -it kafka kafka-console-consumer.sh --topic helloworld --bootstrap-server localhost:9092 --from-beginning
```

You should see the message you produced earlier.

### 6. Cleanup

To stop and remove the Kafka and Zookeeper containers, run:

```bash
cd devops-basics/topics/kafka/basic
docker-compose down
```

This basic setup allows you to get hands-on experience with Kafka using Docker and Docker Compose. You can extend this setup to explore more advanced Kafka features.
