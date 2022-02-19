local status_ok, alpha = pcall(require, "alpha")
local fortune = require("alpha.fortune") 
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    [[_______________________________________________________________________]],
    [[__  ___/__  __/__    |__  __ \__  ____/_  __ \__  __ \_  ____/__  ____/]],
    [[_____ \__  /  __  /| |_  /_/ /_  /_   _  / / /_  /_/ /  / __ __  __/   ]],
    [[____/ /_  /   _  ___ |  _, _/_  __/   / /_/ /_  _, _// /_/ / _  /___   ]],
    [[/____/ /_/    /_/  |_/_/ |_| /_/      \____/ /_/ |_| \____/  /_____/   ]],
    [[                                                                       ]],
}

dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "Anirudh Rowjee"
end

-- thank you, kind stranger
-- https://stackoverflow.com/a/1247394
function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

local function header_rainbow()
    -- access lolcat
    local handle = io.popen("lolcat")
    return os.capture("lolcat ~/scripts/nvim_logo.$ext"):gsub('$ext', 'txt')
end

-- dashboard.section.footer.val = footer()
dashboard.section.footer.val = fortune()

dashboard.section.footer.opts.hl = "Type"
-- dashboard.section.header.opts.hl = "String"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
