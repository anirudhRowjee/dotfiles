"""""""
" basic .vimrc for machines without git support 
" best vanilla config
" maintained by Anirudh Rowjee (github @anirudhRowjee)
"""""""


set nocompatible
syntax on
set nowrap
set encoding=utf-8
set guifont=consolas

" Show linenumbers
set number
set ruler

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Always display the status line
set laststatus=2

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Enable highlighting of the current line
set cursorline


" NetRW configuration
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 10
let g:netrw_altv = 2

" netrw - create file and open in new split
function! Cbdo()
   set autochdir
   call inputsave()
   let name=input('enter filename >>')
   call inputrestore()
   vs
   wincmd w
   execute 'e' name
   set autochdir!
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
set omnifunc=syntaxcomplete#Complete 

" indentation-based folding
set foldmethod=indent
set foldlevel=99

" map space to za (fold/unfold)
nnoremap <space> za

" syntax marking for python (may not work)
let python_highlight_all=1

" set to system clipboard
set clipboard=unnamed

" toggle left file explorer
map <C-t> :Lex <CR>

" move indent when enter is pressed
set autoindent

" show matching brackets
set showmatch

" searching
set incsearch
set hlsearch

" remove vertical fill characters in splits
set fillchars+=vert:\  

" key binding to turn off search highlighting
nnoremap <leader><space> :nohlsearch<CR>

" path for fuzzy find
set path +=**
set path +=$PWD/

" display all matching files
set wildmenu

" execute python file on pressing f5
map <F5> :w<CR>:exe ":!python3 " . getreg("%") . "" <CR>

" map ctrl-n to create new file and open in edit
map <C-n> :call Cbdo() <CR> 

" map ctrl-r to open terminal and file explorer
map <C-r> :call StartWork() <CR>

" set working directory to wherever the open file lives
"set autochdir

" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>

" omnicompletion settings
autocmd CompleteDone * pclose


" ------------------------ COLORS -------------------------------------

if ! exists('g:vice_gui_italic')
    let g:vice_gui_italic = 1
endif

if ! exists('g:vice_term_italic')
    let g:vice_term_italic = 0
endif

let g:vice_termcolors = 256

set background=dark
hi clear

if exists('syntax_on')
  syntax reset
endif

let colors_name = 'vice'

function! s:h(group, style)
  let s:ctermformat = 'NONE'
  let s:guiformat = 'NONE'
  if has_key(a:style, 'format')
    let s:ctermformat = a:style.format
    let s:guiformat = a:style.format
  endif
  if g:vice_term_italic == 0
    let s:ctermformat = substitute(s:ctermformat, ',italic', '', '')
    let s:ctermformat = substitute(s:ctermformat, 'italic,', '', '')
    let s:ctermformat = substitute(s:ctermformat, 'italic', '', '')
  endif
  if g:vice_gui_italic == 0
    let s:guiformat = substitute(s:guiformat, ',italic', '', '')
    let s:guiformat = substitute(s:guiformat, 'italic,', '', '')
    let s:guiformat = substitute(s:guiformat, 'italic', '', '')
  endif
  if g:vice_termcolors == 16
    let l:ctermfg = (has_key(a:style, 'fg') ? a:style.fg.cterm16 : 'NONE')
    let l:ctermbg = (has_key(a:style, 'bg') ? a:style.bg.cterm16 : 'NONE')
  else
    let l:ctermfg = (has_key(a:style, 'fg') ? a:style.fg.cterm : 'NONE')
    let l:ctermbg = (has_key(a:style, 'bg') ? a:style.bg.cterm : 'NONE')
  end
  execute 'highlight' a:group
    \ 'guifg='   (has_key(a:style, 'fg')      ? a:style.fg.gui   : 'NONE')
    \ 'guibg='   (has_key(a:style, 'bg')      ? a:style.bg.gui   : 'NONE')
    \ 'guisp='   (has_key(a:style, 'sp')      ? a:style.sp.gui   : 'NONE')
    \ 'gui='     (!empty(s:guiformat) ? s:guiformat   : 'NONE')
    \ 'ctermfg=' . l:ctermfg
    \ 'ctermbg=' . l:ctermbg
    \ 'cterm='   (!empty(s:ctermformat) ? s:ctermformat   : 'NONE')
endfunction

" Palettes
" --------


