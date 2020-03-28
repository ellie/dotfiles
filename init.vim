" Setup plugins ----------------------------------------------------------------
call plug#begin('~/.config/neovim/plugged')

Plug 'junegunn/fzf'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter' " displays diff stuff in the sign column
Plug 'sheerun/vim-polyglot'
Plug 'iCyMind/NeoSolarized'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" get that floaty window :D
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

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

" Autocomplete -----------------------------------------------------------------
"
" see: https://github.com/neoclide/coc.nvim
"
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <leader>k to show documentation in preview window.
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Buffers ----------------------------------------------------------------------
set hidden " open a new buffer without being forced to save

" Search -----------------------------------------------------------------------

set ignorecase " case insensitive searching
set smartcase  " if the query has a capital, it IS case sensitive
set magic	   " magic patterns used - extended regex
