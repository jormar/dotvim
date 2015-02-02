" --------------------------------------------------------
" Remapping the leader
"
let mapleader="\<Space>"
let g:mapleader="\<Space>"

" --------------------------------------------------------
" For Network oriented work set nocompatible mode
"
set nocompatible              " be iMproved, required
filetype off                  " required

" --------------------------------------------------------
" Plugins
" Gestionados con Vundle: https://github.com/gmarik/Vundle.vim
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    Plugin 'godlygeek/tabular'
    Plugin 'shawncplus/phpcomplete.vim'
    Plugin 'ervandew/supertab'
    Plugin 'joonty/vim-taggatron'
    " Plugin 'joonty/vdebug'
    Plugin 'brookhong/DBGPavim'
    Plugin 'tpope/vim-fugitive'
    "Plugin 'kien/ctrlp.vim'
    Plugin 'xolox/vim-misc'
    Plugin 'xolox/vim-session'
    Plugin 'scrooloose/nerdtree'
    Plugin 'vim-scripts/DoxygenToolkit.vim'

    Plugin 'scrooloose/syntastic'

    " TODO: explorar este plugin y sus prestaciones
    " Plugin 'garbas/vim-snipmate'

    " Theme
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'Guardian'
    Plugin 'desert256.vim'
    Plugin 'endel/vim-github-colorscheme'
    Plugin 'modess/vim-phpcolors'
    Plugin 'yearofmoo/Vim-Darkmate'

    Plugin 'vim-scripts/earendel'
    Plugin 'tpope/vim-vividchalk'

    " Estos estan muy buenos
    Plugin 'twerth/ir_black'
    Plugin 'vim-scripts/Wombat'
    Plugin 'nanotech/jellybeans.vim'

    " Por probar...
    Plugin 'jpo/vim-railscasts-theme'
    Plugin 'chriskempson/vim-tomorrow-theme'
    Plugin 'twilight'
call vundle#end()            " required
filetype plugin indent on    " required

set omnifunc=syntaxcomplete#Complete

"
" SuperTab: Tab Completition and Documentation
"
" use the SuperTab plugin to check the context of the code you are working on
" and choose the best for the situation
"
" au FileType python set omnifunc=pythoncomplete#Complete
" let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" let g:SuperTabContextDefaultCompletionType = "<c-n>"

"
" Taggatron: A simple tag file manager for Vim
"
let g:tagcommands = {
\    "php" : {"tagfile":".php.tags","args":"-R"}
\}
" \    "javascript" : {"tagfile":".js.tags","args":"-R"}

"
" Vdebug: Debuggin for vim
"
"   let g:vdebug_keymap = {
"   \    "run" : "<F5>",
"   \    "run_to_cursor" : "<F1>",
"   \    "step_over" : "<F2>",
"   \    "step_into" : "<F3>",
"   \    "step_out" : "<F4>",
"   \    "close" : "<F6>",
"   \    "detach" : "<F7>",
"   \    "set_breakpoint" : "<F10>",
"   \    "get_context" : "<F11>",
"   \    "eval_under_cursor" : "<F12>",
"   \    "eval_visual" : "<Leader>e",
"   \}
let g:vdebug_keymap = {
\   "get_context" : "<C-F11>"
\}

let g:vdebug_options = {
\   "break_on_open" : 0
\}
"let g:vdebug_keymap['get_context'] = '<C-F11>'
"let g:vdebug_options = {}
"let g:vdebug_options['break_on_open'] = 0

"
" Vim-Session (with vim-misc): Extended session management for Vim
"
let g:session_autosave = 'no'
let g:session_autoload = 'no'

"
" Syntastic:
"
"  Shorcut
noremap <leader>ch :SyntasticCheck<cr>

let g:syntastic_aggregate_errors = 1

" Pasive by Default
let g:syntastic_mode_map = { "mode": "passive", "active_filetypes": [], "passive_filetypes": [] }

