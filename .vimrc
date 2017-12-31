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
let g:pymode = 1
let g:pymode_python = 'python3'
let g:pymode_lint_ignore = ["E302", "E501","E301", "E305"]
let g:pymode_lint_checkers = ['pep8']
let g:pymode_options_max_line_length = 75
set wrap

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
nmap z za 
nmap <leader>f :PymodeLintAuto<CR>
" remap help files to quit with q
autocmd FileType help noremap <buffer> q :q<cr>

"renamp Tab key to smart complete but tab at beginning of the line
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction
inoremap <tab> <c-r>=Smart_TabComplete()<CR>
