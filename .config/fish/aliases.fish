alias o 'xdg-open'
alias c 'cygstart'
alias forced_git_local_destroy 'git fetch origin;git reset --hard origin/master'
alias xmap 'xmodmap ~/.Xmodmap'

# Emacs関連
alias boot_emacs "emacs --daemon"
alias kill_emacs "emacsclient -e \"(kill-emacs)\""
alias m 'emacsclient -nw'

function reboot_emacs
	 kill_emacs;boot_emacs
end

# 画面ロック
alias lock 'gnome-screensaver-command -l'

# シャットダウン
alias fault 'sudo shutdown -P now'

function tdi
        todoist-cli item new $argv 192059838 #inbox id
end

#######################################
## peco
######################################
function peco
  command peco --layout=bottom-up $argv
end

function ghq-remove
        ghq list --full-path | peco | xargs rm -r -i
end

function fish_user_key_bindings
        # ghqを選択
        bind \cl peco_select_ghq_repository
        # gh-open
        bind \cx\cl peco_open_gh_repository
        # コマンド履歴を見る
       bind \cr peco_select_history
        # プロセスをキルする
        bind \cx\ck peco_kill
        # 最近見たディレクトリに移動
        bind \cx\cr peco_recentd
end
#######################################################
# multi-display
#######################################################
# set dual monitors
function dual
        xrandr --output eDP1 --primary --left-of HDMI1 --output HDMI1 --mode 1280x720
end
        
function dual2
        xrandr --output eDP1 --primary --left-of HDMI1 --output HDMI1 --auto
end

# set single monitor
function single
        xrandr --output HDMI1 --off
end

############
## Emacs
###########
function dired 
        emacsclient -e "(dired \"$PWD\")"
end

## Chdir to the ``default-directory'' of currently opened in Emacs buffer.
function cde
        emacsclient -e "(return-current-working-directory-to-shell)" | sed 's/^"\(.*\)"$/\1/' | read EMACS_CWD
        echo "chdir to $EMACS_CWD"
        cd "$EMACS_CWD"        
end
