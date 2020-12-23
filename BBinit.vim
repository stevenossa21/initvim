" ---------------------------------------------------------------------------------------------------------------
"    _           _                                             _           _      _  _  _      _           _     
"   (_) _       (_)                                           (_)         (_)    (_)(_)(_)    (_) _     _ (_)    
"   (_)(_)_     (_)       _  _  _  _           _  _  _        (_)         (_)       (_)       (_)(_)   (_)(_)    
"   (_)  (_)_   (_)      (_)(_)(_)(_)_      _ (_)(_)(_) _     (_)_       _(_)       (_)       (_) (_)_(_) (_)    
"   (_)    (_)_ (_)     (_) _  _  _ (_)    (_)         (_)      (_)     (_)         (_)       (_)   (_)   (_)    
"   (_)      (_)(_)     (_)(_)(_)(_)(_)    (_)         (_)       (_)   (_)          (_)       (_)         (_)    
"   (_)         (_)     (_)_  _  _  _      (_) _  _  _ (_)        (_)_(_)         _ (_) _     (_)         (_)    
"   (_)         (_)       (_)(_)(_)(_)        (_)(_)(_)             (_)          (_)(_)(_)    (_)         (_)    
"                                                                                                                
" ---------------------------------------------------------------------------------------------------------------
"
"  Neovim config file
"  By 0phoff
"  Version 2.3
"
" ---------------------------------------------------------------------------------------------------------------

" Plugins               {{{

let emmetFiles = ["html","xhtml","xml","xaml","xsd","xsl","css","less","scss","sass","styl","svg"]

" Internal Plugins

set rtp +=~/.config/nvim
call plug#begin('~/.config/nvim/plugged')
    " Syntax Plugins
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    " coc config
    let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',   
      \ 'coc-tsserver',
      \ 'coc-eslint',   
      \ 'coc-prettier',
      \'coc-json',
      \ ]

    Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

    Plug 'Yggdroot/indentLine'
      let g:indentLine_color_term = 239
      "let g:indentLine_bgcolor_term = 202
      "let g:indentLine_bgcolor_gui = '#FF5F00'
      let g:indentLine_char = '┊'
      "let g:indentLine_char_list = ['|', '¦', '┆', '┊']
    Plug 'posva/vim-vue'                                            "Vue syntax
    Plug 'octol/vim-cpp-enhanced-highlight'                         " C++ 11/14/17
    Plug 'petRUShka/vim-opencl'                                     " OpenCL
    Plug 'othree/html5.vim', {'for': 'html'}                        " Html 5
    Plug 'JulesWang/css.vim', {'for': ['css','styl','scss','less']} " Css
    Plug 'wavded/vim-stylus', {'for': 'styl'}                       " Stylus
    Plug 'pangloss/vim-javascript', {'for': 'javascript'}           " Js
    Plug 'elzr/vim-json',{'for': 'json'}                            " Json
    Plug 'stephpy/vim-yaml', {'for': 'yaml'}                        " Yaml
    Plug 'kurayama/systemd-vim-syntax'                              " Systemd
    Plug 'keith/tmux.vim'                                           " Tmux

    "Plug 'fatih/vim-go'                                             " GO

    " Functional Plugins
    Plug 'scrooloose/nerdtree'                                      " Project tree viewer
    Plug 'Shougo/Denite.nvim', {'do': ':UpdateRemotePlugins' }      " Project Fuzzy Finder
    Plug 'christoomey/vim-tmux-navigator'                           " Use ctrl-hjkl to navigate vim & tmux
    Plug 'mattn/emmet-vim', {'for': emmetFiles}                     " Emmet fast html-tag creation

    " Visual Plugins
    Plug 'itchyny/lightline.vim'                                    " Lightweight and customizable statusline
    Plug 'morhetz/gruvbox'                                          " Awesome Colortheme
    Plug 'shinchu/lightline-gruvbox.vim'                            " Colortheme for lightline
    Plug 'ryanoasis/vim-devicons'                                   " Fancy Icons

    " Custom Plugins
    Plug '~/.config/nvim/scripts/ClosePair'
    Plug '~/.config/nvim/scripts/ColDevicons'
