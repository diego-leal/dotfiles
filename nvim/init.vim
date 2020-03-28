call plug#begin('~/.config/nvim/plugged')
" Fuzzi search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Add a syntax file. YATS is the best
Plug 'HerringtonDarkholme/yats.vim'

" For async completion
Plug 'Shougo/deoplete.nvim'

" Theme
Plug 'morhetz/gruvbox'
call plug#end()

" Basic Configs
set number
set hidden
set inccommand=split
set clipboard=unnamed
set expandtab
set shiftwidth=2
filetype plugin indent on

" Theme Session

" set support to 256-colors
set termguicolors

" enforce display italic
let g:gruvbox_italic=1

" set color scheme
colorscheme gruvbox

" set backgroud to dark mode
set bg=dark

" ----------------------------
" Keybind Session

let mapleader="\<space>"
nnoremap <leader>; A;<esc>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>
nnoremap <c-b> :NerdTreeToggle<cr>
" ---------------------------------
