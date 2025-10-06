# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export LANG="en_US.UTF-8"
ZSH=$HOME/.oh-my-zsh/

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "powerlevel9k/powerlevel9k" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
plugins=(git git-extras git-flow docker docker-compose podman node npm aws pip postgres laravel archlinux pass rails rvm ruby)


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
export EDITOR='nvim'
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

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

alias jj-contentful='bin/contentful'
# Alias to docker
alias docker-compose="docker compose"
alias dcd="docker-compose down"
alias dcdr="docker-compose down -v --remove-orphans"
alias dcu="docker-compose up"
# Alias Vim
alias v="nvim"
# Alias git thanks Ernesto Herrera https://github.com/ernestohs
alias push='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias pull='git pull --rebase --recurse-submodules origin $(git rev-parse --abbrev-ref HEAD)'
alias s="git status -s"
alias c="git commit -m "
alias a='git add . && git status -s'
alias l='git log --oneline --all --graph --decorate'
alias gb='git fetch && git checkout '
alias undo='git checkout --'
alias reset='git reset --hard HEAD~1'
alias branch='git checkout -b'
alias friday='pull && git commit -a -m "Last changes from Friday" && push'
alias changes='git diff --'
alias nomerge='git merge --abort'
alias delrem="git branch -vv | grep ': gone]'|  grep -v "\*" | awk '{ print $1; }' | xargs -r git branch -d"

alias lynx='lynx -vikeys'
alias ddg="lynx --accept-all-cookies --display_charset=utf-8 www.duckduckgo.com"
alias lcpp="lynx --accept-all-cookies --display_charset=utf-8 www.learncpp.com"
alias yt="ytfzf -t"
alias yt-download-mp3="yt-dlp -f bestaudio -x --audio-format mp3 --audio-quality 0 -t sleep --embed-thumbnail --embed-metadata -o \"%(title)s.%(ext)s\" --file-access-retries 10"

export MANPAGER='nvim +Man!'

export PATH="$PATH:$HOME/.config/bin"

export GTK_THEME="Gruvbox-Material-Dark"
export GTK_ICON_THEME="Gruvbox-Material-Dark"

eval "$(starship init zsh)"
source /usr/share/nvm/init-nvm.sh

if [[ $- == *i* ]]; then
  set_gpg_tty() {
    export GPG_TTY=$(tty)
  }
  set_gpg_tty
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
