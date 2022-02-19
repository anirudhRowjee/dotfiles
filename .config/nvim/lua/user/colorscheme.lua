
vim.g.neon_style = "dark"
vim.g.neon_italic_keyword = true
vim.g.neon_italic_boolean = false
vim.g.neon_italic_function = true
vim.g.neon_italic_variable = false

-- vim.g.neon_transparent = true
vim.g.neon_italic_comment = true
vim.opt.background = "dark"

-- Gruvbox Config
vim.g.gruvbox_italic = '1'
vim.g.gruvbox_underline = '1'
vim.g.gruvbox_undercurl = '1'
vim.g.gruvbox_contrast_dark =  'hard'
vim.g.gruvbox_contrast_light =  'soft'
vim.g.gruvbox_italicize_comments = '1'
vim.g.gruvbox_italicize_strings = '1'
vim.g.gruvbox_invert_tabline = '1'
vim.g.gruvbox_invert_selection = '1'
vim.g.gruvbox_improved_warnings = '1'

-- some additional nice-to-haves
vim.cmd [[

    set termguicolors

    " Gruvbox Theme
    let g:gruvbox_bold='1'
    " let g:gruvbox_termcolors=256
    let g:gruvbox_italic='1'
    let g:gruvbox_underline='1'
    let g:gruvbox_undercurl='1'
    let g:gruvbox_contrast_dark= 'hard'
    let g:gruvbox_contrast_light= 'soft'
    let g:gruvbox_italicize_comments='1'
    let g:gruvbox_italicize_strings='1'
    let g:gruvbox_invert_tabline='1'
    let g:gruvbox_invert_selection='1'
    let g:gruvbox_improved_warnings='1'
    colorscheme neon
    highlight clear SignColumn

    hi Visual cterm=NONE ctermbg=242 gui=NONE guibg=#1F3546
    hi Normal guibg=NONE

]]
