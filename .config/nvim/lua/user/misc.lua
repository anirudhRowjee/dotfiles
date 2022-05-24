require('rust-tools').setup({})             -- TODO get doc comment highlighting working and type hints working
require('colorizer').setup({})              -- know your colors
require("flutter-tools").setup{} -- use defaults
require'lsp_extensions'.inlay_hints{ prefix = '  λ  ', highlight =  "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }
require('toggletasks').setup{}

require("notify").setup({

  -- Minimum level to show
  level = "info",
  -- Animation style (see below for details)
  stages = "fade_in_slide_out",
  -- Function called when a new window is opened, use for changing win settings/config
  on_open = nil,
  -- Function called when a window is closed
  on_close = nil,
  -- Render function for notifications. See notify-render()
  render = "default",
  -- Default timeout for notifications
  timeout = 500,
  -- Max number of columns for messages
  max_width = nil,
  -- Max number of lines for a message
  max_height = nil,
  -- For stages that change opacity this is treated as the highlight behind the window
  -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
  background_colour = "#000000",
  -- Minimum width for notification windows
  minimum_width = 50,
  -- Icons for the different levels
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})
vim.notify = require('notify')


vim.cmd [[
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

function! WriteMode()
    set background=light
    set cursorline!
    set wrap
    Goyo
endfunction

nnoremap <leader>wm :call WriteMode()<CR>

autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs lua require('rust-tools.inlay_hints').set_inlay_hints()

" terminal escape
tnoremap <Esc> <C-\><C-n>
]]

