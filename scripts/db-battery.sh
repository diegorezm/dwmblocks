#!/bin/bash 
declare -a icons=('󰂄' '󰂂' '󰂀' '󰁽' '󰁻')
chargin=$(cat /sys/class/power_supply/BAT0/uevent | grep 'POWER_SUPPLY_STATUS' | sed 's/=/ /g'| awk '{print $2}')
battery=$(cat /sys/class/power_supply/BAT0/capacity)
icon=""

if [[ $chargin == 'Charging' ]]; then
  icon=${icons[0]}
else 
  case battery in 
    $((battery >= 80)) ) icon=${icons[1]} ;;
    $((battery >= 40)) ) icon=${icons[2]} ;;
    $((battery >= 20)) ) icon=${icons[3]} ;;
    $((battery >= 10)) ) icon=${icons[4]} ;;
    *) echo ${icons[4]} && exit ;;
  esac
fi

echo "$icon $battery"