" let s:white       = { 'gui': '#FAFAFA', 'cterm': '15' }
" let s:black       = { 'gui': '#181818', 'cterm': '0' }
" let s:lightblack  = { 'gui': '#262626', 'cterm': '235' }
" let s:lightblack2 = { 'gui': '#303030', 'cterm': '236' }
" let s:darkblack   = { 'gui': '#121212', 'cterm': '233' }
" let s:grey        = { 'gui': '#747474', 'cterm': '243' }
" let s:lightgrey   = { 'gui': '#8D8D8D', 'cterm': '245' }
" let s:darkgrey    = { 'gui': '#676767', 'cterm': '241' }
" let s:warmgrey    = { 'gui': '#75715E', 'cterm': '59' }

 let s:black         = { 'gui': '#181818', 'cterm': '0' }
 let s:darkgray1     = { 'gui': '#212121', 'cterm': '8' }
 let s:darkgray2     = { 'gui': '#3E3E3E', 'cterm': '10' }
 let s:gray1         = { 'gui': '#696969', 'cterm': '11' }
 let s:gray2         = { 'gui': '#969696', 'cterm': '12' }
 let s:lightgray1    = { 'gui': '#C7C7C7', 'cterm': '14' }
 let s:lightgray2    = { 'gui': '#EDEDED', 'cterm': '7' }
 let s:white         = { 'gui': '#FAFAFA', 'cterm': '15' }

"let s:black         = { 'gui': '#18191F', 'cterm': '0' }
"let s:darkgray1     = { 'gui': '#212228', 'cterm': '8' }
"let s:darkgray2     = { 'gui': '#3E3F45', 'cterm': '10' }
"let s:gray1         = { 'gui': '#696A70', 'cterm': '11' }
"let s:gray2         = { 'gui': '#96979D', 'cterm': '12' }
"let s:lightgray1    = { 'gui': '#C7C8CE', 'cterm': '14' }
"let s:lightgray2    = { 'gui': '#EDEEF4', 'cterm': '7' }
"let s:white         = { 'gui': '#FAFBFF', 'cterm': '15' }

" 30 degree spaced
" let s:cyan        = { 'gui': '#31FCDA', 'cterm': '6' }
" let s:blue        = { 'gui': '#3153FC', 'cterm': '4' }
" let s:violet      = { 'gui': '#7531FC', 'cterm': '5' }
" let s:magenta     = { 'gui': '#FC31B8', 'cterm': '13' }
" let s:red         = { 'gui': '#FC3153', 'cterm': '1' }
" let s:orange      = { 'gui': '#FC7531', 'cterm': '9' }
" let s:yellow      = { 'gui': '#FCDA31', 'cterm': '3' }
" let s:green       = { 'gui': '#53FC31', 'cterm': '2' }

"45 degree space
" let s:cyan        = { 'gui': '#31FCDA', 'cterm': '6' }
" let s:blue        = { 'gui': '#3186FC', 'cterm': '4' }
" let s:violet      = { 'gui': '#7531FC', 'cterm': '5' }
" let s:magenta     = { 'gui': '#FC31EB', 'cterm': '13' }
" let s:red         = { 'gui': '#FC3153', 'cterm': '1' }
" let s:orange      = { 'gui': '#FCA731', 'cterm': '9' }
" let s:yellow      = { 'gui': '#B8FC31', 'cterm': '3' }
" let s:green       = { 'gui': '#31FC42', 'cterm': '2' }

" custom spaced hues
let s:red         = { 'gui': '#FC3153', 'cterm': '1' }
let s:green       = { 'gui': '#53FC31', 'cterm': '2' }
let s:yellow      = { 'gui': '#EBFC31', 'cterm': '3' }
let s:blue        = { 'gui': '#3186FC', 'cterm': '4' }
let s:violet      = { 'gui': '#8631FC', 'cterm': '5' }
let s:cyan        = { 'gui': '#31FCDA', 'cterm': '6' }
let s:orange      = { 'gui': '#FC7531', 'cterm': '9' }
let s:magenta     = { 'gui': '#FC31B8', 'cterm': '13' }

let s:darkred     = { 'gui': '#5f0000', 'cterm': '52' }

let s:addfg       = { 'gui': '#d7ffaf', 'cterm': '193' }
let s:addbg       = { 'gui': '#5f875f', 'cterm': '65' }
let s:delbg       = { 'gui': '#f75f5f', 'cterm': '167' }
let s:changefg    = { 'gui': '#d7d7ff', 'cterm': '189' }
let s:changebg    = { 'gui': '#5f5f87', 'cterm': '60' }

" Highlighting
" ------------

