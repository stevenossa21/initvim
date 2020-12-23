syntax on
set noerrorbells
set tabstop=2
set softtabstop=2
set smarttab
set cindent
set tabstop=4
set shiftwidth=4
set expandtab  " Insertar espacios en lugar de <Tab>s
set smartindent
set noswapfile
set incsearch
set title  " Muestra el tombre del archivo en la ventana de la terminal
set number  " Muestra los números de las líneas
set ruler
set clipboard=unnamed
set showmatch
set showcmd
set encoding=utf-8
set sw=2
"set laststatus
set relativenumber
if has('mouse')
   set mouse=a
 endif

set nowrap  " No dividir la línea si es muy larga
set cursorline  " Resalta la línea actual
set colorcolumn=120  " Muestra la columna límite a 120 caracteres

" Indentación a 2 espacios
set shiftwidth=2
set shiftround

set hidden  " Permitir cambiar de buffers sin tener que guardarlos
set ignorecase  " Ignorar mayúsculas al hacer una búsqueda
set smartcase  " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas
set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español
set termguicolors  " Activa true colors en la terminal set background=dark  " Fondo del tema: light o dark
nnoremap <C-s> :w<CR> " guardar con ctrl s

set rtp +=~/.vim
call plug#begin('~/.vim/plugged')

"IDE
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'                   "Comment lines <leader>cc or <leader>c<leader>
Plug 'tmhedberg/matchit'                         "Navigate between brackets with %
Plug 'Yggdroot/indentLine'                       "Muestra identacion
Plug 'neoclide/coc.nvim', {'branch': 'release'}  "autocompleta
Plug 'easymotion/vim-easymotion'                 "<leader>s para buscar en pantalla
Plug 'scrooloose/nerdtree'                       "muestra arbol de archivos
Plug 'mattn/emmet-vim'                           "autocompleta html ,,
Plug 'Xuyuanp/nerdtree-git-plugin'               "Muestra estados de git en el arbol
Plug 'christoomey/vim-tmux-navigator'            "Navegar entre buffers con ctrl h l
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" Themes
"Plug 'crusoexia/vim-monokai'
Plug 'hardcoreplayers/gruvbox9'
"Plug 'morhetz/gruvbox'
"Plug 'franbach/miramare'
"Plug 'dikiaap/minimalist'
"IndentLine
let g:indentLine_color_term = 239
"let g:indentLine_bgcolor_term = 202
"let g:indentLine_bgcolor_gui = '#FF5F00'
let g:indentLine_char = '┊'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
Plug 'posva/vim-vue'                                         "Vue syntax

"appearence
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'

call plug#end()

colorscheme gruvbox9
hi Normal guibg=NONE ctermbg=NONE
let g:vue_pre_processors = ['pug', 'scss']
set background=dark
 "colorscheme gruvbox
 "colorscheme monokai
 let g:gruvbox_transp_bg = 1

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

set t_Co=256
filetype plugin on

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

let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:prettier#exec_cmd_path = '~/.config/nvim/plugged/vim-prettier/autoload/'
let mapleader = " "
nmap <Leader>py <Plug>(Prettier)
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>y "+y
noremap <Leader>P "+p
let g:user_emmet_leader_key=','

" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
if &term == 'xterm-256color' || &term == 'screen-256color'
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
endif

if exists('$TMUX')
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
endif

map  <C-m> :tabn<CR> 
map  <S-m> :tabp<CR>
map  <C-n> :tabnew<CR>

"coc

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


"Python
"" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

"4;2m
let &t_TI = ""
let &t_TE = ""

:imap jc <Esc>
