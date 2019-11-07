" Vim needs a POSIX shell
if $SHELL !~ 'bin/bash'
    set shell=/bin/sh
endif

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" Navigation
Plugin 'scrooloose/nerdtree' "File system explorer for the Vim editor
Plugin 'ctrlpvim/ctrlp.vim' "Fuzzy file, buffer, mru, tag, etc finder
Plugin 'bogado/file-line' "Open a file in a given line, e.g. vim file:20

" Language related
Plugin 'klen/python-mode' "Helps you to create python code very quickly
Plugin 'davidhalter/jedi-vim' "Python autocompletion with Vim
Plugin 'majutsushi/tagbar' "Displays tags in a window, ordered by scope
Plugin 'mzlogin/vim-markdown-toc' "Generate markdown TOC
" If file type not detected:
" :set ft=ansible
" Or set something like this in ~/.vimrc.local
" au BufRead,BufNewFile */playbooks/*.yaml set filetype=ansible
Plugin 'pearofducks/ansible-vim' "Syntax highlighting Ansible's common filetypes
Plugin 'vim-syntastic/syntastic' "Syntax checking hacks for vim

" Beautify Vim
Plugin 'altercation/vim-colors-solarized' "Precision colorscheme for the vim text editor
Plugin 'vim-airline/vim-airline' "Lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline-themes' "Themes for airline
Plugin 'wincent/terminus' "Better terminal integration

" Git related
Plugin 'tpope/vim-fugitive' "The best Git wrapper of all time
Plugin 'airblade/vim-gitgutter' "shows a git diff in the gutter (sign column)
Plugin 'Xuyuanp/nerdtree-git-plugin' "NERDTree showing git status flags

" Load any custom vundles
silent! source ~/.vimrc.local.vundles

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Solarized theme - set first so it doesn't override other settings
" Loading the solarized colorscheme is silent to prevent error on install
silent! colorscheme solarized
set background=dark
" This expects that your console is running with 16 colour Solarized palette, so
" if everything is too bright and high contrast, then uncomment the next 2 lines
"set term=screen-256color
"let g:solarized_termcolors=256

" Vim general settings
syntax enable
set nowrap
set formatoptions-=t " Don't auto wrap!
set incsearch
set hlsearch
" Default to 4 space tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
"set textwidth=79
set cul " Set horizontal bar (line) in cursor crosshairs
set colorcolumn=81 " 80 characters limit
highlight ColorColumn ctermbg=Black ctermfg=DarkRed
set spell spelllang=en_au
set spell
nnoremap zn ]s
nnoremap zp [s
nnoremap zz :setlocal spell! spell?<CR>

" Hide buffers instead of closing them
set hidden

" Show tabs and trailing spaces (large black square U+2B1B)
set listchars=tab:»·,trail:·
set list

" If you're running OSX and backspace doesn't behave correctly uncomment this
" following line
"set backspace=indent,eol,start
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Font Hack as the default font
" This only affects graphical vim
set guifont=Hack\ 9
set laststatus=2

" Shortcuts for switching buffers
nnoremap <C-b> :buffers<CR>:buffer<Space>
nnoremap bn :bnext<CR>
nnoremap bp :bprevious<CR>
nnoremap bc :bdelete<CR>
nnoremap bC :bdelete!<CR>
" Shortcuts for switching tabs
nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>

" Terminus setup
let g:TerminusFocusReporting=0

" ctrlp setup
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-x>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

let g:ctrlp_cmd = 'CtrlPMRU'

" Tagbar setup
" NOTE: you need ctags installed
nmap <F9> :TagbarToggle<CR>
" (Optional) If you are on OSX or have ctags (non-BSD) installed somewhere else not in
" your path, use to following line to point to it.
"let g:tagbar_ctags_bin="/usr/local/Cellar/ctags/5.8_1/bin/ctags"

" Nerdtree setup
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Ansible setup
" Treat all .yml files as ansible, cause they probably are
au BufRead,BufNewFile *.{yaml,yml} set filetype=ansible

" Syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8', 'pyflakes', 'pylint']

" Airline Setup
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Separators can be configured independently for the tabline
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1

" Language specific settings
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python set tabstop=4
    autocmd FileType python set softtabstop=4
    autocmd FileType python set shiftwidth=4
    autocmd FileType python set expandtab
    autocmd FileType yaml set tabstop=2
    autocmd FileType yaml set softtabstop=2
    autocmd FileType yaml set shiftwidth=2
    autocmd FileType yaml set expandtab
augroup END

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
" The old location for the file
silent! source ~/.vimrc_overrides
" New location
silent! source ~/.vimrc.local
" Disable any plugins
silent! source ~/.vimrc.local.vundles.disable

" Vim cheats
" {visual}gq % format the visually selected area
" gqq        % format the current line
" gg=G       % format whole file
