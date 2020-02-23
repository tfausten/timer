#!/bin/bash

# counter for intervals: i
i=1

# loop through intervals provided as arguments
for interval in $@
do
    time_left=$interval
    while (( $(bc -l <<< "$time_left > 0") ))
    do
	echo -n -e "\rInterval ${i} (${interval} minutes): ${time_left} minutes left.               "

	# if 1 minute or more left, wait one minute, else wait remaining time
	if (( $(bc -l <<< "$time_left >= 1") )); then wait_time=1; else wait_time=$time_left; fi
	sleep ${wait_time}m

	# subtract wait_time from time_left
	time_left=$(bc -l <<< "$time_left-$wait_time")
    done

    echo -e "\rInterval ${i} (${interval} minutes): Done.                                                " 
    zenity --info --text="${interval} minutes passed" --no-wrap --width=400 --height=200 --title="Interval Complete!"
    ((++i))
done

