"""""""
"    ____                  _          _                _
"   / __ \____ _      __  (_)__  ___ ( )_____   _   __(_)___ ___  __________
"  / /_/ / __ \ | /| / / / / _ \/ _ \|// ___/  | | / / / __ `__ \/ ___/ ___/
" / _, _/ /_/ / |/ |/ / / /  __/  __/ (__  )   | |/ / / / / / / / /  / /__  
"/_/ |_|\____/|__/|__/_/ /\___/\___/ /____/    |___/_/_/ /_/ /_/_/   \___/  
"                   /___/
" maintained by Anirudh Rowjee (github @anirudhRowjee)
"""""""
" ------------- PLUGINS SETUP ----------------"
call plug#begin('~/.vim/plugged')

" GUI and UI plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf',{ 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
" Autocomplete and syntax highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
" framework support
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'herringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'scrooloose/NERDTree'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'sjl/tslime.vim'
" colors
Plug 'anirudhrowjee/gruvbox-black'
" Plug 'morhetz/gruvbox'
Plug 'reewr/vim-monokai-phoenix'
Plug 'sainnhe/sonokai'
Plug 'lsdr/monokai'
Plug 'phanviet/vim-monokai-pro'
Plug 'lifepillar/vim-gruvbox8'
Plug 'ayu-theme/ayu-vim'
Plug 'atahabaki/archman-vim' 
Plug 'jgliner/stereokai2016.vim'
Plug 'chuling/equinusocio-material.vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'kaicataldo/material.vim'
" LaTeX setup
Plug 'vim-latex/vim-latex'
" UML diagram support
Plug 'aklt/plantuml-syntax'
" debugger
call plug#end()
"-------------------------------------------"

set nocompatible
syntax on
set nowrap
set encoding=UTF-8

" Show linenumbers
set number
set ruler
set splitbelow splitright
set list
set smarttab
set expandtab

" use the old regex engine
set re=1
" Set Proper Tabs
set ts=4 shiftwidth=4

set ttyfast

" Always display the status line
set laststatus=2
" change leader key to ]
let mapleader = "]"
" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1
" airline config
let g:airline_powerline_fonts = 1
let g:airline_theme_background='dark'
let g:airline_theme='google_dark'
let g:airline#extensions#hunks#enabled=1
" Theme and Styling 
set t_Co=256
set termguicolors
" colorscheme congfigurations

"" Gruvbox
let g:gruvbox_bold='1'
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

"" Sonokai
let g:sonokai_style='andromeda'
let g:sonokai_enable_italic=1

"" Equinusocio-Material
let g:equinusocio_material_style = 'pure'

" Vim-Afterglow
let g:airline_them = 'afterglow'
let g:afterglow_blackout=1 
let g:afterglow_italic_comments=1

" Ayu
let ayucolor="dark"

" Material
let g:material_terminal_italics = 1
let g:material_theme_style = 'ocean'
colorscheme material

" "Add custom colors to sonokai
function! s:sonokai_custom() abort
  " Link a highlight group to a predefined highlight group.
  " See `colors/sonokai.vim` for all predefined highlight groups.
  " Initialize the color palette.
  " The parameter is a valid value for `g:sonokai_style`,
  let l:palette = sonokai#get_palette('atlantis')
  " Define a highlight group.
  " The first parameter is the name of a highlight group,
  " the second parameter is the foreground color,
  " the third parameter is the background color,
  " the fourth parameter is for UI highlighting which is optional,
  " and the last parameter is for `guisp` which is also optional.
  " See `autoload/sonokai.vim` for the format of `l:palette`.
  call sonokai#highlight('Normal', l:palette.fg, l:palette.black)
  call sonokai#highlight('Terminal', l:palette.fg, l:palette.black)
  call sonokai#highlight('EndOfBuffer', l:palette.bg0, l:palette.black)
  call sonokai#highlight('Folded', l:palette.grey, l:palette.black)
  call sonokai#highlight('ToolbarLine', l:palette.fg, l:palette.black)
  call sonokai#highlight('SignColumn', l:palette.fg, l:palette.black)
  call sonokai#highlight('FoldColumn', l:palette.grey, l:palette.black)
endfunction

augroup SonokaiCustom
  autocmd!
  autocmd ColorScheme sonokai call s:sonokai_custom()
augroup END

set background=dark
" colorscheme afterglow
colorscheme sonokai

" NetRW configuration
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 2

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif

" GVIM specifc config
au GUIEnter * simalt ~x
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" python compatibility
filetype plugin on
filetype plugin indent on  
set omnifunc=syntaxcomplete#Complete 
let python_highlight_all = 1
" autocmd BufEnter,BufNewFile,BufRead *.py set textwidth=80 colorcolumn=80 
" indentation-based folding
set foldlevel=99
" map space to za (fold/unfold)
nnoremap <space> za
nnoremap <tab> <C-w>w
" syntax marking for python (may not work)
let python_highlight_all=1
" set to system clipboard
set clipboard=unnamedplus
" toggle left file explorer
map <C-t> :Lex<CR>

