# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export TERM="xterm-256color"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"
#export PROMPT_DIRTRIM=2

DEFAULT_USER="till"

# only fools wouldn't do this ;-)
export EDITOR="vim"

# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/home/till/anaconda/bin:/home/till/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# My own settings
setopt vi

# No output when background job finishs
setopt no_notify

# Background jobs will still running after shell is closed
setopt hup

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Insert "sudo " at the beginning of the line
# {{{
function prepend-sudo {
    if [[ $BUFFER != "sudo "* ]]; then
        BUFFER="sudo $BUFFER"; CURSOR+=5
    fi
}
zle -N prepend-sudo
[[ -n "^[s" ]] && \
bindkey "^[s" prepend-sudo
# }}}


# Aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

alias eclipse="~/Programme/eclipse/eclipse"
alias toinet='ssh till@tetris.inet.tu-berlin.de'
alias inet="cd ~/repos/cloudnet_simulator/Simulator\ Framework/"
alias paleo='cd ~/Dropbox/Freizeit/Ernaehrung/Paleo/'
alias lauren='cd ~/Dropbox/Freizeit/Sport/MarkLauren'
alias freizeit='cd ~/Dropbox/Freizeit'

# {{{ Semester aliases
alias semester='cd ~/Dropbox/Meine_Technische_Informatik/5.Semester/'
alias hwp='cd ~/Dropbox/Meine_Technische_Informatik/5.Semester/Hardwarepraktikum'
alias bsp='cd ~/Dropbox/Meine_Technische_Informatik/5.Semester/Betriebssystempraktikum'
alias mdt='cd ~/Dropbox/Meine_Technische_Informatik/5.Semester/Messtechnik'
alias ki='cd ~/Dropbox/Meine_Technische_Informatik/5.Semester/KuenstlicheIntelligenz/Probabilistische/'
alias sem='cd ~/Dropbox/Meine_Technische_Informatik/5.Semester/KuenstlicheIntelligenz/Seminar/'
# }}}

alias cheatLatex='evince ~/Dropbox/Meine_Technische_Informatik/Useful/Latex/Cheatsheets/latexsheet-a4.pdf'
alias newS='tmux new -s $1'
alias toS='tmux attach -t $1'

alias rotate=' sh ~/bin/wacomRotate.sh'

alias startAgent='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/x220t_rsa'

alias einstein='ssh einstein@192.168.0.2'

alias rm=trash
alias o='xdg-open'

alias l='ls -lghF --group-directories-first'

if [[ -r /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh
fi
