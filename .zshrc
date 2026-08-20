# Load Starship Prompt
eval "$(starship init zsh)"

export MANPAGER='nvim +Man!'


# Plugins vía Pacman
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

alias bat-limit='echo 80 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold'
alias bat-full='echo 100 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold'
alias ls='ls --color=auto'

# Alias to docker
alias docker-compose="docker compose"
alias dcd="docker-compose down"
alias dcdr="docker-compose down -v --remove-orphans"
alias dcu="docker-compose up"
alias dcub="docker-compose up --build"
# Alias Vim
alias v="nvim"
# Git aliases
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
# ps aliases
alias cpustatus='ps -eo pid,comm,%cpu,%mem --sort=-%cpu --width=100 | head -n 11'
alias memstatus='ps -eo pid,comm,%cpu,%mem --sort=-%mem --width=100 | head -n 11'
# lynx aliases
alias lynx='lynx --accept-all-cookies --display_charset=utf-8 -vikeys'
alias ddg="lynx www.duckduckgo.com"
alias lcpp="lynx www.learncpp.com"
# yt-dlp aliases
alias yt="yt-x"
alias yt-download-mp3="yt-dlp -f bestaudio -x --audio-format mp3 --audio-quality 0 -t sleep --embed-thumbnail --embed-metadata -o \"%(title)s.%(ext)s\" --file-access-retries 10"



export PATH="$PATH:$HOME/.config/bin"

export GTK_THEME="Gruvbox-Material-Dark"
export GTK_ICON_THEME="Gruvbox-Material-Dark"

if [[ $- == *i* ]]; then
  set_gpg_tty() {
    export GPG_TTY=$(tty)
  }
  set_gpg_tty
fi

eval "$(rbenv init -)"
eval "$(nodenv init -)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}
