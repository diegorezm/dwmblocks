#!/bin/bash 
up=$(checkupdates | wc -l)
echo $up  > /tmp/updates
echo $(cat /tmp/updates)
