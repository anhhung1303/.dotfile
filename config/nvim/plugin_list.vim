"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-surround'

Plug 'rhysd/git-messenger.vim'

" align text ga=
Plug 'junegunn/vim-easy-align'

" Macro editing: <leader>q + register
Plug 'zdcthomas/medit'

" Vim wiki <leader>ww to open
" Plug 'vimwiki/vimwiki'

" Preview markdown live: :Mark
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Vim plugin that provides additional text objects
" Plug 'wellle/targets.vim'

" Some Git stuff
Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-fugitive'

" ctags bar
"Plug 'majutsushi/tagbar'

" vim-tmux-navigation
"Plug 'christoomey/vim-tmux-navigator'

" json for vim
Plug 'kevinoid/vim-jsonc'

" colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'morhetz/gruvbox'
"Plug 'sonph/onehalf', {'rtp': 'vim/'}
"Plug 'rakr/vim-one'

" resize vim windows with ctrl + T
Plug 'simeji/winresizer'

" helpful with surround"
"Plug 'machakann/vim-sandwich'

" find file with name"
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"{{{ === Syntax and languages
"Plug 'ap/vim-css-color'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'derekwyatt/vim-scala'
Plug 'cespare/vim-toml'
" Plug 'sheerun/vim-polyglot'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mattn/emmet-vim'
"}}}

Plug 'mkitt/tabline.vim'
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 't9md/vim-quickhl'
"Plug 'kien/ctrlp.vim'

" comment 
"Plug 'scrooloose/nerdcommenter'

" coc for completion"
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}

" directory tree
"Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

call plug#end()
