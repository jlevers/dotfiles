#!/bin/bash
#if [ -a $HOME/tmp/head_0.png ]; then
#  rm $HOME/tmp/head_0.png
#fi

#if [ -a $HOME/tmp/head_1.png ]; then
#  rm $HOME/tmp/head_1.png
#fi

sh $HOME/desktop/dotfiles/induvidual_scrot.sh
convert $HOME/tmp/head_0.png -scale 10% -scale 1000% $HOME/tmp/head_0.png
[[ -f $HOME/pictures/misc/lock-image.png ]] && convert $HOME/tmp/head_0.png $HOME/pictures/misc/lock-image.png -gravity center -composite -matte $HOME/tmp/head_0.png
if [ -e $HOME/tmp/head_1.png ]; then
  convert $HOME/tmp/head_1.png -scale 10% -scale 1000% $HOME/tmp/head_1.png
  [[ -f $HOME/pictures/misc/lock-image.png ]] && convert $HOME/tmp/head_1.png $HOME/pictures/misc/lock-image.png -gravity center -composite -matte $HOME/tmp/head_1.png
  convert $HOME/tmp/head_0.png $HOME/tmp/head_1.png +append $HOME/tmp/screen.png
else
  mv $HOME/tmp/head_0.png $HOME/tmp/screen.png
fi
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
i3lock -u -i $HOME/tmp/screen.png
