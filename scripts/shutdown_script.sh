#! /bin/bash

action=$(yad --width 300 --entry --title "System Logout" \

--image=gnome-shutdown \

--button="Switch User:2" \

--button="gtk-ok:0" --button="gtk-close:1" \

--text "Choose action:" \

--entry-text \

"Power Off" "Reboot" "Suspend" "Logout")

ret=$?


[[ $ret -eq 1 ]] && exit 0


if [[ $ret -eq 2 ]]; then

gdmflexiserver --startnew &

exit 0

fi

case $action in

Power*) cmd="sudo /sbin/poweroff" ;;

Reboot*) cmd="sudo /sbin/reboot" ;;

Suspend*) cmd="sudo /bin/sh -c 'echo disk > /sys/power/state'" ;;

Logout*)

case $(wmctrl -m | grep Name) in

*Openbox) cmd="openbox --exit" ;;

*bspwm) cmd="bspc quit" ;;

*Metacity) cmd="gnome-save-session --kill" ;;

*) exit 1 ;;

esac

;;

*) exit 1 ;;

esac

eval exec $cmd
