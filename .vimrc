""" VIM Core configurations

"Syntax highlighting
syntax on

"Tabs appear as 4 spaces
set tabstop=4

"Expand tabs into 4 spaces
set expandtab

"Shifting will do 4 spaces
set shiftwidth=4

"Highlight search terms
set hlsearch

"Highlight as we type in search-word
set incsearch

"Paste in clipboard with whitespaces intelligently
set paste

"Change menu color to something nicer looking
:highlight Pmenu ctermbg=blue

"Map <C-L> to turning off search highlighting
noremap <silent> <C-L> :nohl <CR>

"Highlight search color
"hi Search ctermbg=LightBlue"

"Turn off line-wrapping
"set nowrap

""" VIM Plugin configurations
execute pathogen#infect()

" Enable auto-indent
filetype plugin indent on

"Enable Ctrl-P (Fuzzy File-Finder)
set runtimepath^=~/.vim/bundle/ctrlp/ctrlp.vim

"Ctrl-P Bindings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"Map NERDTree and Tagbar to function toggle switches
nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <F3> :TagbarToggle<CR>

"MiniBufExplorer Window Key Mappings Enabled
"let g:miniBufExplMapWindowNavVim = 1 
"let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplMapCTabSwitchBufs = 1 
"let g:miniBufExplModSelTarget = 1
