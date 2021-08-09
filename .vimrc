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
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf',{ 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
" IDE Features
Plug 'neoclide/coc.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'zivyangll/git-blame.vim'
Plug 'neomake/neomake'
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
" colors
Plug 'morhetz/gruvbox'
Plug 'srcery-colors/srcery-vim'
Plug 'sainnhe/edge'
Plug 'justinmk/vim-syntax-extra'
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
set clipboard=unnamedplus

" Always display the status line
set laststatus=2
" change leader key to ]
let mapleader = "]"
" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1
" airline config
let g:airline_powerline_fonts = 1
let g:airline_theme_background='dark'
let g:airline_theme='base16_bright'
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

"" Srcery
let g:srcery_italic=1
let g:srcery_bold=1
let g:srcery_underline=1
let g:srcery_undercurl=1
let g:srcery_inverse_matches=1
let g:srcery_inverse=1
let g:srcery_black='#0F0F0F'

set background=dark
colorscheme srcery
hi Normal guibg=NONE ctermbg=NONE

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

let g:coc_global_extensions = [
    \ 'coc-lists',
    \ 'coc-explorer',
    \ 'coc-fzf-preview',
    \ 'coc-git',
    \ 'coc-html',
    \ 'coc-tailwindcss',
    \ 'coc-emoji',
    \ 'coc-snippets',
    \ 'coc-prettier',
    \ 'coc-emmet',
    \ 'coc-python',
    \ 'coc-rls',
    \ 'coc-sh',
    \ 'coc-json',
    \ 'coc-markdownlint',
    \ 'coc-texlab',
    \ 'coc-tsserver',
    \ 'coc-css',
    \ 'coc-clangd',
    \ 'coc-tsserver',
    \ 'coc-vetur',
    \ 'coc-pairs',
    \ ]

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

" GVIM specifc config - Make Gvim behave like CLI vim
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
" toggle left file explorer
map <C-t> :Lex<CR>

" Neomake Config
let g:neomake_open_list = 2
nnoremap <leader>mk :Neomake<CR>

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
nnoremap <leader>sm :Goyo<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>- :sp<CR>
nnoremap <leader>\| :vs<CR>
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>l :call OpenLabFiles()<CR>
nnoremap <leader>pi :PlugInstall()<CR>
nnoremap <leader>m :call StartMarkdownPreview()<CR>
nnoremap <leader>tb :term ++curwin<CR>
nnoremap <leader>j <down>
nnoremap <leader>k <up>

" Git mappings
nnoremap <leader>gb :GitBlame<CR>
nnoremap <leader>gc :Commits<CR>
nnoremap <leader>gbc :BCommits<CR>

nnoremap <leader>tt :Windows<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>mm :Maps<CR>
nnoremap <leader>t :Tags<CR>

" Coc.nvim bindings
nnoremap <leader>ss :CocCommand clangd.switchSourceHeader<CR>

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
let g:ale_sign_error='>>'
let g:ale_sign_warning='!'
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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Scroll the documentation window
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" use tab and shift-tab to navigate the completion menu instead of arrow keys
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" I don't even know what this is
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"vim ft=vim;
