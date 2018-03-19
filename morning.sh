#!/bin/bash

todo='./todo'
declare -A completed=()
counter=0

while read p; do
    completed[$counter]=false
    echo "$counter: [ ] $p"
    let "counter++"
done < $todo


while [ $counter -gt 0 ]; do
    read -p "Enter a task number to complete it: " task_num
    if [ "${completed[$task_num]}" = false ] ; then
        echo "Task #$task_num completed!"
        let "counter--"
        echo 
        completed[$task_num]=true
        internalCounter=0
        while read p; do
            prefix="[ ]"
            if [ "${completed[$internalCounter]}" = true ] ; then
                prefix="[x]"
            fi
            echo "$internalCounter: $prefix $p"
            let "internalCounter++"
        done < $todo
    else
        echo "Task #$task_num was already completed."
    fi
done

echo "All morning tasks complete! You may now use your computer."
