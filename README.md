## devtool-config

#### .zshrc

```shell
# Path to your oh-my-zsh installation.
export ZSH=/Users/xiuhong/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# xcore
alias xcore="node_modules/.bin/xcore"

# open file with sublime  
alias subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
alias nano="subl"
export EDITOR="subl"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

#keyboard shortcut 
bindkey -e
bindkey '[C' forward-word
bindkey '[D' backward-word

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin" 
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

# mongodb
export PATH="/usr/local/Cellar/mongodb/3.2.0/bin":$PATH

# phantomjs
export PATH="/Users/xiuhong/phantomjs/bin":$PATH

# java
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export PATH=$JAVA_HOME/bin:$PATH 
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

# don't check for new mail
MAILCHECK=0

```


#### tmux config

```shell
## remap prefix from 'C-b' to 'C-a' unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix
# split panes using | and -
bind | split-window -h
bind - split-window -v
unbind '"'
unbind %


# reload config file (change file location to your the tmux.conf you want to
# use)
bind r source-file ~/.tmux.conf

# panes
set -g pane-border-fg black
set -g pane-active-border-fg brightred

# status bar design
# status line
set -g status-utf8 on
set -g status-justify left
set -g status-bg default
set -g status-fg colour12
set -g status-interval 2

# messaging
set -g message-fg black
set -g message-bg yellow
set -g message-command-fg blue
set -g message-command-bg black


# window mode
setw -g mode-bg colour6
setw -g mode-fg colour0


# window status
# setw -g window-status-format "#f#i:#w#f "
# setw -g window-status-current-format "#f#i:#w#f "
# setw -g window-status-current-bg colour0
# setw -g window-status-current-fg colour11
# setw -g window-status-current-attr dim
# setw -g window-status-bg green
# setw -g window-status-fg black
# setw -g window-status-attr reverse

setw -g window-status-format " #F#I:#W#F "
setw -g window-status-current-format " #F#I:#W#F "
setw -g window-status-format "#[fg=magenta]#[bg=black] #I #[bg=cyan]#[fg=colour8] #W "
setw -g window-status-current-format "#[bg=brightmagenta]#[fg=colour8] #I #[fg=colour8]#[bg=colour14] #W "
setw -g window-status-current-bg colour0
setw -g window-status-current-fg colour11
setw -g window-status-current-attr dim
setw -g window-status-bg green
setw -g window-status-fg black
setw -g window-status-attr reverse


# info on left (i don't have a session display for now)
set -g status-left ''

# loud or quiet?
set-option -g visual-activity off
set-option -g visual-bell off
set-option -g visual-silence off
set-window-option -g monitor-activity off
set-option -g bell-action none

set -g default-terminal "screen-256color"

# the modes {
setw -g clock-mode-colour colour135
setw -g mode-attr bold
setw -g mode-fg colour196
setw -g mode-bg colour238
# }

# the panes {
set -g pane-border-bg colour235
set -g pane-border-fg colour238
set -g pane-active-border-bg colour236
set -g pane-active-border-fg colour51
# }

# the statusbar {
set -g status-position bottom
set -g status-bg colour234
set -g status-fg colour137
set -g status-attr dim
set -g status-left ''
set -g status-right-length 50
set -g status-left-length 20

setw -g window-status-current-fg colour81
setw -g window-status-current-bg colour238
setw -g window-status-current-attr bold

setw -g window-status-fg colour138
setw -g window-status-bg colour235
setw -g window-status-attr none

setw -g window-status-bell-attr bold
setw -g window-status-bell-fg colour255
setw -g window-status-bell-bg colour1

# }

# the messages {
set -g message-attr bold
set -g message-fg colour232
set -g message-bg colour166
# }

# copy mode 
setw -g mode-keys vi

set-option -g default-command "reattach-to-user-namespace -l zsh"

bind-key -t vi-copy v begin-selection
bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"

unbind [
bind Escape copy-mode

# unbind p

# bind p paste-buffer
# bind-key -t vi-copy 'v' begin-selection
# bind-key -t vi-copy 'y' copy-selection

# keep the window's name fixed in tmux
set-option -g allow-rename off

```


#### .vimrc
```shell
" ============================  Color  ====================================

colorscheme earth 
" colorscheme solarized
" set background=dark

" enable syntax processing
syntax enable

" hightlight search
set hlsearch


" ============================  Spaces & Tabs  ============================

" number of visual spaces per TAB
set tabstop=4

" number of spaces in tab when editing
set softtabstop=4

" tabs are spaces
set expandtab

" =============================  UI config  ===============================

" show line numbers
set number

" show command in bottom bar
set showcmd

" higlight current line
set cursorline

" easy Expansion of th Active File Direcroty
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" =============================  VIM Bundle ===============================
set nocompatible
" filetype off
filetype plugin on
set rtp+=~/.vim/bundle/Vundle.vim

"Alternatively, pass a path where Vundle should install plugins 
call vundle#begin('~/.vim/bundle')

" Let Vundle manage itself 
Plugin 'VundleVim/Vundle.vim' 

Plugin 'tpope/vim-commentary'
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'

call vundle#end()
filetype plugin indent on

```


#### .csscomb.json [offical site](http://csscomb.com/)

```shell
{
    "remove-empty-rulesets": true,
    "always-semicolon": true,
    "color-case": "upper",
    "block-indent": "\t",
    "color-shorthand": false,
    "element-case": "lower",
    "eof-newline": true,
    "leading-zero": false,
    "quotes": "double",
    "space-before-colon": "",
    "space-after-colon": " ",
    "space-before-combinator": " ",
    "space-after-combinator": " ",
    "space-between-declarations": "\n",
    "space-before-opening-brace": " ",
    "space-after-opening-brace": "\n",
    "space-after-selector-delimiter": " ",
    "space-before-selector-delimiter": "",
    "space-before-closing-brace": "\n",
    "strip-spaces": true,
    "tab-size": true,
    "vendor-prefix-align": true
}
```







