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
