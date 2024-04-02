#!/bin/bash

# Function to generate random password
generate_password() {
    # Define the characters to use for generating password
    characters="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_+="

    # Initialize variable to store generated password
    password=""

    # Generate random password
    for i in {1..30}; do
        # Get a random character from the list of characters
        random_char=${characters:RANDOM % ${#characters}:1}
        # Append the random character to the password
        password="${password}${random_char}"
    done

    # Print the generated password
    echo "$password"
}

# Call the function to generate password
generate_password