function mkcd -d "Create a directory and set CWD"
    command mkdir $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'

            case '*'
                cd $argv[(count $argv)]
                return
        end
    end
end

function rsyncFolder -d "Make a temp folder copy of a folder"
    mkdir -p $argv[1]
    rsync -avrmR --exclude='node_modules/' --exclude='.tmp/' --exclude='.git/' --exclude='.webpack/' --exclude='.serverless/' --exclude='coverage/' --exclude='.history/' $argv[1] $argv[2]
end

function githubInstall -d "Github Install: githubInstall <user>/<repo>@<release>"
    pushd $HOME/bin
    curl https://i.jpillora.com/$argv[1]?type=script | bash
    popd
end


