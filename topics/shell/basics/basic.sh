#!/bin/bash

set -e

# Function to display a separator
print_separator() {
  echo "-----------------------------------------"
}

# Welcome message
echo "Hello, my name is Tung"

# Display current date and time
echo "Today is: $(date)"

# Grep command example
echo "This is my testing string" | grep "my testing"

# Conditional statement
ADULT_AGE=18
MY_AGE=28
if [ $MY_AGE -gt $ADULT_AGE ]; then
  echo "You are an adult!"
else
  echo "You are under $ADULT_AGE!"
fi

# Loop through working days
WORKING_DAYS=("Mon" "Tue" "Wed" "Thu" "Fri")
echo "You have to work on these days:"
for day in "${WORKING_DAYS[@]}"; do
  echo "$day"
done
echo "Done! It's time to take rest!"
print_separator

# User input and case statement
echo "Enter a fruit name: "
# Simulating user input
fruit="orange"

case $fruit in
"apple") echo "You entered apple 🍎" ;;
"banana") echo "You entered banana 🍌" ;;
"orange") echo "You entered orange 🍊" ;;
"mango") echo "You entered mango 🥭" ;;
*) echo "You entered an unknown fruit." ;;
esac

# JSON parsing
json_file=$(cat data/example.json)
user_age=$(jq '.age' <<<"$json_file")
echo "The user's age is $user_age"
print_separator

# Grep examples
grep "grep" data/grep_example.txt
grep --color "to" data/grep_example.txt
grep -i "it" data/grep_example.txt
grep -c "the" data/grep_example.txt
grep -v "the" data/grep_example.txt

# Regular expressions in grep
grep ^T data/grep_example.txt # Lines starting with T
grep t$ data/grep_example.txt # Lines that end with the letter 't'
grep --help                   # Get help with more grep options
print_separator

# TODO: Add sed command

<<comment
 you have a file called data/grep_example.txt  with the following content needs to be replaced and shown:
 
           ==>  grep_example.txt
comment
sed 's/grep_example.txt/filename/' data/grep_example.txt  

<<comment
When you use sed without the -i option, it performs the specified operations (like search and replace) on the input stream (or file) 
and prints the modified content to the standard output. 
It does not modify the original file.
comment

sed -i 's/grep_example.txt/filename/' data/grep_example.txt  
<<comment

When you use sed -i, it modifies the file in-place. It directly updates the content of the file with the changes specified in the sed command.

In summary, using sed alone won't modify the original file; it will only display the modified content on the terminal. On the other hand, 
sed -i will apply the changes directly to the file, making the modifications persistent.
comment
# TODO: Add regex
