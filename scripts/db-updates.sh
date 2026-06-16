#!/bin/sh
. /etc/os-release

case "$ID" in
	arch)
		up=$(checkupdates 2>/dev/null | wc -l)
		;;
	opensuse*|opensuse-tumbleweed|opensuse-leap)
		up=$(zypper lu 2>/dev/null | grep -c '|')
		;;
	*)
		up="?"
		;;
esac

color=$(get_color "*color7")

printf "^c%s^  %s ^d^\n" "$color" "$up"
