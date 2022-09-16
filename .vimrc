set nocompatible

" VimPlug
"
" let $GIT_SSL_NO_VERIFY = 'true'

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'jpalardy/vim-slime'
" Plug 'julialang/julia-vim', { 'for': 'Julia' } 
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' 
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'prabirshrestha/asyncomplete.vim' | Plug 'prabirshrestha/vim-lsp' | Plug 'prabirshrestha/asyncomplete-lsp.vim'| Plug 'mattn/vim-lsp-settings' | Plug 'machakann/vim-lsp-julia'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' | Plug 'tpope/vim-fugitive' 
Plug 'tpope/vim-markdown'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'flazz/vim-colorschemes' 
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for':['markdown', 'vim-plug']}
Plug 'nvie/vim-flake8'
Plug 'tell-k/vim-autopep8'
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" Plug 'puremourning/vimspector'
" Plug 'sagi-z/vimspectorpy', { 'do': { -> vimspectorpy#update() } }
" Initialize plugin system
call plug#end()


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

filetype on

" execute pathogen#infect()
" execute pathogen#helptags()


filetype plugin indent on
syntax on

set mouse=a

" let g:solarized_template=256
" set t_Co=256
" set background=dark
"  colorscheme solarized 
colorscheme molokai
highlight Comment cterm=bold

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

let g:slime_target = "vimterminal"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

xmap <C-c>c <Plug>SlimeRegionSend
nmap <C-c><C-c> <Plug>SlimeLineSend
nmap <C-c>c <Plug>SlimeParagraphSend

nnoremap q <Nop>
inoremap qq <ESC>
let mapleader = "q"
nnoremap <leader> <C-w>
noremap <leader>s :vsplit<CR>
" noremap qqs :vsplit<CR>
noremap <leader>v :split<CR>
noremap <leader>t :vert term zsh<CR>

tnoremap ` <C-w>

set encoding=UTF-8
" set guifont=Monospace\ Regular\ 13
" set guifont= Fira\ Nerd\ Font\ 11
set guifont=ShureTechMono\ Nerd\ Font\ Mono\ 14



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
let g:NERDTreeGitStatusUseNerdFonts = 0 " you should install nerdfonts by yourself. default: 0
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
let g:airline_theme = 'deus'
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
