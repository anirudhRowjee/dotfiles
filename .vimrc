"""""""
" vim config for machines with git
" maintained by Anirudh Rowjee (github @anirudhRowjee)
"""""""


" ------------- PLUGINS SETUP ----------------"
call plug#begin('~/.vim/plugged')

" GUI and UI plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'raimondi/delimitmate'
Plug 'junegunn/goyo.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/fzf',{ 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
" Autocomplete and syntax highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
" framework support
Plug 'mattn/emmet-vim'
" colors
Plug 'morhetz/gruvbox'
" LaTeX setup
Plug 'vim-latex/vim-latex'
" UML diagram support
Plug 'aklt/plantuml-syntax'
call plug#end()
"-------------------------------------------"


set nocompatible
syntax on
set nowrap
set encoding=utf-8

" Show linenumbers
set number
set ttyfast
set relativenumber
set ruler
set splitbelow splitright
set list
set smarttab
set noexpandtab

" Set Proper Tabs
set ts=4 shiftwidth=4

" mouse
set mouse+=a

" wrap at 150 characters
set textwidth=100

" Always display the status line
set laststatus=2

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" airline config
let g:airline_powerline_fonts = 1
let g:airline_theme_background='light'
let g:airline_theme='deus'
let g:airline#extensions#hunks#enabled=1

" colorscheme congfigurations
let g:gruvbox_bold='1'
let g:gruvbox_italic='1'
let g:gruvbox_underline='1'
let g:gruvbox_undercurl='1'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italicize_comments='1'
let g:gruvbox_italicize_strings='1'
let g:gruvbox_invert_tabline='1'

set background=dark
colorscheme gruvbox

" disable signcolumn
set signcolumn=no

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

" Theme and Styling 
if (has("termguicolors"))
	set termguicolors
endif
set t_Co=256

set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
	nnoremap <Up>	 :resize +2<CR>
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
	vs
	Explore
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
"let python_highlight_all=1

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
nnoremap <leader>src :source $MYVIMRC<CR>
nnoremap <leader>fi magg=G`a
nnoremap <leader>rt :REPLToggle<CR>
nnoremap <leader>g :Goyo<CR>

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
autocmd BufRead *.cpp map <F8> :w<CR>:!gcc % -o %<	-lstdc++ && ./%< <CR>
autocmd BufNewFile *.cpp 0r ~/skeletons/skeleton.cpp
map <F8> :w<CR>:!gcc % -o %<	-lstdc++ && ./%< <CR>

" python specific buffer settings?
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set nocindent
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``


" autocmd BufWritePost .vimrc nested source %

" web development stuff
autocmd BufEnter,BufRead *.js,*.vue,*.ts,*.html,*.css set tabstop=2 shiftwidth=2 foldmethod=syntax
autocmd BufNewFile,BufRead *.vue set filetype=vue
autocmd BufNewFile,BufRead,BufEnter *.md set textwidth=100 colorcolumn=100

" Plugin Config - ALE
let g:ale_linters = {'python': ['flake8'], 'javascript': ['eslint'],}
let g:ale_fixers = {'python': ['black'],}
let g:ale_fix_on_save = 1
let g:ale_python_executable='/usr/bin/python3'
let g:ale_sign_error='☒'
let g:ale_sign_warning='⚠'
let g:ale_set_highlights=1
let g:ale_set_signs=0
hi ALEWarning ctermbg=none cterm=underline term=underline
hi ALEError ctermbg=none cterm=underline term=underline
let g:airline#extensions#ale#enabled = 1

" Plugin Config - FZF
nnoremap <leader>p :Files<CR>
nnoremap <c-b> :BTags<CR>

"nnoremap <leader>fl :set noet|%ret!<CR>

" backspace config
set backspace=indent,eol,start

" vim latex settings
autocmd BufWritePost *.tex normal \ll
autocmd BufEnter *.tex normal \lv\ll
autocmd BufEnter *.tex set textwidth=80

" UML diagram PNG rendering
autocmd BufNewFile *.puml 0r ~/skeletons/er.puml
autocmd BufEnter *.puml map <leader>vi :! plantuml -tpng % && eog %:r.png &<CR>
autocmd BufWritePost *.puml normal \vi<CR>

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

set cursorline!
set fillchars=vert:\|


" indentline config
set listchars=tab:\|\ 

" function to add indentlines
function! SetIndentLine()
	set noexpandtab
	set noet|%ret!
endfunction

nnoremap <leader>fl :call SetIndentLine()<CR>
autocmd BufEnter,BufNewFile,BufRead *.py set tabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix 
"autocmd BufEnter,BufNewFile,BufRead *.* set noet|%ret!
