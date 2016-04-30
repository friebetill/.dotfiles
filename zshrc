##############################################################
#                                                            #
#                        ZSHELL - RUNCOM                     #
#                                                            #
#    Sections:                                               #
#       -> Environment                                       #
#       -> Options                                           #
#       -> Editor                                            #
#       -> Functions                                         #
#       -> Aliases                                           #
#                                                            #
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

    # Switches Ctrl with CapsLk
    xmodmap ~/.dotfiles/Xmodmap


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

            alias tet='cd ~/Dropbox/Meine_Technische_Informatik/6.Semester/Theoretische_Elektrotechnik_I/'

            alias sch='cd ~/Dropbox/Meine_Technische_Informatik/6.Semester/Schaltungstechnik/'

            alias ki='cd ~/Dropbox/Meine_Technische_Informatik/6.Semester/Kunstliche_Intelligenz_Projekt/'
            alias rungame='java -jar Versus.jar ./config/roundrobin.xml'

            alias rob='cd ~/Dropbox/Meine_Technische_Informatik/6.Semester/Robotics_Fundamentals/'
            alias orange='ssh orange@192.168.0.120'

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

    function downloadAllPDFs() {
        wget -p -r -nd -l 1 -e robots=off -A pdf "$1"
    }

###############################################################
#                         Robotics                            #
###############################################################

source /opt/ros/jade/setup.zsh
source ~/catkin_ws/devel/setup.zsh

me=$(hostname -I | cut -f1 -d' ')
master=192.168.0.129
# echo "setting $master as ROS MASTER for me ($me)"
export ROS_MASTER_URI=http://$master:11311
export ROS_IP=$me
