" Vundle configuration {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin 'airblade/vim-gitgutter.git'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'SirVer/ultisnips.git'
Plugin 'VundleVim/Vundle.vim'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'bling/vim-airline.git'
Plugin 'blinks/vim-antlr.git'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab.git'
Plugin 'gioele/vim-autoswap.git'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'godlygeek/tabular.git'
Plugin 'haya14busa/incsearch.vim'
Plugin 'honza/vim-snippets.git'
Plugin 'kchmck/vim-coffee-script.git'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'majutsushi/tagbar.git'
Plugin 'moll/vim-node'
Plugin 'scrooloose/nerdtree.git'
Plugin 'sjl/gundo.vim.git'
Plugin 'svermeulen/vim-easyclip.git'
Plugin 'tpope/vim-abolish.git'
Plugin 'tpope/vim-commentary.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-jdaddy.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-speeddating.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-unimpaired.git'
call vundle#end()            " required
" }}}

" VIM Core configurations {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" execute pathogen#infect()
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
colorscheme solarized

"Change menu color to something nicer looking
:highlight Pmenu ctermbg=blue

"Map Leader key to ' ' 
let mapleader = ","

"Add persistent undo-file
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

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

"Map NERDTree and Tagbar to function toggle switches
nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <F3> :TagbarToggle<CR>

" }}}

" Custom Autocmds {{{
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

" Autocomplete for ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

"}}}

" Miscellaneous Key Maps {{{
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

" }}}

" Miscellaneous Plugin Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ragtag_global_maps = 1
let g:NERDTreeWinSize = 60 

" }}}

" Snippets Plugin Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir        = '~/.vim/my-snippets/'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'my-snippets']

" }}}

" Airline Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'solarized'

" }}}

" EasyClip Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyClipShareYanks = 1
let g:EasyClipUsePasteToggleDefaults = 0
let g:EasyClipEnableBlackHoleRedirect = 0

nmap <C-P> <plug>EasyClipSwapPasteForward
nmap <C-N> <plug>EasyClipSwapPasteBackwards

" }}}

" Gundo Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :GundoToggle<CR>

" }}}

" Better Rainbow Parentheses Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Learn VIM the Hard Way Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Edit .vimrc in a vertical split
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" }}}

" GUI Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=Monaco:h18
let macvim_skip_colorscheme=1
set background=dark
colorscheme solarized

" }}}

" Fold Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" javacomplete2 Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup javacomplete2
    autocmd!
    autocmd FileType java set omnifunc=javacomplete#Complete
augroup END
" }}}
