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
" colors
Plug 'anirudhrowjee/gruvbox-black'
Plug 'ghifarit53/tokyonight-vim'
Plug 'nlknguyen/papercolor-theme'
Plug 'svjunic/radicalgoodspeed.vim'
" LaTeX setup
Plug 'vim-latex/vim-latex'
" UML diagram support
Plug 'aklt/plantuml-syntax'
Plug 'ryanoasis/vim-devicons'
call plug#end()
"-------------------------------------------"

set nocompatible
syntax on
set nowrap
set encoding=UTF-8

" Show linenumbers
set number
set relativenumber
set ruler
set splitbelow splitright
set list
set smarttab
set expandtab

" Set Proper Tabs
set ts=4 shiftwidth=4

" mouse
set mouse+=a
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
let g:airline_theme='ayu_dark'
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
let g:gruvbox_invert_selection='0'
let g:gruvbox_improved_warnings='1'
let g:gbcurrent = 'dark'

"" Sonokai
let g:sonokai_style='atlantis'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

set background=dark
colorscheme gruvbox


" NetRW configuration
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 10
let g:netrw_altv = 2

 "netrw - create file and open in new split
function! Cbdo()
    set autochdir
    call inputsave()
    let name=input('enter filename >>')
    call inputrestore()
    vs
    wincmd w
    execute 'e' name
    set noautochdir
endfunction

" term - open terminal in local dir
function! Term()
    set autochdir
    term
    set autochdir!
endfunction  


" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif


" Turn Vim into an IDE
function! StartWork()
    split
    wincmd w
    call Term()
    wincmd w
    q
    wincmd w
    resize +8
    Lex
    vertical resize -50
endfunction

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

" syntax marking for python (may not work)
let python_highlight_all=1

" set to system clipboard
set clipboard=unnamedplus

" toggle left file explorer
map <C-t> :Lex <CR>

" move indent when enter is pressed
set autoindent

" show matching brackets
set showmatch

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

" path for fuzzy find
set path +=**

" display all matching files
set wildmenu

" execute python file on pressing F5
autocmd BufRead *.py map <F5> :w<CR>:exe ":!clear && python3 " . getreg("%") . "" <CR>

" map ctrl-n to create new file and open in edit
map <C-n> :call Cbdo()<CR> 

" map ctrl-r to open terminal and file explorer
map <C-r> :call StartWork()<CR>

" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>

" omnicompletion settings
autocmd CompleteDone * pclose

" C/C++ compile rules
autocmd BufRead *.c  map <F8> :w<CR>:!gcc % -o %< && ./%< <CR>
autocmd BufRead *.cpp map <F8> :w<CR>:!clear && gcc % -o %<  -lstdc++ && ./%< <CR>
autocmd BufNewFile *.cpp 0r ~/skeletons/skeleton.cpp

" python specific buffer settings?
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set nocindent
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``


" autocmd BufWritePost .vimrc nested source %

" web development stuff
autocmd BufEnter,BufRead *.js,*.vue,*.ts,*.html,*.css set tabstop=2 shiftwidth=2 foldmethod=syntax
autocmd BufNewFile,BufRead *.vue set filetype=vue
autocmd BufNewFile,BufRead,BufEnter *.md set wrap nolist linebreak

" Plugin Config - ALE
let g:ale_linters = {'python': ['autopep8'], 'javascript': ['eslint'],}
let g:ale_fixers = {'python': ['black'],}
let g:ale_fix_on_save = 1
let g:ale_python_executable='/usr/bin/python3'
let g:ale_sign_error='✗'
let g:ale_sign_warning='❱'
let g:ale_set_highlights=1
let g:ale_set_signs=1
hi ALEWarning ctermbg=none cterm=underline term=underline
hi ALEError ctermbg=none cterm=underline term=underline
let g:airline#extensions#ale#enabled = 1

" Plugin Config - FZF
nnoremap <leader>p :Files<CR>
nnoremap <leader>b :BTags<CR>

"nnoremap <leader>fl :set noet|%ret!<CR>

" backspace config
set backspace=indent,eol,start

" vim latex settings
autocmd BufWritePost *.tex normal ]ll
autocmd BufEnter *.tex normal ]lv]ll
autocmd BufEnter *.tex set textwidth=80

" UML diagram PNG rendering
autocmd BufNewFile *.puml 0r ~/skeletons/er.puml
autocmd BufEnter *.puml map <leader>vi :! plantuml -tpng % && eog %:r.png &<CR>
autocmd BufWritePost *.puml normal ]vi<CR>

" vim-latex config
let g:Tex_ViewRule_pdf = 'zathura'
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex $*'

" FZF config
"let g:fzf_layout = { 'window': { 'width': 0.5, 'height': 0.3}, }
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

nnoremap <leader>fl :call SetIndentLine()<CR>
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

set ttimeoutlen=10
"vim ft=vim;
