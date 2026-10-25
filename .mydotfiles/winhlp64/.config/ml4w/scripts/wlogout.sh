#!/usr/bin/env bash
margin=$(hyprctl -j monitors | jq '
  .[] | select(.focused)
  | (if (.transform % 2) == 1 then .width else .height end) as $h
  | ($h / .scale * 0.27) | floor
')

wlogout -b 5 -T "$margin" -B "$margin" --protocol layer-shell
