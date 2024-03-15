# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/guglielmo/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="eastwood"
#ZSH_THEME="typewritten"
#TYPEWRITTEN_SYMBOL="§"
#TYPEWRITTEN_CURSOR="block"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias psudo='sudo env PATH="$PATH"'

# Set typewritten ZSH as a prompt
#

#export TYPEWRITTEN_SYMBOL="$"
#export TYPEWRITTEN_RELATIVE_PATH="adaptive"
#

export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
export INFOPATH="$INFOPATH:/usr/local/texlive/2023/texmf-dist/doc/info"
export MANPATH="$MANPATH:/usr/local/texlive/2023/texmf-dist/doc/man"

export GOROOT="/home/guglielmo/go/go-1.20"
export GOPATH="/home/guglielmo/go/pkgs"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

export JAGS_HOME=$HOME/jags
export PATH="$PATH:$JAGS_HOME/bin"
export LD_LIBRARY_PATH="$JAGS_HOME/lib:$LD_LIBRARY_PATH"
export CPATH="$HOME/clibs:$CPATH"

export PATH="$PATH:$HOME/neovim/bin"

export PATH="$PATH:$HOME/scid/bin"

export WINEPREFIX="$HOME/.win32"
export WINEARCH=win32

#fpath=(~/.zshfuncs "${fpath[@]}")
#autoload -Uz $fpath[1]/*(.:t)
#source ~/.zshfuncs/pod

alias workon="venv -a"
alias nv="nvim"
alias rmd="rm -r"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

function mcd() {
    mkdir -p "$1" && cd "$1"
}

function up() {
    ups=""
    for i in $(seq 1 $1); do
        ups=$ups"../"
    done
    cd $ups
}

function pod() {
    cd $(find ~/PoD -type d -wholename "*$1")
}

function venv() {
    VENVDIR=$HOME/.virtualenvs

    usage() {
        printf "Usage: venv [-a <name>] [-c <name>] [-d <name>] [-h] [-l]"
        printf "\n\n"
        printf "\t-a  activate virtual environment with the given <name>\n"
        printf "\t-c  create a new virtual environment in"
        printf " %s/<name>\n" $VENVDIR
        printf "\t-d  delete the virtual environment in"
        printf " %s/<name>\n" $VENVDIR
        printf "\t-h  show this help message\n"
        printf "\t-l  list all virtual environments in %s\n" $VENVDIR
    }

    if [[ $# = 0 ]]; then
        echo "Error: no option provided"
        usage >&2
    fi

    local OPTIND OPTARG

    while getopts ":a:c:d:hl" OPT; do
        case $OPT in
            a)
                source "$VENVDIR"/"$OPTARG"/bin/activate
                ;;
            c)
                python -m venv "$VENVDIR"/"$OPTARG"
                echo "Virtual environment '$OPTARG' created in $VENVDIR"
                ;;
            d)
                rm -rf "$VENVDIR"/"$OPTARG"
                echo "Virtual environment '$OPTARG' deleted from $VENVDIR"
                ;;
            h)
                usage
                ;;
            l)
                for ENV in $VENVDIR/*/ ; do
                    echo "Virtual environment '$(basename $ENV)'"
                    $ENV/bin/pip list
                    printf "\n"
                done
                ;;
            \?)
                echo "Invalid option: -$OPTARG"
                usage >&2
                ;;
            :)
                echo "Error: option -$OPTARG requires an argument" >&2
                ;;
        esac
    done
}