" Javascript
let g:syntastic_javascript_checkers=["jshint"]
let g:syntastic_javascript_jshint_conf = '.jshintrc'

"
" Nerdtree:
"
" Cierra automáticamente vim si la única ventana que queda es NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Guarda el status de NERDTree
autocmd VimLeave * NERDTreeClose

nmap <expr> <leader>1 exists("b:NERDTreeType") ? ':NERDTreeToggle<cr>' : ':NERDTreeFocus<cr>'
nmap <expr> <leader>2 exists("b:NERDTreeType") ? ':NERDTreeToggle<cr>' : ':NERDTreeFind<cr>'

"
" Plugin DoxygenToolkit
"
let g:DoxygenToolkit_briefTag_pre=""
let g:DoxygenToolkit_paramTag_pre="@param String "

" --------------------------------------------------------
" Automatically indent when adding a curly bracket, etc.
"
set smartindent
set autoindent

" --------------------------------------------------------
" This is the official Python convention
"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smarttab
set wrap
set cursorline

" --------------------------------------------------------
" Minimal number of screen lines to keep above and below the cursor.
"
set scrolloff=4

" --------------------------------------------------------
" Use UTF-8.
"
set encoding=utf-8

" --------------------------------------------------------
" Show line number, cursor position.
"
set ruler

" --------------------------------------------------------
" Search
"
set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <F3> :set hlsearch!<CR>
nnoremap <silent> <leader>h :noh<CR>
map <silent> <leader><cr> :noh<cr>

" --------------------------------------------------------
" Highlight spaces at the end of lines
"
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+\%#\@<!$/

" --------------------------------------------------------
" Show editing mode
"
set showmode

" --------------------------------------------------------
" turn on line numbers
"
set number
set numberwidth=5
nnoremap <leader>number :set number!<CR>

" --------------------------------------------------------
" expand history limit
"
set history=400

" --------------------------------------------------------
" set text width only in text files
"
"call matchadd('ColorColumn', '\%80v', 100)

" --------------------------------------------------------
" Copy and paste to system clipboard
"
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p

" --------------------------------------------------------
" Shortcuts for views
"
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" --------------------------------------------------------
" In visual mode C-r gets the selected text and ofers replace
"
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" --------------------------------------------------------
" Status line
"
set laststatus=2
set statusline=
set statusline+=%-3.3n\  " buffer number
set statusline+=%f\  " filename
set statusline+=%h%m%r%w " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}]\ " file type
set statusline+=%=   " right align remainder
set statusline+=%-4(l:%l\ c:%c%V\ w:%{WordCount()}%)\ " line, character
set statusline+=%<%P\ %L " file position
set statusline+=%{fugitive#statusline()}

let g:word_count="<>"
function! WordCount()
    return g:word_count
endfunction
function! UpdateWordCount()
    let lnum = 1
    let n =         0
    while lnum <= line('$')
        let n = n + len(split(getline(lnum)))
        let lnum = lnum + 1
    endwhile
    let g:word_count = n
endfunction
" Update        the count when cursor is idle in command or insert mode.
" " Update when idle for 1000 msec (default is 4000 msec).
set updatetime=1000
augroup WordCounter
    au! CursorHold,CursorHoldI * call UpdateWordCount()
augroup END

" --------------------------------------------------------
" Directories
" Put backup and temporary files where they don't bother
"
set backupdir=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp
set directory=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp

" --------------------------------------------------------
"  Sudo tee trick
"
"map <leader>ws :w !sudo tee%<cr>
map <leader>ww :w<cr>

" --------------------------------------------------------
"  Mouse
"
set mouse=a

" --------------------------------------------------------
"  Sessions
"
"   Defaults: blank,buffers,curdir,folds,help,options,tabpages,winsize
set ssop-=blank
set ssop-=options
set ssop+=resize
set ssop+=winpos
set ssop-=localoptions

" --------------------------------------------------------
" Session Plugin Shortcuts
"
map <leader>n :ls<cr>
map <leader>ss :SaveSession<cr>
map <leader>so :OpenSession!<cr>

" --------------------------------------------------------
"  Misc
"
set modeline
set wildmenu
noremap <leader>qq :qall<cr>
noremap <leader>wq :wqall<cr>

" Abre el archivo .vimrc
noremap <leader>vrc :vsplit ~/.vimrc<cr>

" Re-carga el archivo actual como un .vimrc
noremap <leader>% :so %<cr>

" Re-carga el archivo .vimrc
noremap <leader>vso :so ~/.vimrc<cr>

" Abre definición de la palabra en una ventana
noremap <leader>d <c-w><c-]>

