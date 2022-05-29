lua require('plugins')

" 
" " enable syntax highlighting
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

filetype on

" execute pathogen#infect()
" execute pathogen#helptags()


filetype plugin indent on
syntax on

"  set mouse=a

" let g:solarized_template=256
" set t_Co=256
" set background=dark
"  colorscheme solarized 
" colorscheme molokai
colorscheme onehalfdark
" highlight Comment cterm=bold

" vim-Autopep8 customizations
" let g:autopep8_ignore="E302,E301"
" let g:autopep8_aggressive=2
" let g:autopep8_disable_show_diff= 1
let g:autopepep8_max_line_length=1000
autocmd FileType python map <buffer> <leader>8 :Autopep8<CR>
autocmd FileType python map <buffer> <leader>0 :call flake8#Flake8()<CR>

" autocmd FileType python map <buffer> <leader>f :call Autopep8()<CR>
" autocmd FileType julia setlocal foldmethod=syntax tabstop=4 shiftwidth=4

" remap help files to quit with q
autocmd FileType help noremap <buffer> q :q<cr>

" set paste

" let g:slime_target = "vimterminal"
let g:slime_target = "neovim"
let g:slime_paste_file = "$HOME/.slime_paste"
" let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

xmap <C-c>c <Plug>SlimeRegionSend
nmap <C-c><C-c> <Plug>SlimeLineSend
nmap <C-c>c <Plug>SlimeParagraphSend

let mapleader = "`"
nnoremap <leader> <C-w>
noremap <leader>s :vsplit<CR>
noremap <leader>v :split<CR>
noremap <leader>t :vsplit term://zsh<CR> <bar> :wincmd r<CR> <bar> :split term://zsh<CR> <bar> :15 wincmd +<CR> <bar> :wincmd h<CR>

tnoremap `h <C-\><C-n> <bar> :wincmd h<CR>
tnoremap `k <C-\><C-n> <bar> :wincmd k<CR>
tnoremap `j <C-\><C-n> <bar> :wincmd j<CR>
tnoremap `l <C-\><C-n> <bar> :wincmd l<CR>
set encoding=UTF-8
" set guifont=Monospace\ Regular\ 13
set guifont= "FiraMono Nerd Font Mono 11"
" set guifont=ShureTechMono\ Nerd\ Font\ Mono\ 14



nnoremap <leader>n :NERDTreeToggle<CR>

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreGitStatusUseNerdFonts = 0 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeFileExtensionHighlightFullName = 1

let g:ctrlp_cmd='CtrlPMRU'

set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()

 
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
 
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" vim-airline

let g:airline_powerline_fonts = 1

" let ttimeoutlen=50
let g:airline_theme = 'onehalfdark'
" let g:airline#extensions#hunks#enabled=0
" let g:airline#extensions#branch#enabled=1

" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"
nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b3<CR>
nnoremap <leader>5 :b5<CR>
nnoremap <leader>6 :b6<CR>
nnoremap <leader>7 :b7<CR>
nnoremap <leader>8 :b8<CR>
nnoremap <leader>9 :b9<CR>



lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ensure_installed = "maintained",
  ensure_installed = "python",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert



