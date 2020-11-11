let g:mapleader="\<space>"

syntax on
filetype plugin on
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smarttab
set smartcase
set ignorecase
set number relativenumber
set noswapfile
set undodir=~/.config/nvim/undodir
set undofile
set updatetime=1000 "Default 4000ms
set nowrap
set termguicolors
set splitbelow splitright
set clipboard=unnamedplus
set cursorline
set cmdheight=2
set nobackup " Some servers have issues with backup files
set nowritebackup " Some servers have issues with backup files
set nohlsearch

if !exists('g:vscode')
  source $HOME/.config/nvim/settings/vim/init.vim
else
  source $HOME/.config/nvim/settings/vscode/init.vim
end
