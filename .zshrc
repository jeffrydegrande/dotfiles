export ZSH="/home/jeffry/.oh-my-zsh"

plugins=(
  archlinux
  chucknorris
  extract
  gcloud
  # gh
  # git
  hitchhiker
  httpie
  # mix
  procs
  ssh-agent
  thefuck
  zoxide
  zsh-autosuggestions
)

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:update mode reminder

source $ZSH/oh-my-zsh.sh

# export LANG=en_US.UTF-8
export EDITOR='vim'
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

bindkey -v
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
bindkey -s '^a' "tmux-reattach\n"

export PATH="$PATH:$HOME/.bin:$HOME/.local/bin:$HOME/go/bin:$HOME/.cargo/bin"

alias ls="exa  -bglh --git --color-scale --icons --group-directories-first -@"
alias ll="exa -abglh --git --color-scale --icons --group-directories-first -@"

alias cat="bat --theme=Nord"
alias catt="bat -p --theme=Nord"
alias git=hub
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias vim='nvim'
alias vi=vim
# alias v=vim
alias cobra=cobra-cli
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

compdef config='git'

alias R="tmux resize-pane -x 70%"
alias r="tmux resize-pane -x 50%"


export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore -g ""'

# disable auto correct
unsetopt correct_all
setopt correct

source $HOME/.oh-my-zsh/custom/plugins/zsh-histdb/sqlite-history.zsh
autoload -Uz add-zsh-hook

. /opt/asdf-vm/asdf.sh

source <(/usr/bin/starship init zsh --print-full-init)

eval $(dircolors ~/.dir_colors)
export EXA_COLORS=$LS_COLORS

# export EXA_COLORS=$(vivid generate iceberg-dark)
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
# function cd() {
#     builtin cd $@
#     loadenv
# }

export SHELLBOT="/mnt/data/Code/github/shellbot/target/release/shellbot"
export SHELLBOT_PROMPT='

  You are a helpful asssistant wo provides brief explanations and short code snippets
  for technologies like JavaScript, Rust, Ruby, Ruby on Rails, HTML, CSS, Zsh, Go and Lua.
  Your user is an expert programmer so you should be as consise as possible. You do not show
  lengthy steps or setup instructions. Questions will be asked using Markdown, and you should
  feel free to use Markdown syntax in your replies.
'

export GOPATH="$HOME/go"

eval "$(gh copilot alias -- zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/jeffry/.google-cloud-sdk/path.zsh.inc' ]; then . '/home/jeffry/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/jeffry/.google-cloud-sdk/completion.zsh.inc' ]; then . '/home/jeffry/.google-cloud-sdk/completion.zsh.inc'; fi
