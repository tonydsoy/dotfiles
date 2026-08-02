#!/bin/bash

BAT_PATH=$(upower -e | grep BAT)
LAST_LEVEL=""

while true; do
    PERCENT=$(upower -i "$BAT_PATH" | awk '/percentage/ {gsub("%",""); print $2}')
    STATE=$(upower -i "$BAT_PATH" | awk '/state/ {print $2}')

    LEVEL=""
    if [ "$PERCENT" -le 5 ]; then
        LEVEL="very_critical"
    elif [ "$PERCENT" -le 10 ]; then
        LEVEL="critical"
    elif [ "$PERCENT" -le 15 ]; then
        LEVEL="low"
    fi

    if [ "$STATE" = "discharging" ] && [ "$LEVEL" != "$LAST_LEVEL" ]; then
        case $LEVEL in
            low)
                notify-send "Low Battery" "$PERCENT%"
                ;;
            critical)
                notify-send "Battery Critical" "$PERCENT%"
                ;;
            very_critical)
                notify-send "Battery VERY Critical" "$PERCENT%"
                ;;
        esac
        LAST_LEVEL="$LEVEL"
    fi

    sleep 60
done
