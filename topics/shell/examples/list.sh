#!/bin/bash

# Define the output file name
#In this script, we first define the output file name as file_list.txt. 
output_file="file_list.txt"

#Then, we use the ls command with the *.txt pattern to list all .txt files in the current directory. The > operator redirects the output of the ls command to the specified output file.
ls ../data/*.txt > "$output_file"

# Finally, we display a message indicating the completion of the task, specifying the name of the output file.
echo "List of .txt files has been saved to $output_file"

#After running the script, you will find the list of .txt files in the current directory stored in the file_list.txt file.
