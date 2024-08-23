#!/bin/sh

# Set the interval for updates (in minutes)
update_interval=5

# File to store the last update time
last_update_file="/tmp/last_update_time"
last_update_file_amount="/tmp/last_update_amount"
# Get the current minute
current_minute=$(date +%M)

# Check if the last update time file exists
if [ -e "$last_update_file" ]; then
    # Read the last update time from the file
    last_update_minute=$(cat "$last_update_file")
    
    # Ensure numerical values
    last_update_minute=$((10#$last_update_minute))
    current_minute=$((10#$current_minute))

    # Calculate the difference in minutes
    #time_difference=$((current_minute - last_update_minute))
    time_difference=$(( (current_minute - last_update_minute + 60) % 60 ))

    # Check if the difference is greater than or equal to the update interval
    if [ "$time_difference" -ge "$update_interval" ]; then
        # Execute the updates
        updatesarch="$(checkupdates 2> /dev/null | wc -l)"
        updatesaur="$(paru -Qum 2> /dev/null | wc -l)"
        updates=$(("$updatesarch" + "$updatesaur"))
        icon="󰮯"
        echo "$icon $updates" > "$last_update_file_amount"

        # Update the last update time in the file
        echo "$current_minute" > "$last_update_file"
        printf "%s %s \\n"  "$icon" "$updates"
    else
      icon="󰮯"
      update_amount=$(cat "$last_update_file_amount")
      printf "%s %s \\n"  "$icon" "$update_amount"
    fi
else
    icon="󰮯"
    # If the file doesn't exist, create it and store the current minute
    echo "$current_minute" > "$last_update_file"
    echo "$icon 0" > "$last_update_file_amount" 
fi

