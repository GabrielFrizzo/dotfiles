set nocompatible              " be iMproved, required
filetype off                  " required
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'micha/vim-colors-solarized'
Plugin 'junegunn/fzf'
call vundle#end()
filetype plugin indent on

autocmd! bufwritepost .vimrc source %

set pastetoggle=<F2>
set clipboard=unnamed

let mapleader = ","

noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>  
     
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

set history=700
set undolevels=700

map <Leader>o <esc>:Vexplore<CR>
map <Leader>f <esc>:FZF<CR>
map <Leader>b Oimport ipdb; ipdb.set_trace()

inoremap {      {}<Left>
inoremap '      ''<Left>
inoremap (      ()<Left>
inoremap [      []<Left>
inoremap "      ""<Left>

set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set autoindent
set rnu
