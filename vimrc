"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Personal .vimrc
" Author: Andrew Taylor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable compatibility with vi
set nocompatible

" Styles
set background=dark

" Enable file type detection
" Automatically load plugins and indent files for filetypes
filetype on
filetype plugin on
filetype indent on

" Highlight the line the cursor is on
" Display cursor line only in the active window
set cursorline
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline
augroup END

" Set tab width and expand tabs to spaces
set shiftwidth=4
set tabstop=4
set expandtab

" Do not save backup files
set nobackup

" Keep the cursor within N lines from top/bottom
set scrolloff=10

" Don't wordwrap
set nowrap

" Enable incremental highlighting during search
" Ignore case during search, unless capital letters searched for
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

" Increase command history
set history=1000

" If vim version >= 7.3 enable undofile to enbable undo even after write
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" Enable command auto completion via <Tab>
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Turn on syntax highlighting
syntax on

" Nginx configuration file highlighting
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*
    \ if &ft == ''
    \   | setfiletype nginx |
    \ endif

" Set the leader key
let mapleader='\\'

" Enable sudo-edit via :w!!
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Jump back to last cursor position
nnoremap <leader>\ ''

" Quick command entry with <space> > :
nnoremap <space> :

" Quick insert line before/after with o/O
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when jumping to next search item
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to end of line
nnoremap Y y$

" More easily navigate split windows with Ctrl+j,k,h,l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows with Ctrl+<arrow>
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

"
" Load vim-plug pugins
" 
call plug#begin()

Plug 'dense-analysis/ale' " Code linting
Plug 'preservim/nerdtree' " File system explorer
Plug 'itchyny/lightline.vim' " Fancy status line
Plug 'tpope/vim-fugitive' " Git integration
Plug 'nathanaelkane/vim-indent-guides' " Indentation highlighting
Plug 'ycm-core/YouCompleteMe', { 'dir': '~/.vim/bundle/',
            \'do': './install.py --all' } " Auto completion

" Language specific plugins
Plug 'rust-lang/rust.vim'

Plug 'pangloss/vim-javascript'

Plug 'StanAngeloff/php.vim'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'rayburgemeestre/phpfolding.vim'

Plug 'preservim/vim-markdown'

" Done loading plugins
call plug#end()

"
" Configure Plugins
"

" Disable ALE adding comments to the end of lines for errors.
let g:ale_virtualtext_cursor = 0

"Load NerdTree on F3
nnoremap <F3> :NERDTreeToggle<cr>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', 
    \'\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" Clear status line when vimrc is reloaded.
set statusline=
" Show the status on the second to last line.
set laststatus=2
" Turn off mode display, since mode is included in status line
set noshowmode
" Add git informatiion and charhexvalue to status line
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'                                                        
      \ },
      \ }

" Turn on indent guines for visual indentation tracking
let g:indent_guides_enable_on_vim_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
