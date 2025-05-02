#!/bin/bash 

declare -a icons=('󰂄' '󰂂' '󰂀' '󰁽' '󰁻')
#declare -a colors=('#a6e3a1' '#74c7ec' '#fab387' '#dd7878') 
chargin=$(cat /sys/class/power_supply/BAT0/uevent | grep 'POWER_SUPPLY_STATUS' | sed 's/=/ /g'| awk '{print $2}')
battery=$(cat /sys/class/power_supply/BAT0/capacity)
icon=""
color=""

if [[ $chargin == 'Charging' ]]; then
  icon=${icons[0]}
else 
  case 1 in 
    $(( $battery >= 80 )) ) 
      icon=${icons[1]} 
      color=$(get_color "*color2" ) # Green
      ;;
    $(( $battery >= 40 )) ) 
      icon=${icons[2]} 
      color=$(get_color "*color4") # Blue
      ;;
    $(( $battery >= 20)) ) 
      icon=${icons[3]} 
      color=$(get_color "*color11") # Yellow
      ;;
    $(( $battery >= 1 )) ) 
      icon=${icons[4]} 
      color=$(get_color "*color1") # Red
      ;;
    *) 
      echo "${icons[4]} $battery%"&& exit 
      ;;
  esac
fi

echo "^c$color^" $icon $battery%"^d^" 
