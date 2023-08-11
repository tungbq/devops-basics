# Define vars
CURRENT_PATH=$(pwd)
ROOT_PATH="$CURRENT_PATH/../../"
CHAP03_PATH="$ROOT_PATH/chap03-terraform-state"
CHAP04_PATH="$ROOT_PATH/chap04-reusable-module"

# Action
# Tasks
## Destroy staging env
echo ">>>>>>> Destroy staging environment (webserver-cluster)"
cd $CHAP04_PATH/stage/services/alb-webserver
terraform destroy -lock=false