# gpg input
export GPG_TTY=$(tty)

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*) psParams="faux" ;;
    Darwin*) psParams="aux" ;;
esac

if [ -z $(which lvim) ]; then
    export EDITOR=vim
else
    export EDITOR=lvim
fi

psa() {
	ps $psParams
}

psag() {
	psa | grep -v grep | grep $@
}

rustscan() {
    /snap/bin/rustscan -g $@
}

rsyncNode() {
    mkdir -p "$2"
    rsync -avrmR --exclude='node_modules/' --exclude='.tmp/' --exclude='.git/' --exclude='.webpack/' --exclude='.serverless/' --exclude='coverage/' $@
}

rsyncFolder() {
    mkdir -p "$2"
    rsync -avrmR --exclude='node_modules/' $@
}

sourceFiles() {
    if [ -d $1 ]; then
        find $1 -maxdepth 1 -type f -print | egrep '\.sh$|\.bash$' | while read FILE; do
            source $FILE
        done
    fi
}