" editor
call s:h("Normal",        { "fg": s:white,      "bg": s:black })
call s:h("ColorColumn",   {                     "bg": s:darkgray1 })
call s:h("CursorColumn",  {                     "bg": s:darkgray2 })
call s:h("CursorLine",    {                     "bg": s:darkgray2 })
call s:h("NonText",       { "fg": s:gray2 })
call s:h("StatusLine",    { "fg": s:darkgray2,   "bg": s:black,        "format": "reverse" })
call s:h("StatusLineNC",  { "fg": s:gray1,   "bg": s:darkgray2,     "format": "reverse" })
call s:h("TabLine",       { "fg": s:white,      "bg": s:darkgray1,    "format": "reverse" })
call s:h("Visual",        {                     "bg": s:gray2 })
call s:h("Search",        { "fg": s:black,      "bg": s:yellow })
call s:h("MatchParen",    { "fg": s:black,      "bg": s:violet })
call s:h("Question",      { "fg": s:yellow })
call s:h("ModeMsg",       { "fg": s:yellow })
call s:h("MoreMsg",       { "fg": s:yellow })
call s:h("ErrorMsg",      { "fg": s:white,      "bg": s:red,          "format": "standout" })
call s:h("WarningMsg",    { "fg": s:red })
call s:h("VertSplit",     { "fg": s:gray1,   "bg": s:darkgray1 })
call s:h("LineNr",        { "fg": s:gray1,       "bg": s:darkgray1 })
call s:h("CursorLineNr",  { "fg": s:orange,     "bg": s:darkgray1 })
call s:h("SignColumn",    {                     "bg": s:darkgray1 })
call s:h("SpellBad",      { "fg": s:red,        "bg": s:darkgray1 })
call s:h("SpellCap",      { "fg": s:orange,     "bg": s:darkgray1 })

" misc
call s:h("SpecialKey",    { "fg": s:magenta })
call s:h("Title",         { "fg": s:yellow })
call s:h("Directory",     { "fg": s:cyan })

" diff
call s:h("DiffAdd",       { "fg": s:addfg,      "bg": s:addbg })
call s:h("DiffDelete",    { "fg": s:black,      "bg": s:delbg })
call s:h("DiffChange",    { "fg": s:changefg,   "bg": s:changebg })
call s:h("DiffText",      { "fg": s:black,      "bg": s:cyan })

" fold
call s:h("Folded",        { "fg": s:gray1,   "bg": s:darkgray1 })
call s:h("FoldColumn",    {                     "bg": s:darkgray1 })
"        Incsearch"

" popup menu
call s:h("Pmenu",         { "fg": s:darkgray1, "bg": s:white })
call s:h("PmenuSel",      { "fg": s:cyan,       "bg": s:black,        "format": "reverse,bold" })
call s:h("PmenuThumb",    { "fg": s:darkgray1, "bg": s:gray1 })
"        PmenuSbar"

" Generic Syntax Highlighting
" ===========================

"        *Comment         any comment
call s:h("Comment",       { "fg": s:gray1, "format": "italic" })

" Constant
" --------
"        *Constant        any constant
"         String          a string constant: 'this is a string'
"         Character       a character constant: 'c', '\n'
"         Number          a number constant: 234, 0xff
"         Boolean         a boolean constant: TRUE, false
"         Float           a floating point constant: 2.3e10"
call s:h("Constant",      { "fg": s:violet })
call s:h("String",        { "fg": s:yellow })
call s:h("Character",     { "fg": s:yellow })
call s:h("Number",        { "fg": s:violet })
call s:h("Boolean",       { "fg": s:violet })
call s:h("Float",         { "fg": s:violet })


" Identifier
" ----------
"        *Identifier      any variable name
"         Function        function name (also: methods for classes)
call s:h("Identifier",    { "fg": s:green })
call s:h("Function",      { "fg": s:green })


" Statement
" ---------
"        *Statement       any statement
"         Conditional     if, then, else, endif, switch, etc.
"         Repeat          for, do, while, etc.
"         Label           case, default, etc.
"         Operator        "sizeof", "+", "*", etc.
"         Keyword         any other keyword
"         Exception       try, catch, throw
call s:h("Statement",     { "fg": s:red })
call s:h("Operator",      { "fg": s:red })
call s:h("Label",         { "fg": s:blue })
call s:h("Keyword",       { "fg": s:blue })


