#!/bin/mud

echo "Welcome to Advent of Code 2024"

handle = glob_array ./days/**/*.mud
len = array_length ${handle}
echo "All Completed Solution Files: " ${len}
echo "You can run the solutions with the following commands:"
for path in ${handle}
    echo "\nmud ${path}"
end

