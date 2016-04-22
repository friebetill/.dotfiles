##############################################################
#
#                        ZSHELL - RUNCOM
#
#    Sections:
#       -> Environment
#       -> Options
#       -> Editor
#       -> Functions
#       -> Aliases
#
###############################################################

###############################################################
#                        Environment                          #
###############################################################

    # Path to your oh-my-zsh installation.
    export ZSH=~/.oh-my-zsh
    export TERM="xterm-256color"

    # Set name of the theme to load.
    ZSH_THEME="powerlevel9k/powerlevel9k"
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

    #DEFAULT_USER="till"

    # why would you type 'cd dir' if you could just type 'dir'?
    setopt AUTO_CD

    # Uncomment the following line to change how often to auto-update (in days).
    export UPDATE_ZSH_DAYS=7

    #export PATH="/home/till/anaconda/bin:/home/till/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

    # Uncomment the following line to enable command auto-correction.
    ENABLE_CORRECTION="true"

    # Uncomment the following line to display red dots whilst waiting for completion.
    COMPLETION_WAITING_DOTS="true"

    if [[ -r /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh ]]; then
        source /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh
    fi

###############################################################
#                          Options                            #
###############################################################

    source $ZSH/oh-my-zsh.sh

    # History
    HISTFILE=~/.zsh_history
    HISTSIZE=1000000000000000000
    SAVEHIST=$HISTSIZE

    # My own settings
    setopt vi

    # VI disables CTRL-r  history search
    bindkey "^R" history-incremental-search-backward

    # No output when background job finishs
    setopt no_notify

    # Background jobs will still running after shell is closed
    setopt hup

###############################################################
#                          Plugins                            #
###############################################################

    plugins=(git)

###############################################################
#                          Editor                             #
###############################################################

    # Why set $VISUAL instead of $EDITOR?
    # http://robots.thoughtbot.com/visual-ize-the-future
    export VISUAL="vim -p"
    alias  vi="$VISUAL"
    alias  vim="$VISUAL"

###############################################################
#                          Aliases                            #
###############################################################

    # Rules
        # Never add spaces to aliases e.g. alias eclipse = '...'

    # Configurations
        alias zshconfig='vim ~/.zshrc'
        alias ohmyzsh='vim ~/.oh-my-zsh'
        alias vimconfig='vim ~/.vimrc'

    # Programs
        alias eclipse='~/Programme/eclipse/eclipse'

    # Folder shortcuts
        alias inet='cd ~/repos/cloudnet_simulator/Simulator\ Framework/'
        alias paleo='cd ~/Dropbox/Freizeit/Ernaehrung/Paleo/'
        alias lauren='cd ~/Dropbox/Freizeit/Sport/MarkLauren'
        alias freizeit='cd ~/Dropbox/Freizeit'

        # Semester shortcuts
            alias semester='cd ~/Dropbox/Meine_Technische_Informatik/5.Semester/'

            alias hwp='cd ~/Dropbox/Meine_Technische_Informatik/5.Semester/Hardwarepraktikum/'
            alias .hwp='~/Dropbox/Meine_Technische_Informatik/5.Semester/Hardwarepraktikum'

            alias bsp='cd ~/Dropbox/Meine_Technische_Informatik/5.Semester/Betriebssystempraktikum/'
            alias .bsp='~/Dropbox/Meine_Technische_Informatik/5.Semester/Betriebssystempraktikum'

            alias mdt='cd ~/Dropbox/Meine_Technische_Informatik/5.Semester/Messtechnik/'
            alias .mdt='~/Dropbox/Meine_Technische_Informatik/5.Semester/Messtechnik'

            alias ki='cd ~/Dropbox/Meine_Technische_Informatik/5.Semester/KuenstlicheIntelligenz/Probabilistische/'
            alias .ki='~/Dropbox/Meine_Technische_Informatik/5.Semester/KuenstlicheIntelligenz/Probabilistische'

            alias sem='cd ~/Dropbox/Meine_Technische_Informatik/5.Semester/KuenstlicheIntelligenz/Seminar/'
            alias .sem='~/Dropbox/Meine_Technische_Informatik/5.Semester/KuenstlicheIntelligenz/Seminar'

    # TMux
        alias newS='tmux new -s $1'
        alias toS='tmux attach -t $1'

    # SSH Connections
        alias toeinstein='ssh einstein@192.168.0.2'

    # Cheatsheets
        alias cheatLatex='evince ~/Dropbox/Meine_Technische_Informatik/Useful/Latex/Cheatsheets/latexsheet-a4.pdf & '
        alias cheatVim='evince ~/Dropbox/Meine_Technische_Informatik/Useful/VIM/VIM.pdf & '

    # Useful
        alias rotate=' sh ~/Programme/wacomRotate.sh'
        alias o='xdg-open'
        alias l='ls -lghF --group-directories-first --color=auto'
        alias ll='ls -laghF --group-directories-first --color=auto'
        alias startAgent='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/x220t_rsa'
        alias gittree='git log --graph --oneline --decorate --all'
        alias sourceall='source ~/.zshrc || source ~/.vimrc'
        alias euler='cd ~/Dropbox/Freizeit/Projekte/ProjectEuler/'
        alias crawler='cd ~/Dropbox/Freizeit/Projekte/Crawler/'

    # source .zshrc_alias

###############################################################
#                         Functions                           #
###############################################################

    # Create dir and switch into it
    function mkcd() {
        mkdir "$1" && cd "$1" ;
    }

    # Empty the trash in .trash
    function empty-trash() {
        rm -rf ~/.trash/*
    }

    # Create dir and switch into it
    function rem() {
        # check whether file is already inside .trash folder
        # true => delete file permanently
        # false => move it to .trash
        mv -f "$1" ~/.trash;
    }

    # Insert "sudo " at the beginning of the line
    function prepend-sudo {
        if [[ $BUFFER != "sudo "* ]]; then
            BUFFER="sudo $BUFFER"; CURSOR+=5
        fi
    }
    zle -N prepend-sudo
    [[ -n "^[s" ]] && \
    bindkey "^[s" prepend-sudo

###############################################################
#                Use modern completion system                 #
###############################################################

autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

source /opt/ros/jade/setup.zsh
