#!/bin/bash

generate_password() {
  local length=$1
  local password=""

  for i in $(seq 1 $length); do
    # Generate a random byte and convert it to a printable ASCII character
    byte=$(od -An -N1 -i /dev/urandom | awk '{print $1}')
    char=$(echo $byte | awk '{printf "%c", $1}')
    password="${password}${char}"
  done

  echo "$password"
}

# Check if a length argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <password_length>"
  exit 1
fi

# Get the password length from command line argument
password_length=$1

# Generate and print the random password
random_password=$(generate_password "$password_length")
echo "Random Password: $random_password"