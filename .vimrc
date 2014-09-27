execute pathogen#infect()
 
" Sets the colorscheme 
colorscheme solarized

" Enables syntax processing
syntax enable

" Number of visual spaces per TAB
set tabstop=4
" Number of spaces in tab when editing
set softtabstop=4
" Tabs are spaces
set expandtab
" Sets shiftwidth
set shiftwidth=4

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
nnoremap <leader>h :nohlsearch<CR>

" Enable folding
set foldenable
" Open most folds by default
set foldlevelstart=10
" Set max number of nested folds
set foldnestmax=10
" Space open/closes folds
nnoremap <space> za
" Fold based on ident level
set foldmethod=manual

" Move veritcally by visual line as opposed to physical line
nnoremap j gj
nnoremap k gk


" Leader Keybinds
" Leader is rebound to comma
let mapleader=","
" fd is escape
inoremap fd <esc>

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
nnoremap <leader>t :NERDTree<CR>


" Fixes backup stuff, moves backups to new directory
set backup
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup


""" PLUGIN SETTINGS
" Any keymapping for plugins that use the leader are with the rest of the leader keybinds

" CtrlP settings 
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -1 --nocolor --hidden -g ""'
let g:ctrlp_user_command = 'ag %s -1 --nocolor -g ""'


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
