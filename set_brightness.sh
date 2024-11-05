#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <brightness value between 0 and 1>"
    exit 1
fi

# Check if the argument is in the correct range (0 to 1)
if (( $(echo "$1 < 0 || $1 > 1" | bc -l) )); then
    echo "Error: The brightness value must be between 0 (min) and 1 (max)."
    exit 1
fi

# Set the brightness based on the provided value
xrandr --output HDMI-0 --brightness $1
echo "Brightness set to $1"
