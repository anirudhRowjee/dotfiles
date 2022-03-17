
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


-- Example config in Lua
require("onedark").setup({

  comment_style="italic",
  function_style = "italic",
  dark_float = true,
  highlight_linenumber = true,

  sidebars = {"qf", "vista_kind", "terminal", "packer"},

  -- Change the "hint" color to the "orange0" color, and make the "error" color bright red
  colors = {
        hint = "orange0",
        error = "#ff0000",
        bg0 = "#0D1117",
        -- bg1 = "#0D1117",
        -- fg0 = "#0D1117",
        -- bg1 = "#0D1117",
    },

  -- Overwrite the highlight groups
  overrides = function(c)
    return {
      htmlTag = {fg = c.red0, bg = "#282c34", sp = c.hint, style = "underline"},
      DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
      -- this will remove the highlight groups
      TSField = {},
    }
  end
})

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
    let g:onedark_termcolors=256

    " OneDark Config
    " let g:onedark_highlight_linenumber = '1'
    " let g:onedark_hide_inactive_statusline = '1'
    " let g:onedark_lualine_bold = '1'
    " let g:onedark_transparent = '1'
    " let g:onedark_transparent_sidebars = '1'

    colorscheme onedark
    " highlight clear SignColumn


    " hi Visual cterm=NONE ctermbg=242 gui=NONE guibg=#1F3546
    " hi Normal guibg=NONE
    hi clear LineNr

    " colo zhi

    " onedark.vim override: Don't set a background color when running in a terminal;
    " just use the terminal's background color
    " `gui` is the hex color code used in GUI mode/nvim true-color mode
    " `cterm` is the color code used in 256-color mode
    " `cterm16` is the color code used in 16-color mode
    if (has("autocmd") && !has("gui_running"))
    augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
    augroup END
    endif
]]

