#!/bin/sh

seconds_since_last_upgrade=$(($(date +%s) - $(cat ~/.cache/last_upgrade_time)))
days_since_last_upgrade=$((seconds_since_last_upgrade / 86400))

if [ $days_since_last_upgrade -gt 5 ]; then
    echo "󰚰 Last upgrade $days_since_last_upgrade days ago"
else
    echo ""
fi
