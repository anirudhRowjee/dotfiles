local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- finally, my plugins
return packer.startup(function(use)
  -- My plugins here

  use "wbthomason/packer.nvim"              -- Have packer manage itself

  -- UI and Utility Plugins
  use "nvim-lua/popup.nvim"                 -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"               -- Useful lua functions used by lots of plugins
  use "windwp/nvim-autopairs"               -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"               -- Easily comment stuff

  use { 'tami5/lspsaga.nvim', branch = 'nvim6.0' or 'nvim51' } -- for specific version

  use "kyazdani42/nvim-web-devicons"        -- icons
  use "kyazdani42/nvim-tree.lua"            -- file manager

  use "nvim-lualine/lualine.nvim"           -- line at the bottom
  use "akinsho/bufferline.nvim"             -- line at the top

  use "akinsho/toggleterm.nvim"             -- persistent, multiple terminals in neovim
  use "ahmedkhalf/project.nvim"             -- project manager
  use "lewis6991/impatient.nvim"            -- startup time optimizer
  use "lukas-reineke/indent-blankline.nvim" -- manage how the indent lines look
  use "goolord/alpha-nvim"                  -- start screen
  use "antoinemadec/FixCursorHold.nvim"     -- Performance Optimizations
  use "folke/which-key.nvim"                -- keymap explainer, very neat

  use 'norcalli/nvim-colorizer.lua'         -- actually colors the things you want in color
  use 'kdheepak/lazygit.nvim'

  -- COLORSCHEMES --
  use "rafamadriz/neon"
  use "rebelot/kanagawa.nvim"
  use "ellisonleao/gruvbox.nvim"
  use 'ful1e5/onedark.nvim'
  use 'ingram1107/vim-zhi'
  use 'tanvirtin/monokai.nvim'
  use({
	"catppuccin/nvim",
	as = "catppuccin"
  })

  -- Completion Segment  // not touching this right now
  use "hrsh7th/nvim-cmp"                    -- The completion plugin
  use "hrsh7th/cmp-buffer"                  -- buffer completions
  use "hrsh7th/cmp-path"                    -- path completions
  use "hrsh7th/cmp-cmdline"                 -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"            -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"


  -- window management and maximizer
    use {
        'declancm/windex.nvim',
        config = function() require('windex').setup() end
    }

    use {
        'declancm/cinnamon.nvim',
        config = function() require('cinnamon').setup() end
    }

    use {
        'jedrzejboczar/toggletasks.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'akinsho/toggleterm.nvim',
            'nvim-telescope/telescope.nvim/',
        },
        -- To enable YAML config support
        rocks = 'lyaml',
    }


    -- Workspaces
    use "natecraddock/workspaces.nvim"
    use "natecraddock/sessions.nvim"

  -- snippets
  use "L3MON4D3/LuaSnip"                    --snippet engine
  use "rafamadriz/friendly-snippets"        -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig"               -- enable LSP
  use "williamboman/nvim-lsp-installer"     -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim"        -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim"     -- for formatters and linters
  use "arkav/lualine-lsp-progress"          -- get LSP Status directly in the lualine
  use "folke/trouble.nvim"                  -- neat LSP Diagonostics menu
  use "nvim-lua/lsp_extensions.nvim"                  -- neat LSP Diagonostics menu

  -- Telescope
  use "nvim-telescope/telescope.nvim"       -- floaty floaty
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope-fzf-writer.nvim'
  -- FZF
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",      -- much better highlighting
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring" -- sets the comment string based on file

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "zivyangll/git-blame.vim"
  use "Pocco81/dap-buddy.nvim"

  -- Debugger
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  -- LANGUAGE-SPECIFIC PLUGINS --
  -- JS
  use "pangloss/vim-javascript"
  use "leafgarland/typescript-vim"
  use "peitalin/vim-jsx-typescript"
  use "styled-components/vim-styled-components"
  use "jparise/vim-graphql"
  -- HTML and CSS
  use "mattn/emmet-vim"                     -- Nifty HTML and CSS Completion
  use "hiphish/jinja.vim"                   -- better highlighting for Jinja / Django Templates
  -- Markdown
  use "dhruvasagar/vim-table-mode"          -- Easy Table Operations like you won't believe 
  use "jbyuki/venn.nvim"                    -- cool ASCII diagrams directly
  use 'iamcco/markdown-preview.nvim'

  -- Rust
  use "rust-lang/rust.vim"                  -- this one really cool
  use "simrat39/rust-tools.nvim"            -- even better
  -- Go
  use "fatih/vim-go"                        -- strong defaults for go
  -- flutter
    use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}

  -- nice UI Things
  use "junegunn/goyo.vim"
  use "junegunn/limelight.vim"
  use "rcarriga/nvim-notify"

  -- Miscellaneous
  use "nvim-orgmode/orgmode"
  use "pbrisbin/vim-mkdir"
  -- consider leetcode

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
