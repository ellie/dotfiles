" Setup plugins ----------------------------------------------------------------

call plug#begin('~/.config/neovim/plugged')

Plug 'roxma/nvim-yarp'

" autocomplete 
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" colour scheme
Plug 'altercation/vim-colors-solarized'

Plug 'junegunn/fzf'

Plug 'itchyny/lightline.vim'

" git
Plug 'airblade/vim-gitgutter' " displays diff stuff in the sign column

" just support as many languages as possible
Plug 'sheerun/vim-polyglot'

Plug 'iCyMind/NeoSolarized'

Plug 'zchee/deoplete-go', {'build': {'unix': 'make'}}

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" Indentation ------------------------------------------------------------------
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

" Appearance -------------------------------------------------------------------

set colorcolumn=80     " I prefer not to go beyond this
set ruler              " show current line and column in status
colorscheme NeoSolarized
set background=dark    " change to light for light scheme
set number             " absolute number
set relativenumber     " relative number
set signcolumn=yes

set cursorline
hi clear CursorLine
hi CursorLine gui=underline cterm=underline

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" Key bindings -----------------------------------------------------------------
inoremap jj <Esc>
let mapleader=' '

nmap <leader>w :wa<cr>
nmap <leader>t :NERDTreeToggle<cr>
nmap <leader>f :FZF<cr>
nmap <leader>d :Find 
nmap <leader>z :Denite -mode=normal zif<cr>
nmap <leader>nh :noh<cr>
nmap ; :Buffers<cr>

" switch splits much more easily
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <leader>m :make<cr>
nnoremap <leader>mt :!make test<cr>

nnoremap <leader>id :tab drop ~/ideas.txt<cr>
nnoremap <leader>td :tab drop ~/todo.txt<cr>

nnoremap <C-n> :bNext<cr>
nnoremap <C-p> :bprevious<cr>

nnoremap H :wincmd h<cr>
nnoremap J :wincmd j<cr>
nnoremap K :wincmd k<cr>
nnoremap L :wincmd l<cr>

au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>i <Plug>(go-install)

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

tnoremap <esc> <C-\><C-n>

" Autocmds ---------------------------------------------------------------------
autocmd FileType vue.html.javascript.css let b:deoplete_disable_auto_complete = 1

" Autocomplete -----------------------------------------------------------------
set hidden
set completeopt=noinsert,menuone,noselect

let g:deoplete#enable_at_startup = 1

" Buffers ----------------------------------------------------------------------
set hidden " open a new buffer without being forced to save

" Search -----------------------------------------------------------------------

set ignorecase " case insensitive searching
set smartcase  " if the query has a capital, it IS case sensitive
set magic	   " magic patterns used - extended regex
