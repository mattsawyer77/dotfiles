call plug#begin('~/.config/nvim/plugged')

Plug 'MatchTag'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'badwolf'
Plug 'bitc/vim-hdevtools'
Plug 'bling/vim-airline'
Plug 'bufkill.vim'
Plug 'burnettk/vim-angular'
Plug 'claco/jasmine.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'eagletmt/neco-ghc'
Plug 'editorconfig-vim'
Plug 'groenewege/vim-less'
Plug 'https://github.com/heavenshell/vim-jsdoc.git'
Plug 'https://github.com/tomtom/tcomment_vim.git'
Plug 'https://github.com/vim-scripts/CycleColor.git'
Plug 'jeetsukumaran/vim-markology'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'littleq0903/vim-nginx'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'mhinz/vim-signify'
Plug 'millermedeiros/vim-esformatter'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neovimhaskell/haskell-vim'
Plug 'osyo-manga/vim-over'
Plug 'othree/yajs.vim'
Plug 'gavocanov/vim-js-indent'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'taiansu/nerdtree-ag'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
Plug 'benekastah/neomake'
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'
" Plug 'grassdog/tagman.vim'
" Plug 'maxbrunsfeld/vim-yankstack'
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'pangloss/vim-javascript'
" Plug 'zefei/vim-colortuner'
" Plug 'itchyny/lightline.vim'
" Plug 'airblade/vim-rooter'
" Plug 'wincent/terminus'

call plug#end()

" pangloss javascript settings
let g:javascript_enable_domhtmlcss = 1

" signify
" let g:signify_vcs_list = [ 'git', 'perforce' ]
let g:signify_vcs_list = [ 'git' ]

" badwolf
let g:badwolf_darkgutter = 1

" ctrlp
let g:ctrlp_map = '<c-q>'
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_root_markers = ['.p4config', '*.def.inc', 'Rakefile', '.git/']
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:50'
let g:ctrlp_show_hidden = 1

" airline
" let g:airline_theme='badwolf'
" let g:airline_theme='ubaryd'
" let g:airline_theme='wombat' "good with hemisu, kellys"
" let g:airline_theme='jellybeans' "good with darktango2"
" let g:airline_theme='bubblegum' "good with hemisu"
" let g:airline_theme='molokai' "good with distinguished"
" let g:airline_theme='sol' "good with flatland, carvedwoodcool"
" let g:airline_theme='murmur' "good with lunarized"
" let g:airline_theme='lucius' "good with mattland, flatland, graded_a"
" let g:airline_theme='tomorrow' "good with flatlandia"
" let g:airline_theme='zenburn' "~good with mattland"
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
let g:airline_mode_map = {'c': 'COMMAND', '^S': 'S-BLOCK', 'R': 'REPLACE', 's': 'SELECT', 't': 'TERMINAL', 'V': 'V-LINE', '^V': 'V-BLOCK', 'i': 'INSERT', '__': '------', 'S': ' S-LINE', 'v': 'VISUAL', 'n': 'NORMAL'}
let g:bufferline_echo = 0

" vim-rooter
let g:rooter_patterns = ['bigiq_ui.spec', 'biq.def.inc', 'webd.spec', '.git', '.git/']

" vim-slime
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

" deoplete
let g:deoplete#enable_at_startup = 1

" neomake
let g:neomake_javascript_eslint_maker =  {
	\ 'args': ['`which eslint`', '-f', 'compact'],
	\ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
	\ '%W%f: line %l\, col %c\, Warning - %m'
	\ }
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_airline = 1

" markology
let g:markology_include="abcdefghijklmnopqrstuvwxyABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
let g:markology_disable_mappings = 1

" tern
" turn off annoying and mostly useless auto preview window
autocmd BufEnter *.js set completeopt-=preview