" Preprocessor
" -----------
"        *PreProc         generic Preprocessor
"         Include         preprocessor #include
"         Define          preprocessor #define
"         Macro           same as Define
"         PreCondit       preprocessor #if, #else, #endif, etc.
call s:h("PreProc",       { "fg": s:green })
call s:h("Include",       { "fg": s:red })
call s:h("Define",        { "fg": s:violet })
call s:h("Macro",         { "fg": s:green })
call s:h("PreCondit",     { "fg": s:green })

" Type
" ----
"        *Type            int, long, char, etc.
"         StorageClass    static, register, volatile, etc.
"         Structure       struct, union, enum, etc.
"         Typedef         A typedef
call s:h("Type",          { "fg": s:cyan })
call s:h("Structure",     { "fg": s:cyan })
call s:h("StorageClass",  { "fg": s:cyan })
call s:h("Typedef",       { "fg": s:cyan })


" Special
" -------
"        *Special         any special symbol
"         SpecialChar     special character in a constant
"         Tag             you can use CTRL-] on this
"         Delimiter       character that needs attention
"         SpecialComment  special things inside a comment
"         Debug           debugging statements
call s:h("Special",       { "fg": s:red })
call s:h("SpecialChar",   { "fg": s:red })
call s:h("Delimiter",     { "fg": s:red })
call s:h("SpecialComment",{ "fg": s:red })
call s:h("Tag",           { "fg": s:red })

"        *Todo            anything that needs extra attention; TODO FIXME XXX
call s:h("Todo",          { "fg": s:orange,   "format": "bold,italic" })
"        *Underlined      text that stands out, HTML links
call s:h("Underlined",    { "fg": s:green })
"        *Ignore          left blank, hidden  |hl-Ignore|"
call s:h("Ignore",        {})
"        *Error           any erroneous construct"
call s:h("Error",         { "fg": s:white, "bg": s:magenta })

call s:h("Noise",     { "fg": s:gray1 })



" Language specific
" =================

" Javascript
" ---------
" vim-javascript
call s:h("jsArrowFunction",       { "fg": s:red })
call s:h("jsFunctionKey",         { "fg": s:green })
call s:h("jsFuncCall",            { "fg": s:green })
call s:h("jsFuncArgs",            { "fg": s:orange, "format": "italic" })
call s:h("jsFuncArgOperator",     { "fg": s:red })
call s:h("jsRestOperator",        { "fg": s:red, "format": "italic" })
call s:h("jsClassKeyword",        { "fg": s:cyan, "format": "italic" })
" CONSIDER: cyan, red or something else for jsClassMethodType (set,get,static)
call s:h("jsClassMethodType",     { "fg": s:cyan, "format": "italic" })
" CONSIDER: cyan, red or something else for jsExtendsKeyword
call s:h("jsExtendsKeyword",      { "fg": s:cyan, "format": "italic" })
call s:h("jsObjectProp",          { "fg": s:cyan })
call s:h("jsStorageClass",        { "fg": s:cyan, "format": "italic" })
" CONSIDER: since violet is primarily for constants
"   - violet for truthy(true) and magenta for falsey(false, undefined, null, NaN)
call s:h("jsNull",                { "fg": s:violet })
call s:h("jsUndefined",           { "fg": s:violet })
call s:h("jsEnvComment",          { "fg": s:gray1 })

" CONSIDER: making this a shade of grey
" call s:h("jsThis",                { "format": "italic" })

" CONSIDER:
"   - Same color for global, globalNode and any other global types or different
"     colors?
"   - Could shades of grey work here? Needs to be very visible if so
"   - Monokai pro seems to favor green for most of these, but Symbol is cyan
"
call s:h("jsGlobalObjects",       { "fg": s:blue })
call s:h("jsGlobalNodeObjects",   { "fg": s:blue })


" call s:h("jsPrototype",         { "fg": s:cyan })
" call s:h("jsExceptions",        { "fg": s:cyan })
" call s:h("jsFutureKeys",        { "fg": s:cyan })
" call s:h("jsBuiltins",          { "fg": s:cyan })
" call s:h("jsArgsObj",           { "fg": s:cyan })
" call s:h("jsStatic",            { "fg": s:cyan })
" call s:h("jsSuper",             { "fg": s:cyan })
" call s:h("jsDocTags",           { "fg": s:cyan,   "format": "italic" })

" yajs.vim
"




" " Java properties
" call s:h("jpropertiesIdentifier",   { "fg": s:magenta })
"
 " Vim command
call s:h("vimCommand",              { "fg": s:magenta })

