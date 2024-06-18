#!/bin/bash


# Use curl to fetch the trace information
response=$(warp-cli status)

# Check if the response contains 'warp=plus', 'warp=on', or 'warp=off'
if echo "$response" | grep -q "Status update: Connected"; then
    echo "wrap 󰅟"
else
    # none
    echo "warp "
fi