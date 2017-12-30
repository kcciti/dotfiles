set wrap
set textwidth=0 wrapmargin=0

" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=2

" show a visual line under the cursor's current line
" set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

execute pathogen#infect()

let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_no_remapping = 1

let g:slime_default_config = {"socket_name":split($TMUX, ",")[0], "target_pane": ":.1"}
xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>s <Plug>SlimeParagraphSend

" let g:solarized_template=256
set t_Co=16
set background=dark
colorscheme solarized

nmap r <C-r>
nmap I <C-d>
nmap U <C-u>
nmap 4 $

" simply edit test
