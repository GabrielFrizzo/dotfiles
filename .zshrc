# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/frizzo/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git command-not-found python pip github gnu-utils history-substring-search npm sublime sudo)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias robomongo='/opt/robo3t-1.3.1-linux-x86_64-7419c406/bin/robo3t'
alias cs='xclip -selection clipboard'
alias condaenv='eval "$(/home/frizzo/anaconda3/bin/conda shell.zsh hook)"'
alias IC='cd ~/Documents/IC'
alias bsrc='source ~/.zshrc'
alias python='python3'
alias pip='pip3'
alias venv='source activate venv'

export PATH="/home/frizzo/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
alias dotfiles='/usr/bin/git --git-dir=/home/frizzo/.dotfiles/ --work-tree=/home/frizzo'
export FZF_DEFAULT_COMMAND="find -L"
alias open='xdg-open'
alias eagle='LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libxcb-dri3.so.0 /opt/eagle-9.5.1/eagle'

function ghda {
    for var in "$@"
    do
        ghdl -a "$var.vhdl" && \
        echo "$var analisado!" && \
        ghdl -e "$var" && \
        echo "$var elaborado!" && \
        ghdl -a "${var}_tb.vhdl" && \
        echo "Testbench $var analisado!" && \
        ghdl -e "${var}_tb" && \
        echo "Testbench $var elaborado!" && \
        ghdl -r "${var}_tb" --stop-time=320000ns --wave="${var}.ghw" && \
        echo "Onda criada!"
    done
    echo "Abrindo..."
    gtkwave "${var}.ghw" --save="${var}.gtkw"
}

function urisub {
    num=$(echo $1 | cut -d'.' -f 1)
    ext=$(echo $1 | cut -d'.' -f 2)
    cp $1 ~/Dropbox/cdp-utfpr/cdp-utfpr-codes/uri${num}-frizzo.${ext}
    cp $1 ~/Documents/Projects/urionlinejudge/programasfeitos/uri/
}

function uvasub {
    num=$(echo $1 | cut -d'.' -f 1)
    ext=$(echo $1 | cut -d'.' -f 2)
    cp $1 ~/Dropbox/cdp-utfpr/cdp-utfpr-codes/uva${num}-frizzo.${ext}
    cp $1 ~/Documents/Projects/urionlinejudge/programasfeitos/uva/
}

function avrcompile {
    python3 ~/Documents/UTFPR/ArqSistemas/praticasVHDL/avr_compiler.py $1 && echo "Done!"
}

export NVM_DIR="/home/frizzo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
 # avdmanager, sdkmanager
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
# adb, logcat
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
# emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export GRADLE_HOME=/opt/gradle/gradle-5.6.2
export PATH=${GRADLE_HOME}/bin:${PATH}
export STUDIO_HOME=/opt/android-studio
export PATH=${STUDIO_HOME}/bin:${PATH}
export PATH="$PATH:/opt/flutter/bin"
export PATH=~/bin:$PATH

export IRACE_HOME=/home/frizzo/R/x86_64-pc-linux-gnu-library/3.4/irace
export PATH=${IRACE_HOME}/bin/:$PATH