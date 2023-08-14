console_log () {
  echo ">>> [Elastic] $1"
}

# todo: check docker and docker compose

# init
console_log "Init the working dir and clone docker-elk"
mkdir -p /tmp/elk-testing
cd /tmp/elk-testing
console_log "Wipeout the previous content"
rm -rf docker-elk
git clone git@github.com:deviantony/docker-elk.git
cd docker-elk

console_log "Starting the ELK stack"
docker-compose up -d

