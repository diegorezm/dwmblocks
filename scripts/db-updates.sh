#!/bin/bash 
up=$(checkupdates | wc -l)
echo $up  > /tmp/updates
color=$(get_color "*color7")
echo "^c$color^"   $(cat /tmp/updates) "^d^"
