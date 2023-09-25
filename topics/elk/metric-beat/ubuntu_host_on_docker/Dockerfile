FROM ubuntu:20.04

# Install Metricbeat
RUN apt-get update && apt-get install -y wget apt-transport-https && \
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - && \
    echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-8.x.list && \
    apt-get update && apt-get install metricbeat && \
    systemctl enable metricbeat

# Configure Metricbeat
COPY metricbeat.yml /etc/metricbeat/metricbeat.yml

CMD ["metricbeat", "-e", "--strict.perms=false"]
