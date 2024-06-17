# Credit: https://gitlab.com/vahnrr/rofi-menus/-/blob/master/scripts/rofi-power?ref_type=heads

#!/usr/bin/env sh
#
# A rofi powered menu to execute power related action.
# Uses: amixer mpc poweroff reboot rofi rofi-prompt

power_off='   Power Off'
reboot='   Reboot'
lock='   Lock'
log_out='   Log Out'

chosen=$(printf '%s;%s;%s;%s' "$power_off" "$reboot" "$lock" "$log_out" \
    | rofi -theme-str '@import "config.rasi"' \
           -dmenu \
           -sep ';' \
           -selected-row 2)

case "$chosen" in
    "$power_off")
        sh rofi-prompt.sh --query 'Shutdown?' && poweroff
        ;;

    "$reboot")
        sh rofi-prompt.sh --query 'Reboot?' && reboot
        ;;

    "$lock")
        sh rofi-prompt.sh --query 'Lock?' && i3lock --color 11121D
        ;;

    "$log_out")
        # TODO Add your log out command.
        sh rofi-prompt.sh --query 'Log Out?' && i3-msg exit
        ;;

    *) exit 1 ;;
esac

