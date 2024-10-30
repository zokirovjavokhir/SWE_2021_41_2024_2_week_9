#!/bin/bash

nums_list=(
    "[2,7,11,15]"
    "[3,2,4]"
    "[3,3]"
)

targets=(
    9
    6
    6
)

answers=(
    "[0, 1]"
    "[1, 2]"
    "[0, 1]"
)

num_cases=${#nums_list[@]}
pass_count=0

for ((i=0; i<num_cases; i++)); do
    nums=${nums_list[i]}
    target=${targets[i]}
    answer=${answers[i]}
    
    output=$(python3 -c "from main import twoSum; print(twoSum($nums, $target))")
    
    if [ "$output" == "$answer" ]; then
        echo "Test case $((i+1)): Passed / Expected: $answer, Got: $output"
        ((pass_count++))
    else
        echo "Test case $((i+1)): Failed / Expected: $answer, Got: $output"
    fi
done

echo "$pass_count/$num_cases test cases passed"