" Abre definición de la palabra en un Tab nuevo
noremap <leader>D <c-w><c-]><c-w>T

" Movimiento rápido hacia un Tab específico
noremap <leader><leader>1 :tabp<cr>
noremap <leader><leader>2 :tabn<cr>

" Movimiento rápido hacia un Tab específico con tecla Alt
noremap <A-1> :tabfirst<cr>
noremap <A-2> :tabfirst<cr>:tabn 2<cr>
noremap <A-3> :tabfirst<cr>:tabn 3<cr>
noremap <A-4> :tabfirst<cr>:tabn 4<cr>
noremap <A-5> :tabfirst<cr>:tabn 5<cr>
noremap <A-6> :tabfirst<cr>:tabn 6<cr>
noremap <A-7> :tabfirst<cr>:tabn 7<cr>
noremap <A-8> :tabfirst<cr>:tabn 8<cr>
noremap <A-9> :tabfirst<cr>:tabn 9<cr>
noremap <A-0> :tabfirst<cr>:tabn 10<cr>

" Soporte para vim en consola, y tecla Alt
if !has('gui_running')
    noremap <Esc>1 :tabfirst<cr>
    noremap <Esc>2 :tabfirst<cr>:tabn 2<cr>
    noremap <Esc>3 :tabfirst<cr>:tabn 3<cr>
    noremap <Esc>4 :tabfirst<cr>:tabn 4<cr>
    noremap <Esc>5 :tabfirst<cr>:tabn 5<cr>
    noremap <Esc>6 :tabfirst<cr>:tabn 6<cr>
    noremap <Esc>7 :tabfirst<cr>:tabn 7<cr>
    noremap <Esc>8 :tabfirst<cr>:tabn 8<cr>
    noremap <Esc>9 :tabfirst<cr>:tabn 9<cr>
    noremap <Esc>0 :tabfirst<cr>:tabn 10<cr>
endif


" --------------------------------------------------------
"  Busqueda de palabras en archivos del directorio
"
vnoremap <leader>find "hy:lvimgrep /<C-r>h/j ** <Bar> lw<left><left><left><left><left><left><left>
nnoremap <leader>find :execute "lvimgrep /" . expand("<cword>") . "/j **" <Bar> lw<left><left><left><left><left><left><left><left>

" --------------------------------------------------------
"  Alineación de texto en base a un caracter
"
vnoremap <leader>alig :Tabularize /\zs/l0<left><left><left><left><left><left>

" --------------------------------------------------------
"  Theme
"
syntax enable

"
" Set vim to 256 colors
"
set t_Co=256

if has('gui_running')
    " --------------------------------------------------------
    " Font
    "
    set guifont=Monaco
    " --------------------------------------------------------
    " Theme
    "
    colorscheme Tomorrow-Night-Bright
    " --------------------------------------------------------
    " Remove Toobar in gui
    "
    set guioptions-=T
    " --------------------------------------------------------
    " Remove menu bar in gui
    "
    set guioptions-=m
    " --------------------------------------------------------
    "  Add tab pages
    "
    set guioptions+=e
    " --------------------------------------------------------
    "  GUI tab label
    "
    " set guitablabel=%M\ %t
else
    set background=light
    colorscheme desert256
endif

