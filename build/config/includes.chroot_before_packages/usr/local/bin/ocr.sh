#!/bin/dash

flameshot gui --raw

xclip -selection clipboard -t image/png -o >/run/user/1000/clipboard.png

tesseract -l deu /run/user/1000/clipboard.png stdout | xsel -ib

zenity --notification --text "Text copied to clipboard"
