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