call plug#end()

" ----------------------}}}


" Plugin Settings       {{{

" Json
let g:vim_json_syntax_conceal = 0

" Gruvbox
set bg=dark
set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox

" NerdTree
nnoremap <silent> <Leader>t :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMapOpenSplit = 'h'
let g:NERDTreeMapOpenVSplit = 'v'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeHighlightFolders = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
highlight! link NERDTreeDir Identifier
highlight! link NERDTreeOpenable NonText
highlight! link NERDTreeClosable NonText
highlight! link NERDTreeExecFile Normal

" Denite
nnoremap <silent> <Leader>ff :Denite -auto-resize -no-statusline -cursor-wrap file_rec<CR>
"nnoremap <silent> <Leader>fa :Denite -auto-resize -no-statusline -cursor-wrap file<CR>
nnoremap <silent> <Leader>fd :Denite -auto-resize -no-statusline -cursor-wrap directory_rec<CR>
nnoremap <silent> <Leader>fg :Denite -auto-resize -no-statusline -cursor-wrap grep<CR>
highlight! link deniteMatchedChar CursorLineNr
highlight! link deniteMatchedRange Identifier
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '--ignore=*.jpg', '--ignore=*.png', '--ignore=*.bmp', '--ignore=*.gif', '--ignore=*.webp', '--ignore=*.pdf', '--ignore=*.eps', '--ignore=*.svg', '--ignore=*.mp4', '--ignore=*.avi', '--ignore=*.mov', '--ignore=*.mkv', '--ignore=*.webm', '-g', ''])
"call denite#custom#var('file', 'command', ['ag', '-r', '--follow', '--nocolor', '--nogroup', '-u', '-g', ''])
"call denite#custom#source('file', 'converters', ['devicons_denite_converter'])
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>'      , 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>'  , 'noremap')
call denite#custom#map('insert', '<C-e>', '<denite:do_action:switch>'       , 'noremap')
call denite#custom#map('insert', '<C-t>', '<denite:do_action:tabswitch>'    , 'noremap')
call denite#custom#map('insert', '<C-h>', '<denite:do_action:splitswitch>'  , 'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplitswitch>' , 'noremap')
call denite#custom#map('insert', 'jj'   , '<denite:enter_mode:normal>'      , 'noremap')
call denite#custom#map('insert', 'ZZ'   , '<denite:quit>'                   , 'noremap')
call denite#custom#map('normal', 'ZZ'   , '<denite:quit>'                   , 'noremap')
augroup Denite
    autocmd!
    autocmd BufEnter,BufWinEnter \[denite\]* :call s:DeniteEnter()
    autocmd BufLeave \[denite\]* :call s:DeniteLeave()
augroup END
    function! s:DeniteEnter()   "{{{
        highlight! CursorLine guibg=#3a3a3a
    endfunction                 "}}}
    function! s:DeniteLeave()   "{{{
        highlight! CursorLine NONE
    endfunction                 "}}}

