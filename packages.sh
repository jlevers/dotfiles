#!/bin/bash
set -e

pacman -S python-poetry pyenv postgresql mysql
pamac build handlr-bin xdg-open-handlr spotify nvm rbenv
