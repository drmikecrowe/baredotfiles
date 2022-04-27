if [ -d $HOME/.private ]; then
	TOTAL=$(find $HOME/.private -maxdepth 1 -name '*.sh' | wc -l)
	if [ "$TOTAL" != "0" ]; then
		source $HOME/.private/*.sh
	fi
fi
