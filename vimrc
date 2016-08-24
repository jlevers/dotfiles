set nocompatible
filetype off

" Set runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Sensible defaults
Plugin 'tpope/vim-sensible'
" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
" Solarized
Plugin 'altercation/vim-colors-solarized'
" CtrlP
Plugin 'kien/ctrlp.vim'
" NERDTree
Plugin 'scrooloose/nerdtree'
" Autoclose
Plugin 'Raimondi/delimitMate'
" Surround.vim
Plugin 'tpope/vim-surround'
" Git wrapper
Plugin 'tpope/vim-fugitive'
" sass highlighting
Plugin 'cakebaker/scss-syntax.vim'
" HTML autocompletion
Plugin 'othree/html5.vim'
" Java snippets
Plugin 'Yggdroot/indentLine'
" Javascript
Plugin 'pangloss/vim-javascript'
" Javascript completion
Plugin 'ternjs/tern_for_vim'
" JSON
Plugin 'helino/vim-json'
" Alignment
Plugin 'junegunn/vim-easy-align'

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
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    "autocmd FileType ruby setlocal shiftwidth=2
    "autocmd FileType ruby setlocal softtabstop=2
    "autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd Filetype ruby setlocal sts=2 sw=2 expandtab
    autocmd FileType eruby setlocal sts=2 sw=2 expandtab 
    autocmd FileType scss setlocal sts=2 sw=2 expandtab
    autocmd FileType yml setlocal sts=2 sw=2 expandtab
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

" Tern settings
autocmd FileType javascript setlocal omnifunc=tern#Complete

" vim-easy-align settings

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
