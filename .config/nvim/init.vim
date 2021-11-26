"""""""""
"     ____                  _          _          _   __      _           ____  ______
"    / __ \____ _      __  (_)__  ___ ( )_____   / | / /   __(_)___ ___  / __ \/ ____/
"   / /_/ / __ \ | /| / / / / _ \/ _ \|// ___/  /  |/ / | / / / __ `__ \/ /_/ / /     
"  / _, _/ /_/ / |/ |/ / / /  __/  __/ (__  )  / /|  /| |/ / / / / / / / _, _/ /___   
" /_/ |_|\____/|__/|__/_/ /\___/\___/ /____/  /_/ |_/ |___/_/_/ /_/ /_/_/ |_|\____/   
"                    /___/                                                            
" maintianed by Anirudh Rowjee (gh @AnirudhRowjee)

"" PLUGINS
call plug#begin(stdpath('data') . '/plugged')
" GUI and UI plugins
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf',{ 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'hoob3rt/lualine.nvim'
Plug 'mhinz/vim-signify'
Plug 'devanlooches/better-comments-nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'kyazdani42/nvim-tree.lua'
" IDE Features
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'zivyangll/git-blame.vim'
Plug 'neomake/neomake'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'
Plug 'diepm/vim-rest-console'
" LSP Support 
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'tami5/lspsaga.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'liuchengxu/vista.vim'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'arkav/lualine-lsp-progress'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" framework support
Plug 'mattn/emmet-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'sjl/tslime.vim'
Plug 'tweekmonster/django-plus.vim'
Plug 'fatih/vim-go'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'hiphish/jinja.vim'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'sbdchd/neoformat'
" Rust
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'
" Leetcode, because why not
Plug 'ianding1/leetcode.vim'
" colors
Plug 'rafamadriz/neon'
Plug 'RRethy/nvim-base16'
" Plug 'mangeshrex/uwu.vim'
Plug 'bluz71/vim-nightfly-guicolors'

" UML diagram support
Plug 'aklt/plantuml-syntax'
Plug 'jbyuki/venn.nvim'
Plug 'justinmk/vim-syntax-extra'
Plug 'ellisonleao/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}
Plug 'dhruvasagar/vim-table-mode'
" Testing
" Plug 'vim-test/vim-test'
" Plug 'rcarriga/vim-ultest', {'do': ':UpdateRemotePlugins' }
" Minimap
" Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'Pocco81/DAPInstall.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" JS and GraphQL
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
call plug#end()

"-------------------------------------------"

" sensible defaults
set nocompatible
filetype plugin on
filetype plugin indent on
syntax on
set nowrap
set encoding=UTF-8
set number
set ruler
set splitbelow splitright
set list
set smarttab
set expandtab
set ts=4 shiftwidth=4
set ttyfast
set clipboard=unnamedplus
set laststatus=2
let mapleader = "]"
set autoindent
set showmatch
set incsearch
set hlsearch
set foldlevel=99
set path +=**
set wildmenu
set backspace=indent,eol,start
set hidden
set updatetime=200
set relativenumber

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" vim-go 
"" enable all highlighing
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Theme and Styling 
set t_Co=256
set termguicolors
set background=dark
set cursorline
set wrap
set linebreak
set signcolumn=yes
"" Highlights
" hi Normal guibg=NONE ctermbg=NONE
highlight clear SignColumn

" Mappings and Bindings
nnoremap <space> za
nnoremap <tab> <C-w>w
map <C-t> :Lex<CR>
nnoremap <leader>mk :Neomake<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>rc :e $MYVIMRC<CR>
nnoremap <leader>i3 :e ~/.config/i3/config<CR>
nnoremap <leader>src :source $MYVIMRC<CR>
nnoremap <leader>fi magg=G`a
nnoremap <leader>sm :Goyo<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>- :sp<CR>
nnoremap <leader>\| :vs<CR>
nnoremap <leader>f :NvimTreeToggle<CR>
nnoremap <leader>v :Vista<CR>
nnoremap <leader>l :call OpenLabFiles()<CR>
nnoremap <leader>pi :PlugInstall()<CR>
nnoremap <leader>m :MarkdownPreview<CR>
nnoremap <leader>tb :term ++curwin<CR>
nnoremap <leader>j <down>
nnoremap <leader>k <up>
nnoremap <leader>p :Files<CR>
nnoremap <leader>b :BTags<CR>

" C-Like Mappings
" nnoremap <leader>cc <CMD>g/\[\vLOG|DEBUG|ERROR\]/normal I// <CR>
" nnoremap <leader>uc <CMD>g/\[\vLOG|DEBUG|ERROR\]/normal ^3x<CR>
"
let g:coq_settings = { 'auto_start': 'shut-up' }

" Git mappings
nnoremap <leader>gb :GitBlame<CR>
nnoremap <leader>gc :Commits<CR>
nnoremap <leader>gbc :BCommits<CR>
nnoremap <leader>tt :Windows<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>mm :Maps<CR>
nnoremap <leader>t :Tags<CR>

" ****  Custom Functions

" function to open files in the CS lab layout
" This opens files in the following layout:
"  ----------------------
"  main.c       | utils.c
"  -----------------------
"  questions.txt | utils.h
"  -----------------------
"  Run the terminal with script in a separate tmux tab
function! OpenLabFiles()
    split
    wincmd w
    e main.c
    vsplit
    e utils.c
    wincmd w
    e questions.txt
    vsplit
    e utils.h
    wincmd w
    wincmd =
endfunction


" LSP

lua << EOF

-- require'lspinstall'.setup() -- important
-- local servers = require'lspinstall'.installed_servers()

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  local opts = { noremap=true, silent=true }
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'clangd', 'pyright', 'rust_analyzer', 'tsserver', 'gopls', 'svls'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

require'lspconfig'.html.setup {
    on_attach = on_attach,
    cmd = {'html-languageserver', '--stdio'},
    filetypes =  {"html"},
    init_operations = {
        configurationSection = {'html', 'css', 'javascript'},
        embeddedLanguages = {
            css = true,
            javascript = true
        }
    },
    settings = {},
    flags = {
      debounce_text_changes = 150,
    }
}

-- signatures
require "lsp_signature".setup()

-- diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

-- LSPSAGA
local saga = require 'lspsaga'
saga.init_lsp_saga()

-- lsp-kind
require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})

-- Syntax Highlighting
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}


-- config for neon
vim.g.neon_style = "dark"
vim.g.neon_italic_keyword = false
vim.g.neon_italic_boolean = false
vim.g.neon_italic_function = false
vim.g.neon_italic_variable = false
-- vim.g.neon_bold = true

-- bufferline.nvim
require("bufferline").setup{}


-- LUALINE

-- Color for highlights
local colors = {
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67'
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand '%:t') ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand '%:p:h'
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local config = {
  options = {
    icons_enabled = true,
    theme = 'ayu_dark',
    component_separators = {'>', '<'},
    section_separators = {'>', '<'},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename', 'branch'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'encoding', 'fileformat', 'filetype'},
    lualine_z = {'progress'},
  },
  inactive_sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename', 'branch'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'encoding', 'fileformat', 'filetype'},
    lualine_z = {'progress'},
  },
  tabline = {},
  extensions = {}
}


-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_right {
	'lsp_progress',
	display_components = { 'lsp_client_name', { 'title', 'percentage', 'message' }},
	-- With spinner
	-- display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' }},
	colors = {
	  percentage  = colors.cyan,
	  title  = colors.cyan,
	  message  = colors.cyan,
	  spinner = colors.cyan,
	  lsp_client_name = colors.magenta,
	  use = true,
	},
	separators = {
		component = ' ',
		progress = ' | ',
		message = { pre = '(', post = ')'},
		percentage = { pre = '', post = '%% ' },
		title = { pre = '', post = ': ' },
		lsp_client_name = { pre = '[', post = ']' },
		spinner = { pre = '', post = '' },
		message = { commenced = 'In Progress', completed = 'Completed' },
	},
	display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
	timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
	spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
}

ins_right {
  'diagnostics',
  sources = { 'nvim_lsp' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

ins_right {
  -- Lsp server name .
  function()
    local msg = 'None'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = '⚙️',
  color = { fg = '#ffffff', gui = 'bold' },
}


ins_left {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

-- ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }
-- ins_left {}

require('lualine').setup(config)


HighlightTags = {}
HighlightTags["!"] = {guifg='#ff2d00'}
HighlightTags["?"] = {guifg='#1f98ff'}
HighlightTags["todo"] = {guifg='#ff8c00'}
HighlightTags["TODO"] = {guifg='#ff8c00'}
HighlightTags["*"] = {guifg='#98C379'}
vim.g.highlightTags = HighlightTags



-- ASCII diagrams go stonks
-- enable or disable keymappings for venn
function _G.toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled) 
    if(venn_enabled == "nil") then
        vim.b.venn_enabled = true
        vim.cmd[[setlocal ve=all]]
        -- draw a line on HJKL keystokes
        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<cr>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<cr>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<cr>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<cr>", {noremap = true})
        -- draw a box by pressing "f" with visual selection
        vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<cr>", {noremap = true})
    else
        vim.cmd[[setlocal ve=]]
        vim.cmd[[mapclear <buffer>]]
        vim.b.venn_enabled = nil
    end
end
-- toggle keymappings for venn using <leader>v
vim.api.nvim_set_keymap('n', '<leader>v', ":lua toggle_venn()<cr>", { noremap = true})

EOF

" -- Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif
  return ''
endfunction

" -- or use command LspSagaFinder
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
" -- code action
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
" -- or use command
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
" -- show hover doc
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" -- show signature help
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
" -- or command
nnoremap <silent> gs :Lspsaga signature_help<CR>
" -- map for function definition preview
nnoremap <silent> pd :Lspsaga preview_definition<CR>
" -- and you also can use smart_scroll_with_saga to scroll in signature help win
nnoremap <silent>K :Lspsaga hover_doc<CR>
" -- scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" -- scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" -- preview definition
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

set completeopt=menuone,noselect

" let g:compe = {}
" let g:compe.enabled = v:true
" let g:compe.autocomplete = v:true
" let g:compe.debug = v:false
" let g:compe.min_length = 1
" let g:compe.preselect = 'enable'
" let g:compe.throttle_time = 80
" let g:compe.source_timeout = 200
" let g:compe.resolve_timeout = 800
" let g:compe.incomplete_delay = 400
" let g:compe.max_abbr_width = 100
" let g:compe.max_kind_width = 100
" let g:compe.max_menu_width = 100
" let g:compe.documentation = v:true
" 
" let g:compe.source = {}
" let g:compe.source.path = v:true
" let g:compe.source.buffer = v:true
" let g:compe.source.calc = v:true
" let g:compe.source.nvim_lsp = v:true
" let g:compe.source.nvim_lua = v:true
" let g:compe.source.vsnip = v:true
" let g:compe.source.ultisnips = v:true
" let g:compe.source.luasnip = v:true
" let g:compe.source.emoji = v:true
" inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Vista.vim config
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

lua require'colorizer'.setup()

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
            \ lua require'lsp_extensions'.inlay_hints{ prefix = ' >> ', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }



" -- show
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>

" -- only show diagnostic if cursor is over the area
nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>

" -- jump diagnostic
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>

" -- preview definition
nnoremap <silent> gp <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

" Emmet Config
let g:user_emmet_leader_key = '<leader>e'
" Neovim Terminal remapping
tnoremap <Esc> <C-\><C-n>

" -- or use command
nnoremap <silent> <C-d> :Lspsaga open_floaterm<CR>
tnoremap <silent> <C-d> <C-\><C-n>:Lspsaga close_floaterm<CR>

" -- dashboard config
let g:dashboard_default_executive ='fzf'

let g:dashboard_custom_header =<< trim END
=================     ===============     ===============   ========  ========
\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
||.=='    _-'                                                     `' |  /==.||
=='    _-'                        N E O V I M                         \/   `==
\   _-'                                                                `-_   /
 `''                              R O W J E E                             ``'

END

lua << EOF
vim.g.dashboard_preview_command = 'cat'
vim.g.dashboard_preview_pipeline = 'lolcat'
vim.g.dashboard_preview_file = '~/scripts/nvim_logo.txt'
vim.g.dashboard_preview_file_height = 20
vim.g.dashboard_preview_file_width = 80

-- vim.g.coq_settings = { 'auto_start': 'shut-up' }
require("coq")
EOF

let g:dashboard_custom_shortcut={
\ 'last_session'       : '<Leader> s l',
\ 'find_history'       : '<Leader> f h',
\ 'find_file'          : '<Leader> f f',
\ 'new_file'           : '<Leader> c n',
\ 'change_colorscheme' : '<Leader> t c',
\ 'find_word'          : '<Leader> f a',
\ 'book_marks'         : '<Leader> f b',
\ }

let g:neon_style='dark'

" folding
set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

let g:material_style='deep ocean'

""Gruvbox
" let g:gruvbox_bold='1'
let g:gruvbox_termcolors=256
let g:gruvbox_italic='1'
let g:gruvbox_underline='1'
let g:gruvbox_undercurl='1'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italicize_comments='1'
let g:gruvbox_italicize_strings='1'
let g:gruvbox_invert_tabline='1'
let g:gruvbox_invert_selection='1'
let g:gruvbox_improved_warnings='1'
let g:gbcurrent = 'dark'

let g:gruvbox_material_palette='original'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_visual = 'blue background'
let g:gruvbox_material_sign_column_background = 'none'
let g:gruvbox_material_sign_column_background = 'none'
let g:gruvbox_material_diagnostic_virtual_text = 'colored'
let g:gruvbox_material_better_performance = 1

lua << EOF
require'nvim-tree'.setup()
EOF

" Important!!
if has('termguicolors')
  set termguicolors
endif
" let g:gruvbox_material_palette = {
"       \ 'bg0':              ['#090B10',   '234'],
"       \ 'bg1':              ['#161b22',   '235'],
"       \ 'bg2':              ['#21262d',   '235'],
"       \ 'bg3':              ['#282828',   '237'],
"       \ 'bg4':              ['#363a49',   '237'],
"       \ 'bg5':              ['#504945',   '239'],
"       \ 'bg_statusline1':   ['#282828',   '235'],
"       \ 'bg_statusline2':   ['#32302f',   '235'],
"       \ 'bg_statusline3':   ['#504945',   '239'],
"       \ 'bg_diff_green':    ['#32361a',   '22'],
"       \ 'bg_visual_green':  ['#333e34',   '22'],
"       \ 'bg_diff_red':      ['#3c1f1e',   '52'],
"       \ 'bg_visual_red':    ['#442e2d',   '52'],
"       \ 'bg_diff_blue':     ['#0d3138',   '17'],
"       \ 'bg_visual_blue':   ['#2e3b3b',   '17'],
"       \ 'bg_visual_yellow': ['#473c29',   '94'],
"       \ 'bg_current_word':  ['#32302f',   '236'],
"       \ 'fg0':              ['#aaaaaa',   '223'],
"       \ 'fg1':              ['#ddc7a1',   '223'],
"       \ 'red':              ['#ea6962',   '167'],
"       \ 'orange':           ['#e78a4e',   '208'],
"       \ 'yellow':           ['#d8a657',   '214'],
"       \ 'green':            ['#a9b665',   '142'],
"       \ 'aqua':             ['#89b482',   '108'],
"       \ 'blue':             ['#7daea3',   '109'],
"       \ 'purple':           ['#d3869b',   '175'],
"       \ 'bg_red':           ['#ea6962',   '167'],
"       \ 'bg_green':         ['#a9b665',   '142'],
"       \ 'bg_yellow':        ['#d8a657',   '214'],
"       \ 'grey0':            ['#7c6f64',   '243'],
"       \ 'grey1':            ['#928374',   '245'],
"       \ 'grey2':            ['#a89984',   '246'],
"       \ 'none':             ['NONE',      'NONE']
"       \ }
" For dark version.
set background=dark
colo neon
hi Visual cterm=NONE ctermbg=242 gui=NONE guibg=#1F3546

let g:go_fmt_autosave=0

" autocmd FileType javascript javascriptreact setlocal formatprg=prettier\ --single-quote\ --trailing-comma\ es5 ts=2 shiftwidth=2
" Use formatprg when available
" let g:neoformat_try_formatprg = 1
"

" 🐓 Coq completion settings

" Set recommended to false
let g:coq_settings = { "keymap.recommended": v:false }

" Keybindings
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

" colo nightfox
