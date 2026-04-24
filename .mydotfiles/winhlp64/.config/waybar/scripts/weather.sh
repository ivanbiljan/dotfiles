#!/bin/bash

city="Zagreb"
cachedir="${HOME}/.cache/rbn"
cachefile="weather-${1:-now}"
url="https://en.wttr.in/${city}${1}?format=j2"

mkdir -p "$cachedir"

cache_path="$cachedir/$cachefile"
cache_age=$(( $(date +%s) - $(stat -c '%Y' "$cache_path" 2>/dev/null || echo 0) ))

# Refresh if older than 29 minutes (1740s) or empty/missing
if [ ! -s "$cache_path" ] || [ $cache_age -gt 1740 ]; then
    curl -s "$url" > "$cache_path.tmp" && mv "$cache_path.tmp" "$cache_path"
fi

# Actual JSON parsing – no more sed witchcraft
location=$(jq -r '.nearest_area[0].areaName[0].value' "$cache_path")
condition=$(jq -r '.current_condition[0].weatherDesc[0].value' "$cache_path")
temp_c=$(jq -r '.current_condition[0].temp_C' "$cache_path")
feels_c=$(jq -r '.current_condition[0].FeelsLikeC' "$cache_path")

# Icon mapping (same as before but lowercase + trimmed)
cond_lower=$(echo "$condition" | tr '[:upper:]' '[:lower:]')

case "$cond_lower" in
    "clear"|"sunny")                  icon="" ;;
    "partly cloudy")                  icon="" ;;
    "cloudy"|"overcast")              icon="" ;;
    "fog"|"mist"|"freezing fog")      icon="" ;;
    *rain*|*drizzle*|*shower*)        icon="" ;;
    *snow*|*sleet*|*blizzard*|*ice*)  icon="" ;;
    *thunder*|*storm*)                icon="" ;;
    *)                                icon="" ;;
esac

# Output for waybar / whatever
tooltip="$location: $condition"
text="${icon}  ${feels_c}°C"

echo -e "{\"text\": \"$text\", \"alt\": \"$tooltip\"}"