" move indent when enter is pressed
set autoindent
" show matching brackets
" set showmatch
" searching
set incsearch
set hlsearch
" key binding to turn off search highlighting
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>rc :e $MYVIMRC<CR>
nnoremap <leader>i3 :e ~/.config/i3/config<CR>
nnoremap <leader>src :source $MYVIMRC<CR>
nnoremap <leader>fi magg=G`a
nnoremap <leader>g :Goyo<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>- :sp<CR>
nnoremap <leader>\| :vs<CR>
nnoremap <leader>f :NERDTreeToggle<CR>

" markdown preview function
function! g:StartMarkdownPreview()
    silent exec "!google-chrome %:p"
endfunction

" path for fuzzy find
set path +=**
" display all matching files
set wildmenu
" execute python file on pressing F5
autocmd BufRead *.py map <leader>c :w<CR>:exe ":!clear && python3 " . getreg("%") . "" <CR>
" map ctrl-n to create new file and open in edit
map <C-n> :call Cbdo()<CR> 
" map ctrl-r to open terminal and file explorer
map <C-r> :call StartWork()<CR>
" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>
" omnicompletion settings
autocmd CompleteDone * pclose
" C/C++ compile rules
autocmd BufRead *.c  map <leader>c :w<CR>:!clear && gcc % -o %< && ./%< <CR>
autocmd BufRead *.cpp map <leader>c :w<CR>:!clear && gcc % -o %<  -lstdc++ && ./%< <CR>
autocmd BufNewFile *.cpp 0r ~/skeletons/skeleton.cpp
autocmd BufNewFile *.tex 0r ~/skeletons/skeleton.tex
" python specific buffer settings?
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set nocindent
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" web development stuff
autocmd BufEnter,BufRead *.js,*.vue,*.ts,*.html,*.css set tabstop=2 shiftwidth=2 foldmethod=syntax
autocmd BufNewFile,BufRead *.vue set filetype=vue
autocmd BufNewFile,BufRead,BufEnter *.md set wrap nolist linebreak colorcolumn=80
autocmd BufNewFile,BufRead,BufEnter *.md nnoremap <leader>b :MarkdownPreview<CR>

" Plugin Config - ALE
let g:ale_linters = {'python': ['autopep8'], 'javascript': ['eslint'],}
let g:ale_fixers = {'python': ['black']}
let g:ale_fix_on_save = 1
let g:ale_python_executable='/usr/bin/python3'
let g:ale_sign_error='✗'
let g:ale_sign_warning='❱'
let g:ale_set_highlights=1
let g:ale_set_signs=1
hi ALEWarning ctermbg=none cterm=underline term=underline
hi ALEError ctermbg=none cterm=underline term=underline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" Plugin Config - FZF
nnoremap <leader>p :Files<CR>
nnoremap <leader>b :BTags<CR>

" backspace config
set backspace=indent,eol,start

" vim latex settings
autocmd BufWritePost *.tex normal ]ll]lv
autocmd BufEnter *.tex normal ]lv
autocmd BufEnter *.tex set textwidth=80
" UML diagram PNG rendering
autocmd BufNewFile *.puml 0r ~/skeletons/er.puml
autocmd BufEnter *.puml map <leader>vi :! plantuml -tpng % && eog %:r.png &<CR>
autocmd BufWritePost *.puml normal ]vi<CR>

" markdownfornotes
autocmd BufWritePost *.notes.md :!pandoc --pdf-engine=pdflatex --highlight-style zenburn -N % -o %:r.pdf
" vim-latex config
let g:Tex_ViewRule_pdf = 'zathura'
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex $*'

" FZF config
let g:fzf_buffers_jump = 1
let g:fzf_preview_window = 'right:60%'

" coc.nvim completion config
set hidden
set updatetime=200

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

set nocursorline
highlight clear SignColumn
set signcolumn=yes
autocmd BufEnter,BufNewFile,BufRead *.py set tabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix 
" set fzf colors to local colorscheme colors
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" typescript specific settings
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
" organize imports TS
nmap <leader>i :CocCommand tsserver.organizeImports<cr>


" line number highlighting
hi clear LineNr
hi LineNr ctermfg=grey

set ttimeoutlen=5
" This gets rid of the nasty _ italic bug in tpope's vim-markdown

" block $$...$$
syn region math start=/\$\$/ end=/\$\$/
" inline math
syn match math '\$[^$].\{-}\$'
" actually highlight the region we defined as "math"
hi link math Statement

" C Language settings
autocmd BufNewFile *.c 0r ~/skeletons/skeleton.c

" tslime {{{
let g:tslime_ensure_trailing_newlines = 1
let g:tslime_normal_mapping = '<leader>t'
let g:tslime_visual_mapping = '<leader>t'
let g:tslime_vars_mapping = '<leader>T'
" }}}




"vim ft=vim;
