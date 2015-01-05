set nocompatible
filetype off

" Set runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'
" Emmet
Plugin 'mattn/emmet-vim'
" neocomplete.vim
Plugin 'Shougo/neocomplete.vim'
" Solarized
Plugin 'altercation/vim-colors-solarized'
" CtrlP
Plugin 'kien/ctrlp.vim'
" Gundo
Plugin 'sjl/gundo.vim'
" NERDTree
Plugin 'scrooloose/nerdtree'
" Surround.vim
Plugin 'tpope/vim-surround'
" rails.vim
Plugin 'tpope/vim-rails'
" vim-airline
Plugin 'bling/vim-airline'
" vim-fugitive
Plugin 'tpope/vim-fugitive'
" vim-autocomplete
Plugin 'Townk/vim-autoclose'
" sass, haml, scss runtimes
Plugin 'tpope/vim-haml'
" sass highlighting
Plugin 'cakebaker/scss-syntax.vim'
" HTML autocompletion
Plugin 'othree/html5.vim'
" Rspec syntax highlighting
Plugin 'Keithbsmiley/rspec.vim'

call vundle#end()

set background=dark
" Sets the colorscheme 
colorscheme solarized 

" Displays line numbers
set number
" Highlights the current line
set cursorline
" Load filetype specific indent files
filetype plugin indent on

" Enables syntax processing
syntax enable

" Visual autocomplete for command menu
set wildmenu
" Only redraw when necessary
set lazyredraw
" Highlight matching [{()}]
set showmatch

set guioptions+=LlRrbTmt
set guioptions-=LlRrbTmt

" Number of visual spaces per TAB
set tabstop=4
" Number of spaces in tab when editing
set softtabstop=4
" Tabs are spaces
set expandtab
" Sets shiftwidth
set shiftwidth=4

" Prevents beeping or flashing on error
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
" Prevents auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Highlight matches
set hlsearch
" Turn off search highlight to ,h
nnoremap <leader>h :nohlsearch<CR>

" Move veritcally by visual line as opposed to physical line
nnoremap j gj
nnoremap k gk


" Leader Keybinds
" Leader is rebound to comma
let mapleader=","
" fd is escape
inoremap fd <esc>

" Switching windows
map <leader>w <C-W>W

" Toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" Edit vimrc/zshrc and source vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>srcv :source $MYVIMRC<CR>

" Save session
nnoremap <leader>s :mksession<CR>

" Opens ag.vim
nnoremap <leader>a :Ag
" Opens NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>

" Fixes backup stuff, moves backups to new directory
set backup
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Filetype preferences

augroup configgroup
autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    "autocmd FileType ruby setlocal shiftwidth=2
    "autocmd FileType ruby setlocal softtabstop=2
    "autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd Filetype ruby setlocal sts=2 sw=2 expandtab
    autocmd FileType eruby setlocal sts=2 sw=2 expandtab 
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

""" PLUGIN SETTINGS
" Any keymapping for plugins that use the leader are with the rest of the leader keybinds

" NeoComplete settings
" Enable neocomplete at startup
let g:neocomplete#enable_at_startup = 1
" Use neocomplete smartcase
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Tab completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"


" Gundo settings
let g:gundo_width = 30
let g:gundo_preview_height = 10

" Emmet settings
