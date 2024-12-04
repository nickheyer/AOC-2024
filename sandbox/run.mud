#!/bin/mud

echo "Welcome to Advent of Code 2024"

now_ms = current_time
tz_offset = set -8
day_of_week = calc ( ( ( ( ${now_ms} / 1000 ) + ( ${tz_offset} * 60 * 60 ) ) / 86400 ) + 4) % 7
echo "Today: " ${day_of_week}

# len = $(array_length $(glob_array ./${day_of_week}/*.foo))
# echo "Today's foo file count: " ${len}

# now_ms = current_time
# now = calc ${now_ms} / 1000
# echo "Time since epoch: " ${now}

# tz_offset = set -8
# echo "PST TZ Offset: " ${tz_offset}

# localtime_offset = calc ${tz_offset} * 60 * 60
# echo "Local Offset: " ${localtime_offset}

# localtime = calc ${now} + ${localtime_offset}
# echo "Local: " ${localtime}

# days_since = calc ${localtime} / 86400
# echo "Days Since Epoch: " ${days_since}

# day_of_week_val = calc ${days_since} + 4
# echo "Raw: " ${day_of_week_val}

# day_of_week = calc ${day_of_week_val} % 7
# echo "Today (0 indexed): " ${day_of_week}

# yesterday = set 6
# if not less_than ${day_of_week} 1
#     yesterday = calc ${day_of_week} - 1
# end

# pwd

# norm_today = calc ${day_of_week} + 1
# echo "Today: " ${norm_today}
# handle = glob_array ./days/${norm_today}/*.mud
# len = array_length ${handle}
# echo "Today's Completed Solution Files: " ${len}

# norm_yest = calc ${yesterday} + 1
# echo "Yesterday: " ${norm_yest}
# handle = glob_array ./days/${norm_yest}/*.mud
# len = array_length ${handle}
# echo "Yesterdays Completed Solution Files: " ${len}

# handle = glob_array ./days/**/*.mud
# len = array_length ${handle}
# echo "All Completed Solution Files: " ${len}
# echo "You can run the solutions with the following commands:"
# for path in ${handle}
#     echo "mud ${path}"
# end



# # Get the current time in milliseconds
# __var_0 = current_time
# # Convert milliseconds to seconds
# __var_1 = calc ${__var_0} / 1000
# # Define the timezone offset (e.g., PST is 8 for +08:00)
# tz_offset = set -8
# # Apply the timezone offset to the current time
# __var_2 = calc ${__var_1} + (${tz_offset} * 60 * 60)
# # Calculate days since epoch
# __var_3 = calc ${__var_2} / 86400
# # Determine the day of the week
# day_of_week = calc (${__var_3} + 4) % 7
# echo "Today: " ${day_of_week}
# # Find all `.foo` files for today's day of the week
# __var_4 = glob_array ./${day_of_week}/*.foo
# # Count the number of `.foo` files
# len = array_length ${__var_4}
# # Output the count
# echo "Today's foo file count: " ${len}
