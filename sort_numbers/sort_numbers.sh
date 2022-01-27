#!/bin/bash

string_regex="^[a-zA-Z_]"

odd_stdout=()
even_stdout=()

if [[ $# < 1 ]]; then
    echo "Arguments must be numbers only."
    exit 1
fi

# Buble sort script which getting an array as an argument  
# Returns an array, sorted in ascending order
buble_sort() {
    x=("$@")

    for ((i = 0; i < ${#x[@]}; i++)); do
        for ((j = 0; j < ${#x[@]} - i - 1; j++)); do
            if [ ${x[j]} -gt ${x[$((j + 1))]} ]; then
                # swap
                temp=${x[j]}
                x[$j]=${x[$((j + 1))]}
                x[$((j + 1))]=$temp
            fi
        done
    done

    echo "${x[@]}";
}

for int in "$@"; do
    # Check for validity of arguments
    if [[ $int =~ $string_regex ]]; then
        echo "Arguments must be numbers only."
        exit 1
    fi

    # Push odd/even number
    if (($int % 2 == 0)); then
        even_stdout+=("$int");
    else
        odd_stdout+=("$int");
    fi
done


odd_sorted_stdout=$(buble_sort ${odd_stdout[@]})
even_sorted_stdout=$(buble_sort ${even_stdout[@]})

echo -e "Odd -> ${odd_sorted_stdout[*]} \nEven -> ${even_sorted_stdout[*]}"
exit 0
