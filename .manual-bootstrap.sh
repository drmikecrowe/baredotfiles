#!env bash

wget https://github.com/drmikecrowe/baredotfiles/archive/master.zip
unzip master.zip
cd baredotfiles-master
find . -maxdepth 1 | while read FIL; do
    if [ -f $FIL ]; then
        cp $FIL ~
    else
        if [ -d ~/$FIL ]; then
            rm -rf ~/$FIL
        fi
        cp -R $FIL ~
    fi
done
cat <<EOF >>~.bashrc

source ~/.bash/setup.bash
EOF
rm -rf baredotfiles-master/
