execute pathogen#infect()

" Sets the colorscheme NEEDS FIX
colorscheme solarized

" Enables syntax processing
syntax enable

" Number of visual spaces per TAB
set tabstop=4
" Number of spaces in tab when editing
set softtabstop=4
" Tabs are spaces
set expandtab

" Displays line numbers
set number
" Highlights the current line
set cursorline
" Load filetype specific indent files
filetype indent on
" Visual autocomplete for command menu
set wildmenu
" Only redraw when necessary
set lazyredraw
" Highlight matching [{()}]
set showmatch

" Search as characters are entered
set incsearch
" Highlight matches
set hlsearch
" Turn off search highlight to ,space
nnoremap <leader><space> :nohlsearch<CR>

" Move veritcally by visual line as opposed to physical line
nnoremap j gj
nnoremap k gk

" Leader is rebound to comma
let mapleader=","
" fd is escape
inoremap fd <esc>

" PLUGINS TO INSTALL are gundo, silversearcher, ag, ctrlp

" Toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" Edit vimrc/zshrc and source vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Save session
nnoremap <leader>s :mksession<CR>

" Opens ag.vim
nnoremap <leader>a :Ag

" Install CTRLP and come back to this

" Fixes backup stuff, moves backups to new directory
set backup
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
