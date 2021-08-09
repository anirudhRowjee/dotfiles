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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf',{ 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
" IDE Features
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'zivyangll/git-blame.vim'
Plug 'neomake/neomake'
" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'onsails/lspkind-nvim'
" framework support
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'herringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'sjl/tslime.vim'
Plug 'tweekmonster/django-plus.vim'
Plug 'fatih/vim-go'
Plug 'nvim-telescope/telescope.nvim'
" Leetcode, because why not
Plug 'ianding1/leetcode.vim'
" colors
Plug 'srcery-colors/srcery-vim'
Plug 'justinmk/vim-syntax-extra'
" LaTeX setup
Plug 'vim-latex/vim-latex'
" UML diagram support
Plug 'aklt/plantuml-syntax'
" debugger
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

" airline config
let g:airline_powerline_fonts = 1
let g:airline_theme_background='dark'
let g:airline_theme='base16_bright'
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#tabline#enabled=1

"" Srcery
let g:srcery_italic=1
let g:srcery_bold=1
let g:srcery_underline=1
let g:srcery_undercurl=1
let g:srcery_inverse_matches=1
let g:srcery_inverse=1
let g:srcery_black='#0F0F0F'

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
colorscheme srcery
set nocursorline
set signcolumn=yes
"" Highlights
hi Normal guibg=NONE ctermbg=NONE
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
nnoremap <leader>f :NERDTreeToggle<CR>
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
local servers = { 'clangd', 'pyright', 'rust_analyzer', 'tsserver', 'gopls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

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

EOF

" -- lsp provider to find the cursor word definition and reference
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
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
" -- or use command

" -- show signature help
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
" -- or command
nnoremap <silent> gs :Lspsaga signature_help<CR>

" -- and you also can use smart_scroll_with_saga to scroll in signature help win
nnoremap <silent>K :Lspsaga hover_doc<CR>

" -- scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" -- scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

" -- preview definition
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
" -- or use command
nnoremap <silent> gd :Lspsaga preview_definition<CR>

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
