# Print Hello World
echo "Hello, my name is Tung"

# Get current date time
TODAY_OUTPUT=$(date)
echo "Today is: $TODAY_OUTPUT"

# Grep command
echo "This is my testing string" | grep "my testing"

# If - Else
ADULT_AGE=18
MY_AGE=28
if [ $MY_AGE -gt $ADULT_AGE ]; then
  echo "You are adult!"
else
  echo "You are under $ADULT_AGE!"
fi

# For - Loop

## Switch - Case
## json parsing
## Regex
## Sed command -> TODO
