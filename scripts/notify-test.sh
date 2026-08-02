#!/bin/bash
pkill dunst
dunst &
notify-send "notification test" "<u>underline</u> <b>bold</b> <i>italic</i> regular <s>strike</s>"
