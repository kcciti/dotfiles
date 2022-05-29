-- vim.cmd [[
-- try
--   colorscheme onehalfdark 
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]]

-- hack to setup colorscheme for onehalf as it's setup weird
vim.cmd [[ source ~/.local/share/nvim/site/pack/packer/start/onehalf/vim/colors/onehalfdark.vim ]]
