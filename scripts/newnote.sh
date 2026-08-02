#!/bin/fish

set cdate  "$(date +%Y-%m-%d_%H-%M-%S)"
cd ~/notes/
nvim $cdate.md
