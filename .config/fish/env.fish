export LANG=ja_JP.UTF-8
export LD_LIBRARY_PATH=/usr/local/lib
export LIBRARY_PATH=/usr/local/lib
export CPATH=/usr/local/include

if test -d ~/script
        set fish_user_paths ~/script/sh $fish_user_paths
        set fish_user_paths ~/script/ruby $fish_user_paths
        set fish_user_paths ~/script/scala $fish_user_paths        
end

set -x EDITOR emacs
set -x VISUAL "emacsclient -nw"

# for ruby
if test -x "`which ruby`"
        set fish_user_paths $HOME/.gem/ruby/2.1.0/bin $fish_user_paths
end

# for go
if test -x "`which go`"
        set -x GOPATH $HOME/go
        set fish_user_paths $GOROOT/bin $fish_user_paths 
        set fish_user_paths $GOPATH/bin $fish_user_paths 
end

# my bin
set fish_user_paths $HOME/bin $fish_user_paths
