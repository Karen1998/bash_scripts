#!/bin/bash

number_regex="^[+-]?[0-9]+([.][0-9]+)?$"

# Check for validity of arguments
if [[ "$1" =~ $number_regex ]]; then
    echo "Arguments must be numbers only."
    exit 1
fi

if [[ "$#" < 1 ]]; then
    echo "Enter number"
    exit 1
fi

# Validate inputed number
message=''
number=$1

if [[ "$#" > 1 ]]; then
    message="Script had take only fisrt argumnet (${number})"
fi

# Create function
factorial_func() {
    if [[ $1 == 1 ]]; then
        echo 1
    else
        factorial_sum=$(factorial_func $(($1 - 1)))
        echo $(($1 * factorial_sum))
    fi
}

let factorial="$(factorial_func $number)"

echo -e "${factorial} \n${message}"
exit 0
