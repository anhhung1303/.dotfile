
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","
let g:mapleader = ","

" {{{ === Debug
nnoremap <leader>D :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}

"{{{ === Align
map ga <Plug>(EasyAlign)| " Start interactive EasyAlign in visual mode (e.g. vipga)
" }}}

"{{{ === Highlight
noremap <silent> * :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
"map <silent> <C-C> :noh<CR><esc>
"map <silent> <C-C> <esc><C-C>
"map <silent> <C-C> <esc><C-C>

"noremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" }}}

"{{{ === Rg
nnoremap <silent> <leader>R :call <SID>RgCurrentWord()<CR>
function! s:RgCurrentWord()
    let @/ = ''
    let wordUnderCursor = expand("<cword>")
    execute 'Rg '. wordUnderCursor
endfunction

vnoremap <silent> <leader>R :call <SID>RgCurrentSelected()<CR>
function! s:RgCurrentSelected()
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)
  if len(lines) == 0
    return ''
  endif
  let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1:]
  let currentSelected = join(lines, "\n")
  execute 'Rg '. currentSelected
endfunction
" }}}

"{{{ === Git
" Open git blame for current file
noremap <leader>b :<C-U>Gblame<cr>

" }}}

"{{{ === NERDCommenter
map <C-_> <plug>NERDCommenterToggle| " map <C-/> to use toggle comment
map <C-_> <plug>NERDCommenterToggle| " map <C-/> to use toggle comment
" }}}

"{{{ === NERDTree
nnoremap <leader>c :NERDTreeToggle<CR>
noremap <silent><leader>c :CocCommand explorer<CR>
" }}}

"{{{ === Fuzzy search
noremap <leader>g :GFiles<cr>|          " fuzzy find files under version control in the working directory (where you launched Vim from)"
noremap <leader>f :Files<cr>|           " fuzzy find files in the working directory (where you launched Vim from)
noremap <leader>r :Rg |                 " fuzzy find text in the working directory
noremap <leader>h :History<cr>|         " fuzzy find files from most recent files
noremap <leader>m :Maps<cr>|            " fuzzy find key mappings
noremap <leader>H :Helptags!<cr>|       " fuzzy find documentation
noremap <leader>C :<C-U>Commands!<cr>|  " fuzzy find documentation
noremap <leader>l :<C-U>Lines<cr>|      " fuzzy find line
" }}}

" {{{ GitGutter
nmap <space>hd <Plug>(GitGutterPreviewHunk)
nmap <space>hn <Plug>(GitGutterNextHunk)
nmap <space>hp <Plug>(GitGutterPrevHunk)
nmap <space>hs <Plug>(GitGutterStageHunk)
nmap <space>hu <Plug>(GitGutterUndoHunk)
"}}}

"{{{ === Yank
" Note: some register location
" 0 - the last yank
" " - the last delete
" / - the last search
" * - the system clipboard (most of the time)
" - - blackhole

"vnoremap y "*y| " Copy to clipboard
"vnoremap p "*p| " Paste from clipboard

" Copy (current path + current line number) to clipboard
nnoremap <leader>yp :let @* = expand("%") . ":" . line(".")<CR>
nnoremap <leader>yP :let @* = expand("%:p") . ":" . line(".")<CR>

" Copy (current path + current line number + current line) to clipboard
"nnoremap <silent><leader>Fp :norm yy<CR>:let @* = expand("%") . ":" . line(".") . ":" . @"<CR>
"nnoremap <silent><leader>FP :norm yy<CR>:let @* = expand("%:p") . ":" . line(".") . ":" . @"<CR>
" }}}

"{{{ === Coc

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <space>rn <Plug>(coc-rename)

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>ia  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>ie  :<C-u>CocList extensions<cr>
" Open coc list
nnoremap <silent> <leader>il  :<C-u>CocList<CR>
" Open coc commands
nnoremap <silent> <leader>ic  :<C-u>CocList commands<CR>
"}}}

"{{{ === Autocomplete
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <CR pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
"}}}

"{{{ === Config files
nnoremap <Leader>ev :<C-u>e $MYVIMRC<CR>|                  " quick edit vimrc
nnoremap <Leader>sv :<C-u>source $MYVIMRC<CR>|             " quick source vimrc (after edit normally)
nnoremap <Leader>ec :<C-u>CocConfig<CR>|                   " quick edit coc config
"}}}

""{{{ === Visual recent pasted code
nnoremap gV `[v`]
"}}}

"{{{ === Folding
nnoremap <leader><space> za   " Open and close folds
"}}}

"{{{ === easy motion

map <leader>tc :tabclose<CR>
set pastetoggle=<F3>
nnoremap <leader><space> :nohlsearch<CR>
noremap B ^
noremap E $
noremap gV `[v`]
autocmd FileType text,markdown let b:vcm_tab_complete = 'dict'

nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"nnoremap <TAB> >>
"nnoremap <S-TAB> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<F6>'
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
map s <Plug>(easymotion-bd-f)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-bd-jk)

let g:ctrlp_prompt_mappings = {
            \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
            \ 'AcceptSelection("t")': ['<cr>'],
            \ }


"}}}

"{{{ === Quick hl
"nmap <Space>m <Plug>(quickhl-manual-this)
"xmap <Space>m <Plug>(quickhl-manual-this)

nmap <Space>w <Plug>(quickhl-manual-this-whole-word)
xmap <Space>w <Plug>(quickhl-manual-this-whole-word)

"nmap <Space>c <Plug>(quickhl-manual-clear)
"vmap <Space>c <Plug>(quickhl-manual-clear)

nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

"nmap <Space>j <Plug>(quickhl-cword-toggle)
"nmap <Space>] <Plug>(quickhl-tag-toggle)

" }}}

"reload current file
map <F4> :edit!<CR>

"reload all files
map <F5> :tabdo e!<CR>