"Html
call s:h("htmlTag",             { "fg": s:white })
call s:h("htmlEndTag",          { "fg": s:white })
call s:h("htmlTagName",         { "fg": s:magenta })
call s:h("htmlArg",             { "fg": s:green })
call s:h("htmlSpecialChar",     { "fg": s:violet })
"
" " Xml
" call s:h("/StackGrid>xmlTag",              { "fg": s:magenta })
" call s:h("xmlEndTag",           { "fg": s:magenta })
" call s:h("xmlTagName",          { "fg": s:orange })
" call s:h("xmlAttrib",           { "fg": s:green })
"
" CSS
call s:h("cssProp",             { "fg": s:yellow })
call s:h("cssUIAttr",           { "fg": s:yellow })
call s:h("cssFunctionName",     { "fg": s:cyan })
call s:h("cssColor",            { "fg": s:violet })
call s:h("cssPseudoClassId",    { "fg": s:violet })
call s:h("cssClassName",        { "fg": s:green })
call s:h("cssValueLength",      { "fg": s:violet })
call s:h("cssCommonAttr",       { "fg": s:magenta })
call s:h("cssBraces" ,          { "fg": s:white })
call s:h("cssClassNameDot",     { "fg": s:magenta })
call s:h("cssURL",              { "fg": s:orange, "format": "underline,italic" })
"
" " LESS
" call s:h("lessVariable",        { "fg": s:green })

" ruby
" call s:h("rubyInterpolationDelimiter",  {})
" call s:h("rubyInstanceVariable",        {})
" call s:h("rubyGlobalVariable",          {})
" call s:h("rubyClassVariable",           {})
" call s:h("rubyPseudoVariable",          {})
" call s:h("rubyFunction",                { "fg": s:green })
" call s:h("rubyStringDelimiter",         { "fg": s:yellow })
" call s:h("rubyRegexp",                  { "fg": s:yellow })
" call s:h("rubyRegexpDelimiter",         { "fg": s:yellow })
" call s:h("rubySymbol",                  { "fg": s:violet })
" call s:h("rubyEscape",                  { "fg": s:violet })
" call s:h("rubyInclude",                 { "fg": s:magenta })
" call s:h("rubyOperator",                { "fg": s:magenta })
" call s:h("rubyControl",                 { "fg": s:magenta })
" call s:h("rubyClass",                   { "fg": s:magenta })
" call s:h("rubyDefine",                  { "fg": s:magenta })
" call s:h("rubyException",               { "fg": s:magenta })
" call s:h("rubyRailsARAssociationMethod",{ "fg": s:orange })
" call s:h("rubyRailsARMethod",           { "fg": s:orange })
" call s:h("rubyRailsRenderMethod",       { "fg": s:orange })
" call s:h("rubyRailsMethod",             { "fg": s:orange })
" call s:h("rubyConstant",                { "fg": s:cyan })
" call s:h("rubyBlockArgument",           { "fg": s:orange })
" call s:h("rubyBlockParameter",          { "fg": s:orange })

" " eruby
" call s:h("erubyDelimiter",              {})
" call s:h("erubyRailsMethod",            { "fg": s:cyan })
"
" " c
" call s:h("cLabel",                      { "fg": s:magenta })
" call s:h("cStructure",                  { "fg": s:magenta })
" call s:h("cStorageClass",               { "fg": s:magenta })
" call s:h("cInclude",                    { "fg": s:green })
" call s:h("cDefine",                     { "fg": s:green })


" NerdTree
" --------

" call s:h("NERDTreeOpenable",        { "fg": s:yellow })
" call s:h("NERDTreeClosable",        { "fg": s:yellow })
" call s:h("NERDTreeHelp",            { "fg": s:yellow })
" call s:h("NERDTreeBookmarksHeader", { "fg": s:magenta })
" call s:h("NERDTreeBookmarksLeader", { "fg": s:black })
" call s:h("NERDTreeBookmarkName",    { "fg": s:yellow })
" call s:h("NERDTreeCWD",             { "fg": s:magenta })
" call s:h("NERDTreeUp",              { "fg": s:white })
" call s:h("NERDTreeDirSlash",        { "fg": s:gray1 })
" call s:h("NERDTreeDir",             { "fg": s:gray1 })

" " Syntastic
" " ---------
"
" hi! link SyntasticErrorSign Error
" call s:h("SyntasticWarningSign",    { "fg": s:darkgray1, "bg": s:orange })

" number line and fold line background conf
hi LineNr guibg=bg
hi foldcolumn guibg=bg
hi VertSplit guibg=bg guifg=bg
