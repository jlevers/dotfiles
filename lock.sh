#!/bin/bash
# scrot /tmp/screen.png
sh ./induvidual_scrot.sh
convert /tmp/head_0.png -scale 10% -scale 1000% /tmp/head_0.png
[[ -f $HOME/pictures/misc/lock-image.png ]] && convert /tmp/head_0.png $HOME/pictures/misc/lock-image.png -gravity center -composite -matte /tmp/head_0.png
if [ -a /tmp/head_1.png ]; then
  convert /tmp/head_1.png -scale 10% -scale 1000% /tmp/head_1.png
  [[ -f $HOME/pictures/misc/lock-image.png ]] && convert /tmp/head_1.png $HOME/pictures/misc/lock-image.png -gravity center -composite -matte /tmp/head_1.png
  convert /tmp/head_0.png /tmp/head_1.png +append /tmp/screen.png
else
  mv /tmp/head_0.png /tmp/screen.png
fi
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
i3lock -u -i /tmp/screen.png
