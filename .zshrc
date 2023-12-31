export ZSH="/home/jeffry/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="avit"
# ZSH_THEME="theunraveler"
# ZSH_THEME="dracula"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

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
plugins=(
  git
  mix
  ssh-agent
  zsh-autosuggestions
)

zstyle :omz:plugins:ssh-agent agent-forwarding on

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

bindkey -v
# Kill The Lag: there is a 0.4 second delay after hitting <ESC>. This reduces it to 0.1
export KEYTIMEOUT=1

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

bindkey -s '^f' "tmux-sessionizer\n"
#bindkey -s '^o' "tmux-sessionizer ~/Code/KYT/honcho\n"
#bindkey -s '^a' "tmux-reattach\n"

# Fucntion keys
# bindkey '^[OP' f1
# bindkey '^[OQ' f2
# bindkey '^[OR' f3
# bindkey '^[OS' f4
#bindkey -s '^[[15~' "tmux-sessionizer\n" # F5
#bindkey -s '^[[17~' "tmux-reattach\n" # F6
#bindkey -s '^[[18~' "tmux-sessionizer ~/Code/KYT/honcho\n" # F7
#bindkey -s '^[[19~' "tmux-sessionizer ~/Code/LuckyLady/MakenaBot\n" # F8
# bindkey '^[[20~' f9
# bindkey '^[[21~' f10
# bindkey '^[[23~' f11
# bindkey '^[[24~' f12

# fasd, the thingy we use for jumping around directories
#
# only init if installed.
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)" >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# jump to recently used items
alias a='fasd -a' # any
# alias s='fasd -si' # show / search / select
alias d='fasd -d' # directory
alias f='fasd -f' # file
alias z='fasd_cd -d' # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # interactive directory jump
alias n="tmux-window"

alias ls="exa -abgl --git --color-scale --icons --group-directories-first -@"
alias cat="bat"
alias git=hub
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias vim='nvim'
alias vi=vim
alias v=vim
alias cobra=cobra-cli
alias s="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
compdef config='git'

eval $(thefuck --alias)

export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore -g ""'

# disable auto correct
unsetopt correct_all

export PATH="$PATH:$HOME/.bin:$HOME/.local/bin:$HOME/go/bin:$HOME/.cargo/bin"

source $HOME/.oh-my-zsh/custom/plugins/zsh-histdb/sqlite-history.zsh
autoload -Uz add-zsh-hook


. /opt/asdf-vm/asdf.sh

source <(/usr/bin/starship init zsh --print-full-init)

export EXA_COLORS=$(vivid generate iceberg-dark)
# export TERM=xterm-256color
# makes fpp open files in buffers in nvim rather that
export FPP_DISABLE_SPLIT=1

# opam configuration (OCaml)
[[ ! -r ~/.opam/opam-init/init.zsh ]] || source ~/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# personal config that shouldn't be exposed in git.
. ~/.zshrc.secret

function loadenv() {
    if [ -f .env ];
    then
        source .env
    fi
}

# Overwrites `cd` to load environment files when they're available. There is no unloading going on. In practice
# it doesn't supper matter because I tend to open new shells for new tasks.
function cd() {
    builtin cd $@
    loadenv
}

export SHELLBOT="/mnt/data/Code/github/shellbot/target/release/shellbot"
export SHELLBOT_PROMPT='

  You are a helpful asssistant wo provides brief explanations and short code snippets
  for technologies like JavaScript, Rust, Ruby, Ruby on Rails, HTML, CSS, Zsh, Go and Lua.
  Your user is an expert programmer so you should be as consise as possible. You do not show 
  lengthy steps or setup instructions. Questions will be asked using Markdown, and you should
  feel free to use Markdown syntax in your replies.
'

export GOPATH="$HOME/go"
