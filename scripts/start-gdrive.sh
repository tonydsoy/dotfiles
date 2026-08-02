#!/bin/bash
rclone mount gdrive: ~/google-drive --allow-non-empty --vfs-cache-mode full & disown
