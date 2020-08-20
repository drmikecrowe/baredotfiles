#!env bash

rm baredotfiles* master.zip* -rf
wget https://github.com/drmikecrowe/baredotfiles/archive/master.zip
unzip master.zip
cd baredotfiles-master
find . -maxdepth 1 | while read FIL; do
    if [ "$FIL" == "." -o "$FIL" == ".." ]; then continue; fi
    if [ -f $FIL ]; then
        cp $FIL ~
    else
        if [ -d ~/$FIL ]; then
            rm -rf ~/$FIL
        fi
        cp -R $FIL ~
    fi
done
rm -rf baredotfiles-master/
if [ "$(grep -o setup.bash ~/.bashrc)" == "setup.base" ]; then exit 0; fi
cat <<EOF >>~.bashrc

source ~/.bash/setup.bash
EOF
