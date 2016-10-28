"Reminder on Folds
"zR to open all folds
"zM to close all folds
"zo to open specific fold
"zc to close specific fold
" Fold Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" Plugins {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

"Look-and-feel
Plug 'altercation/vim-colors-solarized'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Navigation
Plug 'haya14busa/incsearch.vim'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'gioele/vim-autoswap'
Plug 'CharlesPatterson/vim-autoswap' 
Plug 'Lokaltog/vim-easymotion'

"Code Completion/Generation
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

"Code Editing
Plug 'godlygeek/tabular'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'

"Miscellaneous
Plug 'tpope/vim-unimpaired'

"Python-specific
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

"Javascript-specific
Plug 'kchmck/vim-coffee-script'
Plug 'moll/vim-node'

"Potential, but not integrated yet 
Plug 'benekastah/neomake'
Plug 'jiangmiao/auto-pairs'
Plug 'sjl/gundo.vim'
Plug 'svermeulen/vim-easyclip'

call plug#end()
" }}}

" Core Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number
set backspace=2
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
set paste
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

"Map Leader key to ' ' 
let mapleader = ","

"Add persistent undo-file
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" }}}

" Autocmds {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Default autoindent for various web languages
augroup autoindent_group
    autocmd!
    autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
augroup END

" Don't syntax highlight markdown because it's often wrong
augroup markdown_syntax_group
    autocmd! FileType mkd setlocal syn=off
augroup END

" Jump to last cursor position from opening file
augroup last_cursor_position_group
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END

"}}}

" Key Mappings {{{
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

" Edit .vimrc in a vertical split
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

"Map NERDTree and Tagbar to function toggle switches
nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <F3> :TagbarToggle<CR>
nnoremap <F5> :GundoToggle<CR>

" }}}

" Look-and-Feel Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=Monaco:h18
let macvim_skip_colorscheme=1
set background=dark
colorscheme solarized
syntax on

"Change menu color to something nicer looking
:highlight Pmenu ctermbg=blue

"Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme                      = 'solarized'

"NerdTree Settings
let g:NERDTreeWinSize    = 60

" Better Rainbow Parentheses Settings 
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" }}}

" Plugin Specific Configuration {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Ctrl-P Bindings
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'

"Enable Ctrl-P (Fuzzy File-Finder)
set runtimepath^=~/.vim/bundle/ctrlp/ctrlp.vim

" Sane Ignore For Ctrl-P
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

" }}}

" Snippets Plugin Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger                       = "<tab>"
let g:UltiSnipsJumpForwardTrigger                  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger                 = "<S-Tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit                           = "vertical"
let g:UltiSnipsSnippetsDir                         = '~/.vim/my-snippets/'
let g:UltiSnipsSnippetDirectories                  = ['UltiSnips', 'my-snippets']

" }}}

" IncSearch Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Main functionality
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Automatic :nohlsearch
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Be able to tab through search results
map <Tab> <Over>(incsearch-next)
map <S-Tab> <Over>(incsearch-prev)

" Scroll-like feature while incremental searching
map <C-j> <Over>(incsearch-scroll-f)
map <C-k> <Over>(incsearch-scroll-b)

" }}}
