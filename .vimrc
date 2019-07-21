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
" set shiftwidth=2

" show a visual line under the cursor's current line
" set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

filetype off

execute pathogen#infect()
execute pathogen#helptags()

filetype plugin indent on
syntax on


" pymode settings
" let g:pymode = 0 
" let g:pymode_python = 'python3'
" let g:pymode_lint_ignore = ["E302", "E501","E301", "E305"]
" let g:pymode_lint_checkers = ['pep8']
" let g:pymode_lint_on_write = 0
" let g:pymode_rope = 0

" disable youcompleteme
" let g:loaded_youcompleteme = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_autoclose_preview_window_after_completion = 1

map <leader>d :YcmCompleter GoToDefinition<CR>


" let g:jedi#completions_command = '' " comment to enable jedi

let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_no_remapping = 1
if exists('$TMUX')
        let g:slime_default_config = {"socket_name":split($TMUX, ",")[0], "target_pane": ":.1"}
endif
nmap <leader>s "zyy:SlimeSend1 <C-r>z<CR>
nmap <C-F> :SlimeSendCurrentLine<CR>
imap <C-F> <ESC>:SlimeSendCurrentLine<CR>
xmap <C-F> <Plug>SlimeRegionSend
nmap <C-F><C-F> <Plug>SlimeParagraphSend

" let g:solarized_template=256
set t_Co=16
set background=dark
colorscheme koehler

nmap r <C-r>
nmap I <C-d>
nmap U <C-u>
" nmap z za 
" set noeb vb t_vb=
" nmap <leader>f :PymodeLintAuto<CR>

" vim-Autopep8 customizations
" let g:autopep8_ignore="E302,E301"
let g:autopep8_aggressive=2
let g:autopep8_disable_show_diff= 1
autocmd FileType python map <buffer> <leader>f :call Autopep8()<CR>

" remap help files to quit with q
autocmd FileType help noremap <buffer> q :q<cr>


set paste
