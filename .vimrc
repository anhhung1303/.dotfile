"VIM Configuration File
" Description: Optimized for C++ development.
" Author: Vo Anh Hung
"
execute pathogen#infect()
filetype plugin indent on
set runtimepath^=~/.vim/bundle/ctrlp.vim
"set t_Co=256
"let g:solarized_termcolors=256
"let g:solarized_termtrans = 1
syntax enable
"set background=dark
colorscheme monokai

let mapleader = ","
let g:mapleader = ","

set cindent
set cino+=N-s,g0,l1

" Auto oepn nerdtree new tab
"autocmd vimenter * NERDTree
"autocmd BufWinEnter * NERDTreeMirror
"autocmd BufWinEnter * :TagbarToggle

"let g:tagbar_left = 0
"nnoremap <silent> <F8> :TagbarToggle<CR>

" Show indent dots
set list listchars=tab:»-,trail:·,extends:»,precedes:«

set backspace=indent,eol,start

" YCM Configuration
"let g:ycm_global_ycm_extra_conf = '/home/hungva/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '/Users/finaldevil/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_enable_diagnostic_highlighting = 1

nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap gic :YcmCompleter GoToInclude<CR>
nnoremap ygt :YcmCompleter GetType<CR>
nnoremap ygp :YcmCompleter GetParent<CR>
nnoremap yfi :YcmCompleter FixIt<CR>

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set tw=0
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
"set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
"set textwidth=120
syntax on
" colorscheme wombat256
" turn line numbers on
set number
set rnu
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

"set tags+=~/.vim/tags/boost
set tags+=~/vnlab/tags

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

map * :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>

map <leader>tc :tabclose<CR>
" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i

set pastetoggle=<F3>
" switch between header/source with F4
map <F4> :e<CR>
" recreate tags file with F5
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" create doxygen comment
"map <F6> :Dox<CR>
" build using makeprg with <F7>
"map <F7> :make<CR>
" build using makeprg with <S-F7>
"map <S-F7> :make clean all<CR>
" goto definition with F12
map <F9> :cprev<CR>
map <F10> :cnext<CR>
map <F12> <C-]>

" in diff mode we use the spell check keys for merging
if &diff
  ” diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " spell settings
  ":setlocal spell spelllang=en
  " set the spellfile - folders must exist
  set spellfile=~/.vim/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
endif

set cursorline
set showmatch
set showcmd
set hlsearch
set incsearch

nnoremap <leader><space> :nohlsearch<CR>
noremap B ^
noremap E $
noremap gV `[v`]
autocmd FileType text,markdown let b:vcm_tab_complete = 'dict'

"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <TAB> >>
nnoremap <S-TAB> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv

" vim air-line
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<F6>'

" vim cpp enhanced highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
map s <Plug>(easymotion-bd-f)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-bd-jk)

" Ctrlp open file new tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }


" Vim quick highlight
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)

nmap <Space>w <Plug>(quickhl-manual-this-whole-word)
xmap <Space>w <Plug>(quickhl-manual-this-whole-word)

nmap <Space>c <Plug>(quickhl-manual-clear)
vmap <Space>c <Plug>(quickhl-manual-clear)

nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)
