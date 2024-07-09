# MySQL basic hands-on

This hands-on will:

- Provisions a mysql instance with docker
- Creates a database named `sqldemodb`, a table named `users` with the specified columns, and shows how to verify the database and table creation.

## Run and explore sql in docker container

```bash
docker run --name demo-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:latest

docker exec -it demo-mysql bash
# You now in the `bash-5.1#` container terminal

# Connect to SQL
mysql -uroot -p

# Creating new DB
CREATE DATABASE sqldemodb;

# Using the Database
USE sqldemodb;


# Creating a New Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

# Verifying the Creation
SHOW DATABASES;
SHOW TABLES;
DESCRIBE users;
```
