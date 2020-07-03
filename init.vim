set title  " Muestra el tombre del archivo en la ventana de la terminal
set number  " Muestra los números de las líneas
set mouse=a  " Permite la integración del mouse (seleccionar texto, mover el cursor)

set nowrap  " No dividir la línea si es muy larga

set cursorline  " Resalta la línea actual
set colorcolumn=120  " Muestra la columna límite a 120 caracteres

" Indentación a 2 espacios
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab  " Insertar espacios en lugar de <Tab>s

set hidden  " Permitir cambiar de buffers sin tener que guardarlos

set ignorecase  " Ignorar mayúsculas al hacer una búsqueda
set smartcase  " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas
set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español

set termguicolors  " Activa true colors en la terminal
set background=dark  " Fondo del tema: light o dark
nnoremap <C-s> :w<CR> " guardar con ctrl s

set rtp +=~/.config/nvim
call plug#begin('~/.config/nvim/plugged')
"IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
" Themes
" Plug 'morhetz/gruvbox'
"Plug 'franbach/miramare'
Plug 'dikiaap/minimalist'
call plug#end()
" colorscheme gruvbox

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
syntax on
colorscheme minimalist

let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let mapleader=" "
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>q :q<CR>
nmap <Leader>w :s<CR>
let g:user_emmet_leader_key=','
