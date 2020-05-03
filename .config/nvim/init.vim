call plug#begin('~/.config/nvim/plugged')
  Plug 'junegunn/fzf', { 'dir': '~/.config/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'morhetz/gruvbox'
  Plug 'mbbill/undotree'
  Plug 'preservim/nerdtree'
call plug#end()

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
set t_Co=256
set bg=dark
colorscheme gruvbox

" Coc config
set nobackup " Some servers have issues with backup files
set nowritebackup " Some servers have issues with backup files
set shortmess+=c " Don't pass messages to ins-completion-menu
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Coc binds
map <leader>f  <Plug>(coc-format-selected)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" End of Coc config

function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nnoremap <F5> :UndotreeToggle<cr>
nnoremap <c-n> :NERDTreeToggle<cr>

let g:mapleader="\<space>"

nnoremap <leader>; A;<esc>
nnoremap <leader>sv :source $MYVIMRC<cr>
nmap <leader>n :bnext<cr>
nmap <leader>p :bprevious<cr>
nnoremap <c-p> :Files<cr>

autocmd BufWritePre * :call TrimWhitespace()

