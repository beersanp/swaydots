#!/bin/bash

cloudflarecheck_script="$HOME/.config/waybar/script/cloudflarewarp.sh"

# Run the cloudflarecheck.sh script to get the WARP status
warp_status=$("$cloudflarecheck_script")

# Check if the status indicates WARP+ is active
if [ "$warp_status" = "wrap 󰅟" ]; then
    # Disconnect WARP
    warp-cli disconnect
else
    # Connect WARP
    warp-cli connect
fi
