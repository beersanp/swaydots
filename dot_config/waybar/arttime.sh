#!/bin/bash

# Define the two arttime commands
commands=(
  "arttime --nolearn -a colorowl2 -b colorowl3 -t \"We don't sleep at night - Owls\""
  "arttime --nolearn -a kissingcats -b kissingcats2 -t \"Since we found love within, we don't bother rats - Wise cats\" --ac 3"
  "arttime --nolearn"
  "arttime --nolearn -a military -b military2 -t \"Say no to wars, yes to peace\" --ac 4"
)

random_index=$(( RANDOM % ${#commands[@]} ))

eval "${commands[$random_index]}"
