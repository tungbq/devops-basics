# Define vars
CURRENT_PATH=$(pwd)
ROOT_PATH="$CURRENT_PATH/../../"
CHAP03_PATH="$ROOT_PATH/chap03-terraform-state"
CHAP04_PATH="$ROOT_PATH/chap04-reusable-module"

# Action
# Tasks
## Destroy staging env
echo ">>>>>>> Destroy staging environment (webserver-cluster)"
cd $CHAP04_PATH/stage/services/webserver-cluster
terraform destroy -lock=false

## Destroy DB
echo ">>>>>>> Destroy DB"
cd $CHAP04_PATH/stage/datastore/mysql
terraform destroy -lock=false