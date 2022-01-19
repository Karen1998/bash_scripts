#!/bin/bash

number_regex="^[a-zA-Z_]"


# Check for valid count of arguments
if [[ "$#" -ne 3  ]]; then
    echo "Illegal number of parameters. Must be 3"
	exit 1
fi

# Check for validity of arguments
if [[ "$arg1" =~ $number_regex || "$arg2" =~ $number_regex || "$arg3" =~ $number_regex ]]; then
  echo "Arguments must be numbers only."
  exit 1
fi

max=$1 # First command line argumner
min=$2 # Second command line argumner

# Check for min and max numebrs
for number in "$@" 
do
	if (($number > max)); then
		max=$number
	elif (($number < min)); then
		min=$number
	fi
done

echo "Min number is ${min}, and max number is ${max}"

exit 0
