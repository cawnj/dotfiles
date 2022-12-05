# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# autostart tmux
ZSH_TMUX_AUTOSTART=true

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
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(git colored-man-pages colorize pip python brew macos tmux)
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/Users/conor/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/highlighters
source /Users/conor/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# this comes last
source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
export PATH=$PATH:$(go env GOPATH)/bin
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
export PATH=/opt/homebrew/opt/libpq/bin:$PATH
export PATH=/opt/homebrew/opt/ruby/bin:$PATH
export PATH=`gem environment gemdir`/bin:$PATH
export PATH=~/.yarn/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=/opt/homebrew/opt/util-linux/bin:$PATH
export PATH=/opt/homebrew/opt/util-linux/sbin:$PATH

# ANTLR
export CLASSPATH="/opt/homebrew/Cellar/antlr/4.11.1/antlr-4.11.1-complete.jar:."

# User configuration
tmux source-file ~/.tmux.conf
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

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

# personal functions
function chpwd() {
    emulate -L zsh
    ls
}

function up_widget() {
    BUFFER="cd .."
    zle accept-line
}
zle -N up_widget
bindkey "^k" up_widget

# nvmrc autoload
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install &> /dev/null
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use &> /dev/null
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default &> /dev/null
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias gpr="git push origin HEAD:refs/for/main"
alias gpr_master="git push origin HEAD:refs/for/master"
alias gpr_main="git push origin HEAD:refs/for/main"
alias gpr_wip="git push origin HEAD:refs/for/main%wip"
alias gls="git log --show-signature"
alias sminit="git submodule update --init --recursive"
alias gcane="git commit -a --amend --no-edit"
alias gcm="git commit -m"
alias gs="git status"

alias kdev="kubectl config use-context dev"
alias kinfra="kubectl config use-context infra"
alias kcluster="kubectl config current-context"

alias prettyjson="python -m json.tool"

alias chrome="open -a \"Google Chrome\""
alias word="open -a \"Microsoft Word\""

alias mountleo="sudo mkdir /Volumes/leo; sudo mount /Volumes/leo"
alias umountleo="sudo umount /Volumes/leo"
alias leo="mosh cj@leo.local.cawnj.dev"

