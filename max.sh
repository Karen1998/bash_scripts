#!/bin/bash

number_regex="^[a-zA-Z_]"
arg1=$1
arg2=$2
arg3=$3


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

# Check for maximal number
if (($arg1 > $arg2 && $arg1 > $arg3)); then
	echo ${arg1}
elif (($arg2 > $arg1 && $arg2 > $arg3)); then
	echo $arg2
else
	echo $arg3
fi

exit 0
