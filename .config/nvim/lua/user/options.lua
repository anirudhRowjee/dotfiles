local options = {
    swapfile = false,
    wrap = true,
    linebreak = true,
    encoding = "UTF-8",
    number = true,
    relativenumber = true,
    ruler = true,
    list = true,
    smarttab = true,
    expandtab = true,
    ts = 4,
    shiftwidth = 4,
    ttyfast = true,
    clipboard = "unnamedplus",
    splitbelow = true,
    splitright = true,
    autoindent = true,
    showmatch = true,
    expandtab = true,
    foldlevel = 99,
    hlsearch = true,
    incsearch = true,
    hidden = true,
    updatetime = 200,
    cursorline = true,
    signcolumn = "yes",
    completeopt = {"menuone", "noselect"},
    foldmethod = "expr",
    foldexpr = "nvim_treesitter#foldexpr()",
    ttimeoutlen = 5,
    wildmenu = true,
}

vim.opt.shortmess:append "c"
vim.opt.path:append "**"

for k,v in pairs(options) do
    vim.opt[k] = v
end
