" based on Gary Gernhardt's excellent .vimrc (https://github.com/garybernhardt/dotfiles/blob/master/.vimrc)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vundle configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'majutsushi/tagbar.git'
Plugin 'SirVer/ultisnips.git'
Plugin 'tpope/vim-abolish.git'
Plugin 'kchmck/vim-coffee-script.git'
Plugin 'honza/vim-snippets.git'
Plugin 'tpope/vim-surround.git'

call vundle#end()            " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" VIM Core configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" execute pathogen#infect()
set nowrap
set nocompatible
set hidden
set history=10000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
"set paste
set ignorecase smartcase
set cursorline
set t_ti= t_te=
set scrolloff=3
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set showcmd
set wildmenu
set wildmode=list:longest,full
set completeopt+=longest
set autoread
set timeout timeoutlen=1000 ttimeoutlen=100
filetype plugin indent on
syntax on

"Change menu color to something nicer looking
:highlight Pmenu ctermbg=blue

"Map Leader key to ' ' 
let mapleader = "\<Space>"

"Add persistent undo-file
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugin Specific Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Ctrl-P Bindings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"Enable Ctrl-P (Fuzzy File-Finder)
set runtimepath^=~/.vim/bundle/ctrlp/ctrlp.vim

"Map NERDTree and Tagbar to function toggle switches
nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <F3> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Custom Autocmds
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Default autoindent for various web languages
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et

" Don't syntax highlight markdown because it's often wrong
autocmd! FileType mkd setlocal syn=off

" Jump to last cursor position from opening file
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Autocomplete for ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Miscellaneous Key Maps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Map <C-L> to turning off search highlighting
noremap <silent> <C-L> :nohl <CR>

" Easier split navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <Leader>' i''<ESC>
nnoremap <Leader>" i""<ESC>
nnoremap <Leader>( i()<ESC>
nnoremap <Leader>{ i{}<ESC>

" Allow me to save to a file with sudo if needed
cmap w!! w !sudo tee % >/dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Miscellaneous Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ragtag_global_maps = 1
let g:NERDTreeWinSize = 60 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Snippets Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir        = '~/.vim/my-snippets/'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'my-snippets']
