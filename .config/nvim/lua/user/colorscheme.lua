
-- vim.g.neon_style = "dark"
-- vim.g.neon_italic_keyword = true
-- vim.g.neon_italic_boolean = false
-- vim.g.neon_italic_function = true
-- vim.g.neon_italic_variable = false

-- vim.g.neon_transparent = true
-- vim.g.neon_italic_comment = true
-- vim.opt.background = "dark"

-- Gruvbox Config
-- vim.g.gruvbox_italic = '1' 
-- vim.g.gruvbox_underline = '1'
-- vim.g.gruvbox_undercurl = '1'
-- vim.g.gruvbox_contrast_dark =  'hard'
-- vim.g.gruvbox_contrast_light =  'soft'
-- vim.g.gruvbox_italicize_comments = '1'
-- vim.g.gruvbox_italicize_strings = '1'
-- vim.g.gruvbox_invert_tabline = '1'
-- vim.g.gruvbox_invert_selection = '1'
-- vim.g.gruvbox_improved_warnings = '1'


-- Example config in Lua
require("onedark").setup({

  comment_style="italic",
  function_style = "italic",
  dark_float = true,
  dark_sidebar = true,
  highlight_linenumber = true,
  -- transparent = true,
  -- transparent_sidebar = true,

  sidebars = {"qf", "vista_kind", "terminal", "packer"},

  -- Change the "hint" color to the "orange0" color, and make the "error" color bright red
  colors = {
        hint = "orange0",
        error = "#ff0000",
        bg0 = "#010409",
        bg1 = "#010409",
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

vim.cmd [[
    hi clear SignColumn
    hi clear LineNr
]]
