# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/xiuhong/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# maven
MAVEN_HOME=/usr/local/Cellar/maven/3.6.3_1/libexec
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_151.jdk/Contents/Home
export MAVEN_HOME
export JAVA_HOME
export PATH=${PATH}:${MAVEN_HOME}/bin:${JAVA_HOME}/bin


alias vi=nvim
alias vim=nvim
alias cat=bat

# Setting ag as the default source for fzf
export FZF_COMPLETION_TRIGGER=';'
# export FZF_DEFAULT_COMMAND='ag --hidden -l -g ""'
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
# bindkey '^T' fzf-completion
# bindkey '^I' $fzf_default_completion
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--ansi --preview-window "right:60%" --preview "bat --style=numbers --color=always --line-range :500 {}" --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254 --color info:254,prompt:37,spinner:108,pointer:235,marker:235'

source  "/Users/xiuhong/.config/fzf/completion.zsh"
source  "/Users/xiuhong/.config/fzf/key-bindings.zsh"

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
				  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}


export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8


