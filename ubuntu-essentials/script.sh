#!/bin/bash

# This is a sample shell script that demonstrates various features supported by sh.

# Check if any arguments are provided
if [ $# -eq 0 ]; then
    echo "No arguments provided."
else
    echo "Arguments provided:"
    # Loop through all the arguments
    for arg in "$@"; do
        echo "$arg"
    done
fi

# Compare two arguments
if [ "$1" -eq "$2" ]; then
    echo "Arguments are equal."
else
    echo "Arguments are not equal."
fi

# Check if a file exists
if [ -f "$1" ]; then
    echo "File $1 exists."
else
    echo "File $1 does not exist."
fi

# Define and use variables
name="John"
age=25
echo "My name is $name and I am $age years old."

# End of script
