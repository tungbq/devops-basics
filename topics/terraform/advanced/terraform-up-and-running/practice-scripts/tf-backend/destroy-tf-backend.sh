# Define vars
CURRENT_PATH=$(pwd)
ROOT_PATH="$CURRENT_PATH/../../"
CHAP03_PATH="$ROOT_PATH/chap03-terraform-state"
CHAP04_PATH="$ROOT_PATH/chap04-reusable-module"

# Action
cd $CHAP03_PATH
ls -la

# Tasks
## Destroy s3-dynamoDB for tf backend
echo ">>>>>>> Destroy backend s3-dynamo"
cd "$CHAP03_PATH/global/s3-dynamo"

ls -la
terraform destroy
