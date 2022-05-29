vim.opt.fillchars       = "fold: "  
vim.wo.foldmethod   = "expr"  
vim.opt.foldlevel       = 99  
vim.o.foldtext      = [[ substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
