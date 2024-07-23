# fix some programs using bash instead of zsh
if [ -t 1 ]; then
	exec zsh
fi
