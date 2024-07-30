function fish_greeting
    set cwd $(pwd)
    cd ~/.config
    set changes $(git rev-list --count origin/main...main)
    cd $cwd
    if test $changes -gt 0
        echo "|=================================================|"
        echo "|   There are $changes new commits for dotfile config    |"
        echo "|=================================================|"
    end

end
