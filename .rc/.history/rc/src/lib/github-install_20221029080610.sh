github-install() {
	if [ "$1" == "" ]; then
		echo "usage: github-install <user>/<repo>@<release>"
		return
	fi

	pushd $HOME/bin > /dev/null

	curl https://i.jpillora.com/$1?type=script | bash

	popd > /dev/null
}
