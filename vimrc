" Vim needs a POSIX shell
if $SHELL =~ 'bin/fish'
    set shell=/bin/sh
endif

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
Bundle 'chase/vim-ansible-yaml'
Bundle 'altercation/vim-colors-solarized'
Bundle 'majutsushi/tagbar'
Bundle 'airblade/vim-gitgutter'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'christoomey/vim-tmux-navigator'

" The bundles you install will be listed here

filetype plugin indent on

" The rest of your config follows here

syntax enable
set incsearch
set hlsearch
set sw=2
set ts=2
set expandtab
"set textwidth=79

" Set cursor crosshairs (column, line)
"set cuc
set cul

" Hide buffers instead of closing them
set hidden

" Set list to show white space
"set list
"set listchars=tab:»·,trail:§,extends:¬,precedes:«,nbsp:§

" If your running OSX and backspace doesn't behave correctly uncomment this
" following line
"set backspace=indent,eol,start

" Font Hack as the default font
set guifont=Hack\ 9
set laststatus=2
"
" Set solarized colour scheme

" (optional) If everything is too bright and high contrast, then uncomment
" the next 2 lines:
set term=screen-256color
let g:solarized_termcolors=256
set background=dark
" loading the solarized colorscheme is silent to prevent error during initial install
silent! colorscheme solarized

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 80
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
    augroup END

" Tagbar setup
" NOTE: you need ctags installed, so will keep this commented out for now
"nmap <F9> :TagbarToggle<CR>
" (Optional) If you are on OSX or have ctags (non-BSD) installed somewhere else not in
" your path, use to following line to point to it.
"let g:tagbar_ctags_bin="/usr/local/Cellar/ctags/5.8_1/bin/ctags"

" Nerdtree setup
map <F2> :NERDTreeToggle<CR>

" Airline Setup
"  smarter tab line
"let g:airline#extensions#tabline#enabled = 1
"
"  Separators can be configured independently for the tabline
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
" Automatically fix PEP8 errors in the current buffer:
noremap <F8> :PymodeLintAuto<CR>

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Finally, load any overrides from the local box
" (silent in case it doesn't exist)
silent! source ~/.vimrc_overrides

