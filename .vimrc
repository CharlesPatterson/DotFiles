"Reminder on Folds
"zR to open all folds
"zM to close all folds
"zo to open specific fold
"zc to close specific fold

" Plugins {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

"Look-and-feel
Plug 'joshdick/onedark.vim'                                     "One Dark theme
"Plug 'altercation/vim-colors-solarized'                         "Solarized theme
Plug 'airblade/vim-gitgutter'                                   "]c [c navigate chunks, show git symbols in the left-hand gutter
Plug 'kien/rainbow_parentheses.vim'                             "Color parentheses different colors (especially for LISP)
Plug 'vim-airline/vim-airline'                                  "Use airline gutter at bottom
Plug 'vim-airline/vim-airline-themes'                           "Bring in airline themes
Plug 'Yggdroot/indentLine'                                      "Add indentation guidelines

"Navigation
Plug 'haya14busa/incsearch.vim'                                 "Incremental highlighting of searches
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                                         "Space-Space does fuzzy-file-finder
Plug 'majutsushi/tagbar'                                        "F3 gives you outline of a code file
Plug 'rhysd/clever-f.vim'                                       "Repeating f or F will move to next matches
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }          "F2 gives you the filesystem hierarchy
Plug 'mhinz/vim-grepper'                                        "Do rg across the current directory hierarchy
Plug 'tpope/vim-unimpaired'                                     "[b ]b move between buffers
Plug 'vim-scripts/matchit.zip'                                  "% will match HTML tags better
"Plug 'gioele/vim-autoswap'                                     "Deal with swapfiles seamlessly
Plug 'CharlesPatterson/vim-autoswap'                            "TODO: My fork of above to allow for use in iTerm2
Plug 'Lokaltog/vim-easymotion'                                  "<Leader>s-KEY searches for the key
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }  "Show git indicators in NERDTree

"Code Completion/Generation
Plug 'ervandew/supertab'                                        "Use tab for all auto-completion
Plug 'honza/vim-snippets'                                       "Bring in common snippets for various languages
Plug 'SirVer/ultisnips'                                         "Enable snippets available with tab-completion
Plug 'Valloric/YouCompleteMe'                                   "Code completion engine (shows potential matches, choose with Tab)

"Code Editing
Plug 'godlygeek/tabular'                                        ":Tab /= Align text by equals sign
Plug 'jiangmiao/auto-pairs'                                     "Insert/delete brackets, parens, quotes in pairs
Plug 'junegunn/vim-emoji'                                       "Type emojis with :-prefix, auto-complete with C-X, C-U, visually select and replace with actual emoji with C-B
Plug 'mattn/emmet-vim'                                          "<C-Y>, expands emmet abbreviations
Plug 'svermeulen/vim-easyclip'                                  "<C-N> and <C-P> for yank
Plug 'terryma/vim-multiple-cursors'                             "Multiple cursors like sublimetext
Plug 'tpope/vim-abolish'                                        "<S-S> handles more-complex case-varying substitutions 
Plug 'tpope/vim-commentary'                                     "gcc does intelligent commenting in most code files
Plug 'tpope/vim-jdaddy'                                         "TODO: JSON file bindings including pretty-print
Plug 'tpope/vim-repeat'                                         "Repeat now works for plugin commands
Plug 'tpope/vim-speeddating'                                    "<C-A> and <C-X> increment/decrement dates
Plug 'tpope/vim-surround'                                       "cs-delimiter/ci-delimiter allows you to change the surrounding elements or their interior
Plug 'w0rp/ale'                                                 "async linting

"Javascript-specific
Plug 'moll/vim-node'                                            "gf on require statements in node files goes to actual file
Plug 'mxw/vim-jsx'                                              "Handle JSX formatting / code-highlighting properly

"In-Use, but should be studied more
Plug 'sjl/gundo.vim'                                            "F5 gives you a graphical view of your undos
Plug 'tmux-plugins/vim-tmux-focus-events'                       "TODO: Supposed to handle automatic reload of files
Plug 'alvan/vim-closetag'                                       "Enable autoclosing of html/jsx tags

call plug#end()
" }}}

