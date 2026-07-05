# Define vars
CURRENT_PATH=$(pwd)
ROOT_PATH="$CURRENT_PATH/../../"
CHAP03_PATH="$ROOT_PATH/chap03-terraform-state"
CHAP04_PATH="$ROOT_PATH/chap04-reusable-module"

# Action
cd $CHAP03_PATH
ls -la

# Tasks
## Init s3-dynamoDB for tf backend
echo ">>>>>>> Init backend s3-dynamo"
cd $CHAP03_PATH/global/s3-dynamo
terraform init
terraform plan
terraform apply

