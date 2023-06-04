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
    echo "You entered apple."
    ;;
  "banana")
    echo "You entered banana."
    ;;
  "orange")
    echo "You entered orange."
    ;;
  *)
    echo "You entered an unknown fruit."
    ;;
esac

# TODO: Add json parsing

# TODO: Add grep
  # grep_example.txt is an example file you can create your own file and give its name instead of grep_example.txt to search in that file.
grep "grep" grep_example.txt  # change the keyword inside the bracket to search for different words it will print the whole line if the given keyword is in that line.
grep --color "to" grep_example.txt    # it will print the line which have "to" keyword in them, and --color is used to highlite the text.
grep -i "it" grep_example.txt     # -i will Ignore case sensitivity
grep -c "the" grep_example.txt  # -c will count the number of occurrences of the given string in the text.
grep -v "the" grep_example.txt  # it will print all the lines which DO NOT have the given string.

# REGEX in grep 
# ^      Matches characters at the beginning of a line
# $      Matches characters at the end of a line
# "."    Matches any character
# [a-z]  Matches any characters between A and Z
# [^ ..] Matches anything apart from what is contained in the brackets

grep ^T grep_example.txt # lines starting with T.
grep t$ grep_example.txt  # To display lines that end with the letter ‘t’ run

grep --help           # Getting help with more Grep options

# TODO: Add sed command
# TODO: Add regex

