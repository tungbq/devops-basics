# Define vars
CURRENT_PATH=$(pwd)
ROOT_PATH="$CURRENT_PATH/../../"
CHAP03_PATH="$ROOT_PATH/chap03-terraform-state"
CHAP04_PATH="$ROOT_PATH/chap04-reusable-module"

# Action
cd $CHAP03_PATH
ls -la

# Tasks
# Init DB
echo ">>>>>>> Init DB"
cd $CHAP04_PATH/stage/datastore/mysql
pwd
ls -la
terraform init
terraform plan -lock=false
terraform apply -lock=false

## Init staging env
echo ">>>>>>> Init staging environment (webserver-cluster)"
cd $CHAP04_PATH/stage/services/webserver-cluster
pwd
ls -la
terraform init
terraform plan -lock=false
terraform apply -lock=false

