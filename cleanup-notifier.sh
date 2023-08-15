#!/bin/bash


##### Variables
elements=( "$@" )
len=${#elements[@]}


##### Functions
notify() {
    notify-send -a 'Cleanup Notifier' -u critical "$@"
}

count_elements() {
    items=$(ls -1q $1 | wc -l)
}


##### Checker
for (( i = 0; i < $len; i=i+2 ))
do
    folder="${elements[$i]}"
    threshold="${elements[$(($i + 1))]}"
    
    count_elements $folder

    if [ $items -gt $threshold ]; then
        notify "You have too many items in $folder!"
        echo "$folder has too many items ($items > $threshold)"
    else
        echo "$folder is fine ($items <= $threshold)"
    fi
done

