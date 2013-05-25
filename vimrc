set nocompatible          " We're running Vim, not Vi!
call pathogen#infect()

syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

augroup myfiletypes
  autocmd BufRead *.rb setlocal ai tw=78 nosi ts=2 sts=2 sw=2 et
  autocmd BufRead *.js setlocal ai tw=78 nosi ts=2 sts=2 sw=2 et
  autocmd BufRead *.html setlocal ai tw=78 nosi ts=2 sts=2 sw=2 et
  autocmd FileType ruby,vim,eruby,yaml,rhtml setlocal ai tw=78 nosi ts=2 sts=2 sw=2 et
augroup END

au BufNewFile,BufRead *.m,*.h set ft=objc


if has("gui_running")
  set lines=999
  colorscheme vibrantink
  "guifont=Andale_Mono:h14.00
  set antialias termencoding=macroman gfn=Monaco:h16
endif

command -bar -nargs=1 OpenURL :!firefox <args>
helptags ~/.vim/doc
  

set visualbell
set hlsearch 

set tabstop=2
set shiftwidth=2
set iskeyword+=_,$,@,%,# " Not word dividers
set wildmenu             " Auto completion
set showcmd              " show current command in status bar
set showmatch            " show matching parentheses etc.
let mapleader = ","

set grepprg=ack
set grepformat=%f:%l:%m

"set smarttab
set autoindent
set expandtab
autocmd BufRead,BufNewFile Makefile* set noet " ... except for a Makefile
autocmd FileType make     set noexpandtab
autocmd FileType python   set noexpandtab

set encoding=utf-8
set fileencoding=utf-8

set ignorecase
set smartcase
set wildignore=*.o,*.obj,*.bak,*.exe

nmap <C-J> :tabprevious<cr>
nmap <C-K> :tabnext<cr>
map  <C-J> :tabprevious<cr>
map  <C-K> :tabnext<cr>
imap <C-J> <ESC>:tabprevious<cr>i
imap <C-K> <ESC>:tabnext<cr>i


" indenting in visual mode
vnoremap < <gv
vnoremap > >gv


let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 70


map <leader>f :FuzzyFinderFile<CR>
"map <leader>t :FuzzyFinderTextMate<CR>
map <leader>b :FuzzyFinderBuffer<CR>
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>3 :b#<CR>
"Change working directory to directory of currently viewed file
map <leader>cd :lcd %:p:h<CR>

vmap <leader>rv "zdi#{<C-R>z}<ESC>
vmap <leader>er "zdi<%= <C-R>z %><ESC>

vmap <leader>t /test<ESC>idef <ESC>lev$:s/ /_/g<ESC>xxi  <ESC>llllr oend<ESC>


nnoremap <Leader>u :diffupdate<cr>
nnoremap <Leader>g :diffget<cr>
nnoremap <Leader>p :diffput<cr> 


" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\\\\ ,eol:¬
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" if has("autocmd")
"   " Enable filetype detection
"   filetype plugin indent on
"  
"   " Restore cursor position
"   autocmd BufReadPost *
"     \\\\\\\\ if line("'\\\\\\\\"") > 1 && line("'\\\\\\\\"") <= line("$") |
"     \\\\\\\\   exe "normal! g`\\\\\\\\"" |
"     \\\\\\\\ endif
" endif
if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif

nmap <leader>v :tabedit $MYVIMRC<CR>

