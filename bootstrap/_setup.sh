
install_appimage() {
    local BASENAME="$1"
    local AppImage="$2"
    local Icon="$3"

    mv $AppImage $HOME/bin/$BASENAME.AppImage
    chmod u+x $HOME/bin/$BASENAME.AppImage
    mkdir -p $HOME/.icons
    mv $Icon $HOME/.icons

    echo "[Desktop Entry]
Type=Application
Name=$BASENAME
Exec=$HOME/bin/$BASENAME.AppImage
Icon=$BASENAME
Terminal=false" > ~/.local/share/applications/$BASENAME.desktop

    update-desktop-database ~/.local/share/applications
}

install_appimage_from_url() {
    URL="$1"
    local dl_url="$(wget -qO- $URL | egrep -o 'https.*AppImage' | head -n 1)"
    local icon_url
    if [[ -z $2 ]]; then
        icon_url="$(wget -qO- $URL | egrep -o 'https.*png' | head -n 1)"
    else
        icon_url="$2"
    fi

    if [[ -z "$dl_url" ]]; then
        echo "missing download link"
        exit 1
    fi

    local BASENAME="$(basename $dl_url .AppImage | sed -e 's/[-0-9.]*$//')"

    curl --location --output ${tmp_dir}/$BASENAME.AppImage "$dl_url"
    curl --location --output ${tmp_dir}/$BASENAME.png "$icon_url"
    install_appimage $BASENAME ${tmp_dir}/$BASENAME.AppImage ${tmp_dir}/$BASENAME.png
}

install_github_release() {
    set +e
    OUT=$(mktemp)
    wget -qnv -O- https://api.github.com/repos/$1/releases/latest 2>/dev/null >$OUT
    URL="$(jq -r '.assets[] | select(.browser_download_url | contains("amd64.deb")) | .browser_download_url' $OUT)"
    if [ "$URL" != "" ]; then
        set -e
        wget $URL -O $OUT.deb
        sudo gdebi -n $OUT.deb
    else
        URL="$(jq -r '.assets[] | select(.browser_download_url | match("linux.*x86_64";"i")) | .browser_download_url' $OUT)"
        if [ "$URL" != "" ]; then
            set -e
            BASE="$(basename $URL)"
            BIN="$(echo $BASE | sed 's/_.*//')"
            wget -qnv $URL -O $OUT
            mv $OUT ~/.local/bin/$BIN
            chmod +x ~/.local/bin/$BIN
        fi
    fi
    rm -f $OUT*
    set -e
}


#####################################################################
################### DO NOT MODIFY BELOW THIS LINE ###################
#####################################################################

# set strict mode -  via http://redsymbol.net/articles/unofficial-bash-strict-mode/
# removed -e because it made basic [[ testing ]] difficult
set -uo pipefail
IFS=$'\n\t'
# shellcheck disable=SC2120
hash() {
    length=${1:-6}
    # shellcheck disable=SC2230
    if [[ -n $(which md5sum) ]]; then
        # regular linux
        md5sum | cut -c1-"$length"
    else
        # macos
        md5 | cut -c1-"$length"
    fi
}

force=0
help=0
verbose=0
#to enable verbose even before option parsing
[[ $# -gt 0 ]] && [[ $1 == "-v" ]] && verbose=1
quiet=0
#to enable quiet even before option parsing
[[ $# -gt 0 ]] && [[ $1 == "-q" ]] && quiet=1

initialise_output() {
    [[ "${BASH_SOURCE[0]:-}" != "${0}" ]] && sourced=1 || sourced=0
    [[ -t 1 ]] && piped=0 || piped=1 # detect if output is piped
    if [[ $piped -eq 0 ]]; then
        col_reset="\033[0m"
        col_red="\033[1;31m"
        col_grn="\033[1;32m"
        col_ylw="\033[1;33m"
    else
        col_reset=""
        col_red=""
        col_grn=""
        col_ylw=""
    fi

    [[ $(echo -e '\xe2\x82\xac') == '€' ]] && unicode=1 || unicode=0 # detect if unicode is supported
    if [[ $unicode -gt 0 ]]; then
        char_succ="✔"
        char_fail="✖"
        char_alrt="➨"
        char_wait="…"
        info_icon="🔎"
        config_icon="🖌️"
        clean_icon="🧹"
        require_icon="📎"
    else
        char_succ="OK "
        char_fail="!! "
        char_alrt="?? "
        char_wait="..."
        info_icon="(i)"
        config_icon="[c]"
        clean_icon="[c]"
        require_icon="[r]"
    fi
    error_prefix="${col_red}>${col_reset}"

    readonly nbcols=$(tput cols 2>/dev/null || echo 80)
    readonly wprogress=$((nbcols - 5))
}

out() { ((quiet)) && true || printf '%b\n' "$*"; }
debug() { if ((verbose)); then out "${col_ylw}# $* ${col_reset}" >&2; else true; fi; }
die() {
    out "${col_red}${char_fail} $script_basename${col_reset}: $*" >&2
    tput bel
    safe_exit
}
alert() { out "${col_red}${char_alrt}${col_reset}: $*" >&2; } # print error and continue
success() { out "${col_grn}${char_succ}${col_reset}  $*"; }
announce() {
    out "${col_grn}${char_wait}${col_reset}  $*"
    sleep 1
}

progress() {
    ((quiet)) || (
        if flag_set ${piped:-0}; then
            out "$*" >&2
        else
            printf "... %-${wprogress}b\r" "$*                                             " >&2
        fi
    )
}

tmp_dir=/tmp

initialise_output