" Lightline
set laststatus=2        " Always show statusbar
set noshowmode          " Dont show mode -> already in lightline
let g:lightline = {
    \ 'colorscheme' : 'gruvbox',
    \ 'active': {
    \   'left':     [ ['mode', 'paste'],
    \                 ['filenameMod'] ],
    \   'right':    [ ['linenumber'],
    \                 [''],
    \                 ['filetype', 'projectPath', 'rootDir'] ]
    \ },
    \ 'component': {
    \   'mode': '%{&filetype!="nerdtree"?lightline#mode():""}',
    \   'filetype': '%{&filetype!="nerdtree" && expand("%:t")!="[denite]"?&filetype:""}'
    \ },
    \ 'component_visible_condition': {
    \   'mode': '(&filetype!="nerdtree")',
    \   'filetype': '(&filetype!="nerdtree" && expand("%:t")!="[denite]")'
    \ },
    \ 'component_expand': {
    \   'filenameMod': 'LLfilenameMod'
    \ },
    \ 'component_function': {
    \   'projectPath': "LLpath",
    \   'rootDir': "LLroot",
    \   'linenumber': "LLline"
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }
    " ----------------------}}}

" Custom Settings       {{{

" TEMPORARY
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1                         " Change Cursor Shape Depending on Mode -> syntax will change in future

" Highlight current line number of current buffer
hi CursorLine NONE
hi CursorLineNR cterm=bold ctermbg=NONE guibg=NONE

set history=250             " Increase history
set encoding=utf-8          " Set encoding
set spelllang=en            " Set default spelllang

set nu                      " Set linenumbers
set rnu                     " Relative numbers
set cul                     " Highlight current line
set showcmd                 " Show command
set conceallevel=0          " Don't hide text
set linebreak               " Only wrap at whitespace
set tw=2147483647           " Don't auto wrap long lines (big Number for ftplugin)

set ignorecase              " Searching is case insensitive
set smartcase               " Searching is case sensitive if there is a capital
set incsearch               " Set incremetal searching
set hlsearch                " Highlight search

set splitbelow              " Split below current
set splitright              " Split right of current

set ttimeoutlen=3           " Fix slow mode switching
set timeoutlen=750          " 750ms for keystroke combo's

set mouse=a                 " Permite la integración del mouse (seleccionar texto, mover el cursor)
set ruler
set clipboard=unnamed


set foldenable              " Enable folding
set foldlevelstart=99       " Open all folds when opening a file
set foldnestmax=10          " Maximum nested folds
set foldmethod=marker       " Create folds based on markers in code
set foldmarker={,}          " Markers are { }
set foldtext=IndFoldTxt()   " Indent Fold Text
    function! IndFoldTxt()    "{{{
        let indent = repeat(' ', indent(v:foldstart))
        let txt = foldtext()
        return indent.txt
    endfunction             "}}}

set tabstop=2               " Tabs are 4 characters long
set softtabstop=-1          " when entering tab -> #shiftwidth spaces are inserted
set shiftwidth=2
set expandtab               " Expand tab to spaces
set autoindent              " Auto indent code

set path=.,**               " Search down into subfolders
set wildmenu                " Display all matching files when tabbing
set completeopt=menu        " Set completion to only show popup menu & not preview scratch buffer

" ----------------------}}}

" Command Groups        {{{

"autocmd VimEnter * call ColDevicons_init()

" Insert Mode enter/leave
augroup InserModeCmds
    autocmd!
    autocmd InsertEnter * :call s:IEnter()
    autocmd InsertLeave,WinLeave * :call s:ILeave()
augroup END

function! s:IEnter()
    let b:last_tol=&timeoutlen
    setlocal timeoutlen=200
endfunction

function! s:ILeave()
    if exists('b:last_tol')
        let &l:timeoutlen=b:last_tol
    endif
endfunction


" vim-prettier
" Max line length that prettier will wrap on: a number or 'auto' (use
" textwidth).
" default: 'auto'
let g:prettier#config#print_width = 'auto'

" number of spaces per indentation level: a number or 'auto' (use
" softtabstop)
" default: 'auto'
let g:prettier#config#tab_width = 'auto'

" use tabs instead of spaces: true, false, or auto (use the expandtab setting).
" default: 'auto'
let g:prettier#config#use_tabs = 'auto'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown or empty string
" (let prettier choose).
" default: ''
let g:prettier#config#parser = ''

" cli-override|file-override|prefer-file
" default: 'file-override'
let g:prettier#config#config_precedence = 'file-override'

" always|never|preserve
" default: 'preserve'
let g:prettier#config#prose_wrap = 'preserve'

" css|strict|ignore
" default: 'css'
let g:prettier#config#html_whitespace_sensitivity = 'css'

" false|true
" default: 'false'
let g:prettier#config#require_pragma = 'false'

let mapleader = " "
nmap <Leader>py <Plug>(Prettier)
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
let g:user_emmet_leader_key=','
