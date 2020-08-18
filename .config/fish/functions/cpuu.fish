function cpuu
        ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu | sed /^ 0.0 /d $argv;
end