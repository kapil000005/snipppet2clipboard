#!/bin/bash

SNIPPET_FILE="$HOME/.snippet"

# Check if the snippet file exists
if [ ! -f "$SNIPPET_FILE" ]; then
    notify-send "Error" "Snippet file not found at $SNIPPET_FILE"
    exit 1
fi

# 1. Extract keys, clean quotes/spaces, and pass to rofi
selected_field=$(awk -F'=' '{print $1}' "$SNIPPET_FILE" | tr -d '"' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | rofi -dmenu -p 'Select Field')

# 2. If a field was chosen, look up its value
if [ -n "$selected_field" ]; then
    value=$(awk -F'=' -v key="$selected_field" '
        {
            k = $1
            gsub(/^[ \t"]+|[ \t"]+$/, "", k)
            if (k == key) {
                val = substr($0, index($0, "=") + 1)
                gsub(/^[ \t"]+|[ \t"]+$/, "", val)
                print val
                exit
            }
        }
    ' "$SNIPPET_FILE")

    # 3. Copy value to clipboard and send notification
    if [ -n "$value" ]; then
        echo -n "$value" | xclip -selection clipboard
        notify-send "Snippet Copied" "Copied value for '$selected_field'"
    fi
fi
