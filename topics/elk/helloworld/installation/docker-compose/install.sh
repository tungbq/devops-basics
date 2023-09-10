

# Init
echo "Init workspace"
rm -rf workspace123
mkdir /tmp/workspace-elk

# Uninstall
./uninstall.sh

# Clone src code
echo "Checkout code"
cd /tmp/workspace-elk

if [ ! -d "docker-elk" ]; then
  git clone git@github.com:deviantony/docker-elk.git
fi

cd docker-elk
ls -la

# echo "Overwride local config env"
# cp ../../.custom-env .env

# Deploy
echo "Deploying..."
docker-compose up setup
docker-compose up -d

