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
  echo "You are an adult!"
else
  echo "You are under $ADULT_AGE!"
fi

# For Loop
WORKING_DAYS=("Mon" "Tue" "Wed" "Thu" "Fri")
echo "You have to work on these days:"
for day in "${WORKING_DAYS[@]}"; do
  echo "$day"
done
echo "Done! It's time to take rest!"

# Switch - Case
# Prompt the user to enter a fruit name
echo "Enter a fruit name: "
read fruit

# Check the entered fruit using a case statement
case $fruit in
  "apple")
    echo "You entered apple 🍎"
    ;;
  "banana")
    echo "You entered banana 🍌"
    ;;
  "orange")
    echo "You entered orange 🍊"
    ;;
    "mango")
    echo "You entered mango 🥭"
    ;;
  *)
    echo "You entered an unknown fruit."
    ;;
esac

# TODO: Add json parsing
# TODO: Add grep
# TODO: Add sed command
# TODO: Add regex

