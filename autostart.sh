#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
#run variety
#run dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
#run xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#run xrandr --output eDP --pos 1000x900
#autorandr horizontal
#run nm-applet
#run caffeine
#run pamac-tray
#run blueberry-tray
#run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run lxsession
run numlockx on
#run volumeicon
#run nitrogen --restore
#run feh --bg-fill --randomize ~/Documents/Viskas/Tapetai/HorizontalusTapetai/
#run applications from startup
run kdeconnect-cli -d 4136c383e578b12e
#run kdeconnect-indicator
run ~/syncthing-linux-amd64-v1.20.2/syncthing
