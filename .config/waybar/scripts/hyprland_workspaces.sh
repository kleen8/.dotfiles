#!/bin/bash

# Fetch workspace data from Hyprland
hyprctl workspaces -j | jq -r '
    map(select(.windows > 0) | if .focused then " \(.name)" else " \(.name)" end) | join(" ")
'
