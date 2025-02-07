#!/bin/bash
# Check for active Ethernet or WiFi connections
output=$(nmcli -t -f TYPE,STATE,CONNECTION device | grep -E 'ethernet:connected|wifi:connected')

# Default to "Disconnected" if no connections are active
if [[ -z "$output" ]]; then
  echo "Disconnected"
else
  # Prioritize Ethernet over WiFi if both are connected
  if echo "$output" | grep -q "ethernet:connected"; then
    echo "ethernet"
  elif echo "$output" | grep -q "wifi:connected"; then
    echo "wifi"
  fi
fi

