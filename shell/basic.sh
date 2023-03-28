#!/bin/bash

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
WORKING_DAY=( "Mon" "Tue" "Wed" "Thu" "Fri" )
echo "You have to work on these days:"
for day in "${WORKING_DAY[@]}"
do
  echo "$day"
done
echo "Done! It's time to take rest!"

## Switch - Case
## json parsing
## Regex
## Sed command -> TODO
