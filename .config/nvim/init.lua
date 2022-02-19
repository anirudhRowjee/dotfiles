--     ___          _                ____   _          
--    /   |  ____  (_)______  ______/ / /_ ( )_____    
--   / /| | / __ \/ / ___/ / / / __  / __ \|// ___/    
--  / ___ |/ / / / / /  / /_/ / /_/ / / / / (__  )     
-- /_/ _|_/_/_/_/_/_/___\__,_/\__,_/_/ /_/ /____/      
--    / | / / |  / /  _/  |/  /                        
--   /  |/ /| | / // // /|_/ /                         
--  / /|  / | |/ // // /  / /                          
-- /_/_|_/__|___/___/_/ _/_/_                          
--   / ____/___  ____  / __(_)___ _                    
--  / /   / __ \/ __ \/ /_/ / __ `/                    
-- / /___/ /_/ / / / / __/ / /_/ /                     
-- \____/\____/_/ /_/_/ /_/\__, /                      
--                        /____/       
--
-- Anirudh Rowjee's Neovim Configuration
-- Github: AnirudhRowjee (ani.rowjee@gmail.com)


-- start importing smaller sub-config files here.
require "user.options"                      -- base neovim defaults
require "user.keymaps"                      -- base keymaps
require "user.plugins"                      -- all the fun stuff
-- require "user.custom_functions"             -- Dark Machinations
require "user.colorscheme"                  -- colors! woohoo!

-- Plugin-Specific Config
require "user.cmp"                          -- config for completion!
require "user.lsp"                          -- TODO LSP Config 
require "user.statusline"                   -- nice colorful statusline
require "user.treesitter"                   -- Get that sweet syntax highlighting
require "user.autopairs"                    -- no more right bracket
require "user.indentline"                   -- look ma, VSCode!
require "user.telescope"                    -- the new FZF
require "user.whichkey"                     -- never forget your keybindings again!
require "user.gitsigns"                     -- fancy diff
require "user.projects"                     -- Project Management
require "user.alpha"                        -- Launch Screen!
require "user.filetree"                     -- File Explorer
require "user.terminals"                    -- File Explorer
require "user.debuggers"                    -- Debuggers!

require "user.venn"                         -- Fancy Diagrams

-- TODO later

require "user.rust_config"                  -- Setup for Rust!
require "user.orgmode"                      -- Org Mode!

require "user.misc"                         -- Everything Else
