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
Plug 'kyazdani42/nvim-web-devicons' " for file icons
" IDE Features
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'zivyangll/git-blame.vim'
Plug 'neomake/neomake'
Plug 'folke/trouble.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'
Plug 'diepm/vim-rest-console'
" LSP Support 
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
" main one
" back to old completion, it was better
Plug 'hrsh7th/nvim-compe'
" Plug 'ray-x/lsp_signature.nvim'
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
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'marko-cerovac/material.nvim'
Plug 'catppuccin/nvim'
Plug 'morhetz/gruvbox'
" UML diagram support
Plug 'aklt/plantuml-syntax'
Plug 'jbyuki/venn.nvim'
Plug 'justinmk/vim-syntax-extra'
Plug 'ellisonleao/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}
Plug 'dhruvasagar/vim-table-mode'
" JS and GraphQL
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
" MIPS
Plug 'benknoble/vim-mips'
" DebuggeR?
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'Pocco81/DAPInstall.nvim'
call plug#end()
"-------------------------------------------"

" sensible defaults
set nocompatible
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
set t_Co=256
set termguicolors
set background=dark
set cursorline!
set wrap
set linebreak
set signcolumn=yes
set completeopt=menuone,noselect
set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set ttimeoutlen=5

filetype plugin on
filetype plugin indent on


" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>


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

" Git mappings
nnoremap <leader>gb :GitBlame<CR>
nnoremap <leader>gc :Commits<CR>
nnoremap <leader>gbc :BCommits<CR>
nnoremap <leader>tt :Windows<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>mm :Maps<CR>
nnoremap <leader>t :Tags<CR>
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <C-d> :Lspsaga open_floaterm<CR>
tnoremap <silent> <C-d> <C-\><C-n>:Lspsaga close_floaterm<CR>

" Trouble
nnoremap <space>d :TroubleToggle<CR>

let g:user_emmet_leader_key = '<leader>e'

" LSP

lua << EOF

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


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
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'clangd', 'pyright', 'rust_analyzer', 'tsserver', 'gopls', 'svls', 'cssls'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
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
-- require "lsp_signature".setup()

-- diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

-- LSPSAGA
-- local saga = require 'lspsaga'
-- saga.init_lsp_saga()

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
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {},
    theme = 'ayu_dark',
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
  icon = ' ⚙️',
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

" let g:coq_settings = { 'auto_start': 'shut-up' }

" -- Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif
  return ''
endfunction

" Vista.vim config
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1

lua require'colorizer'.setup()

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
            \ lua require'lsp_extensions'.inlay_hints{ prefix = ' >> ', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }


" Emmet Config

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
-- require("coq")
require'nvim-tree'.setup()
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


" NIghtfly color options
" Vimscript initialization file
let g:nightflyCursorColor = 1
let g:nightflyUnderlineMatchParen = 1

if has('termguicolors')
  set termguicolors
endif
set background=dark
let g:neon_style='dark'
" colo nightfly
colo neon
highlight clear SignColumn
hi Visual cterm=NONE ctermbg=242 gui=NONE guibg=#1F3546
" hi Normal guibg=NONE 

" Set recommended to false
let g:coq_settings = { "keymap.recommended": v:false }

" Keybindings
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

" vim-go 
"" enable all highlighing
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_fmt_autosave=0

" NetRW, if I ever have to
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 2

" execute python file on pressing F5
autocmd BufRead *.py map <leader>c :w<CR>:exe ":!clear && python3 " . getreg("%") . "" <CR>
autocmd BufRead *.c  map <leader>c :w<CR>:!clear && gcc % -o %< && ./%< <CR>
autocmd BufRead *.cpp map <leader>c :w<CR>:!clear && gcc % -o %<  -lstdc++ && ./%< <CR>
autocmd BufNewFile *.cpp 0r ~/skeletons/skeleton.cpp
autocmd BufNewFile *.tex 0r ~/skeletons/skeleton.tex
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set nocindent
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" web development stuff
autocmd BufEnter,BufRead *.js,*.jsx,*.vue,*.ts,*.html,*.css set tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.vue set filetype=vue
" autocmd BufNewFile,BufRead,BufEnter *.md set wrap nolist linebreak
" autocmd BufNewFile,BufRead,BufEnter *.md nnoremap <leader>b :MarkdownPreview<CR>

" vim latex settings
autocmd BufWritePost *.tex normal ]ll]lv
autocmd BufEnter *.tex normal ]lv
autocmd BufEnter *.tex set textwidth=80
" UML diagram PNG rendering
autocmd BufNewFile *.puml 0r ~/skeletons/er.puml
autocmd BufEnter *.puml map <leader>vi :! plantuml -tpng % && eog %:r.png &<CR>
autocmd BufWritePost *.puml normal ]vi<CR>

" markdownfornotes
" autocmd BufWritePost *.notes.md :!pandoc --pdf-engine=pdflatex --highlight-style zenburn -N % -o %:r.pdf


" This gets rid of the nasty _ italic bug in tpope's vim-markdown
" block $$...$$
syn region math start=/\$\$/ end=/\$\$/
" inline math
syn match math '\$[^$].\{-}\$'
" actually highlight the region we defined as "math"
hi link math Statement

lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },
}

require("trouble").setup {
    -- comment
    }
local dap_install = require("dap-install")

dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

EOF

autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2

" Gruvbox Theme
let g:gruvbox_bold='1'
let g:gruvbox_termcolors=256
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


function! WriteMode()
    " colo gruvbox
    set background=light
    set cursorline!
    set wrap
    colo nightfly
    Goyo
endfunction

nnoremap <leader>wm :call WriteMode()<CR>

set completeopt=menuone,noselect

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
