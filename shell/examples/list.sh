#!/bin/bash

# Define the output file name
output_file="file_list.txt"

# Use the 'ls' command to list all .txt files in the current directory
ls *.txt > "$output_file"

# Display a message indicating the completion of the task
echo "List of .txt files has been saved to $output_file"
