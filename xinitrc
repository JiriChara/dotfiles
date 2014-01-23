if [ -f ~/.Xmodmap ]; then
xmodmap ~/.Xmodmap
fi
if [ -f ~/.Xmodmap ]; then
xrdb -merge ~/.Xresources
fi
