#!/bin/bash

nitrogen --restore &
picom --experimental-backends &

cpu() {
    case $BLOCK_BUTTON in
	1) notify-send "🖥 CPU hogs" "$(ps axch -o cmd:15,%cpu --sort=-%cpu | head)\\n(100% per core)" ;;
	2) setsid -f "$TERMINAL" -e htop ;;
	3) notify-send "🖥 CPU module " "\- Shows CPU temperature.
- Click to show intensive processes.
- Middle click to open htop." ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

sensors | awk '/Core 0/ {print "🌡" $3}'
}

memory() {
    case $BLOCK_BUTTON in
	1) notify-send "🧠 Memory hogs" "$(ps axch -o cmd:15,%mem --sort=-%mem | head)" ;;
	2) setsid -f "$TERMINAL" -e htop ;;
	3) notify-send "🧠 Memory module" "\- Shows Memory Used/Total.
- Click to show memory hogs.
- Middle click to open htop." ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

free --mebi | sed -n '2{p;q}' | awk '{printf ("🧠%2.2fGiB/%2.2fGiB\n", ( $3 / 1024), ($2 / 1024))}'
}

disk(){
    location=${1:-/}

[ -d "$location" ] || exit

case $BLOCK_BUTTON in
	1) notify-send "💽 Disk space" "$(df -h --output=target,used,size)" ;;
	3) notify-send "💽 Disk module" "\- Shows used hard drive space.
- Click to show all disk info." ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

case "$location" in
	"/home"* ) icon="🏠" ;;
	"/mnt"* ) icon="💾" ;;
	*) icon="🖥";;
esac

printf "%s: %s\n" "$icon" "$(df -h "$location" | awk ' /[0-9]/ {print $3 "/" $2}')"
}

battery() {

case $BLOCK_BUTTON in
	3) notify-send "🔋 Battery module" "🔋: discharging
🛑: not charging
♻: stagnant charge
🔌: charging
⚡: charged
❗: battery very low!
- Scroll to change adjust xbacklight." ;;
	4) xbacklight -inc 10 ;;
	5) xbacklight -dec 10 ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

# Loop through all attached batteries and format the info
for battery in /sys/class/power_supply/BAT?*; do
	# If non-first battery, print a space separator.
	[ -n "${capacity+x}" ] && printf " "
	# Sets up the status and capacity
	case "$(cat "$battery/status" 2>&1)" in
		"Full") status="⚡" ;;
		"Discharging") status="🔋" ;;
		"Charging") status="🔌" ;;
		"Not charging") status="🛑" ;;
		"Unknown") status="♻️" ;;
		*) exit 1 ;;
	esac
	capacity="$(cat "$battery/capacity" 2>&1)"
	# Will make a warn variable if discharging and low
	[ "$status" = "🔋" ] && [ "$capacity" -le 25 ] && warn="❗"
	# Prints the info
	printf "%s%s%d%%" "$status" "$warn" "$capacity"; unset warn
done && printf "\\n"
}

while true; do
	xsetroot -name "$(cpu) | $(memory) | $(disk) | $(battery) | $(date)"
	sleep 1s
done &

# exec your_window_manager