" Core Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set mouse=a                                         " TODO
set nocompatible                                    " Ignored by nvim
set number                                          " Show line-numbers
set backspace=2                                     " Make backspace work like most other apps
set nowrap                                          " No line-wrapping
set hidden                                          " Hide buffers instead of closing them, when you open a new buffer
set history=10000                                   " Remember N commands
set expandtab                                       " Turn tab into spaces
set tabstop=4                                       " Number of visual spaces per TAB
set shiftwidth=4                                    " >> == N spaces
set softtabstop=4                                   " Number of spaces per TAB when editing
set autoindent                                      " Turns on autoindent
set laststatus=2                                    " Show status line always
set showmatch                                       " Show matching '(' and '{'
set incsearch                                       " Enables incremental search
set hlsearch                                        " Highlight all search pattern matches
" set paste                                         " Turn off auto-indent for pasting
set ignorecase smartcase                            " Only do a case-sensitive search if there's a capital letter in your search pattern
set cursorline                                      " Highlight your cursor's line
set t_ti= t_te=                                     " ?
set scrolloff=3                                     " Always leave 3 lines above your cursor after doing a z-enter
set backup                                          " Turns on backups of files
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp " Backup files go here
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp " Swap files go here
set showcmd                                         " Show the command you're typing
set wildmenu                                        " Visual autocomplete for command menu
set wildmode=list:longest,full                      " ?
set lazyredraw                                      " Redraw only when necessary
set completeopt+=longest                            " Insert longest common text of all matches of auto-complete
set autoread                                        " Re-read file if it was changed outside of vim
set timeout timeoutlen=1000 ttimeoutlen=100         " ?
filetype plugin indent on                           " ?
let mapleader = " "                                 " Use spacebar for leader key
set undofile                                        " Save your undo history upon closing VIM
set undodir=~/.vim/undodir                          " Store the undo files in this directory
set undolevels=1000                                 " Maximum number of changes that can be undone
set undoreload=10000                                " Maximum number lines to save for undo on a buffer reload

" }}}

" Autocmds {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use folds in this file
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

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

"EasyMotion Settings 
let g:EasyMotion_do_mapping  = 0 " Disable default mappings
let g:EasyMotion_smartcase   = 1
let g:EasyMotion_startofline = 0

nmap s <Plug>(easymotion-overwin-f)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" Allow me to save to a file with sudo if needed
cmap w!! w !sudo tee % >/dev/null

" Edit .vimrc/.zshrc in a vertical split
:nnoremap <leader>ez :vsplit ~/.zshrc<cr>
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

"Map NERDTree, Gundo, and Tagbar to function toggle switches
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :TagbarToggle<CR>
nnoremap <F5> :GundoToggle<CR>

"Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

"Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)"

" }}}

" Look-and-Feel Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:onedark_termcolors = 16
"colorscheme solarized
colorscheme onedark
set guifont=Monaco:h18
"let macvim_skip_colorscheme=1
set background=dark
syntax on

"Change menu color to something nicer looking
"highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
highlight Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray

"Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme                      = 'onedark'
set noshowmode

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

"YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let ycm_min_num_of_chars_for_completion = 2
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

function! Multiple_cursors_before()
  let s:old_ycm_whitelist = g:ycm_filetype_whitelist
  let g:ycm_filetype_whitelist = {}
endfunction

function! Multiple_cursors_after()
  let g:ycm_filetype_whitelist = s:old_ycm_whitelist
endfunction

" }}}

" Snippets Plugin Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

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

" EasyClip Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyClipShareYanks = 1
let g:EasyClipUsePasteToggleDefaults = 0
let g:EasyClipEnableBlackHoleRedirect = 0

nmap <C-P> <plug>EasyClipSwapPasteForward
nmap <C-N> <plug>EasyClipSwapPasteBackwards

" }}}

" fzf Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader><space> :Files<CR>

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" }}}

" ALE Linter Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\}
let g:ale_fix_on_save = 1

" }}}

" Auto-Closetag Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.js"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb,*.js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" }}}

" Emoji-Vim Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CompletionChain(findstart, base)
  if a:findstart
    " Test against the functions one by one
    for func in g:user_completion_chain
      let pos = call(func, [a:findstart, a:base])
      " If a function can complete the prefix,
      " remember the name and return the result from the function
      if pos >= 0
        let s:current_completion = func
        return pos
      endif
    endfor

    " No completion can be done
    unlet! s:current_completion
    return -1
  elseif exists('s:current_completion')
    " Simply pass the arguments to the selected function
    return call(s:current_completion, [a:findstart, a:base])
  else
    return []
  endif
endfunction

let g:user_completion_chain = ['emoji#complete', 'youcompleteme#complete']
set completefunc=CompletionChain

vnoremap <C-B> :s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g <CR>

" }}}

" Vim-Grepper Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:grepper = {}
runtime autoload/grepper.vim
let g:grepper.jump = 1
let g:grepper.stop = 500
noremap <leader>gr :GrepperRg<Space>

"Close buffers easier
nnoremap <C-D> :bd<CR>

" }}}

" Multiple Cursors Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-k>'
let g:multi_cursor_select_all_word_key = '<A-k>'
let g:multi_cursor_start_key           = 'g<C-k>'
let g:multi_cursor_select_all_key      = 'g<A-k>'
let g:multi_cursor_next_key            = '<C-k>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" }}}
