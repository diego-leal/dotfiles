if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
end

call plug#begin('~/.config/nvim/plugged')
    Plug 'junegunn/fzf', { 'dir': '~/.config/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'morhetz/gruvbox'
    Plug 'mbbill/undotree'
    Plug 'preservim/nerdtree'
call plug#end()

set t_Co=256
set bg=dark
colorscheme gruvbox

function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nnoremap <F5> :UndotreeToggle<cr>
nnoremap <c-n> :NERDTreeToggle<cr>

nnoremap <c-p> :Files<cr>
nnoremap <leader>; A;<esc>
nnoremap <leader>sv :source $MYVIMRC<cr>

nmap <Tab> :bnext<cr>
nmap <S-Tab> :bprevious<cr>


autocmd BufWritePre * :call TrimWhitespace()