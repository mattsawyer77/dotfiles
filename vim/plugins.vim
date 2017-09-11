call plug#begin('~/.config/nvim/plugged')

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'moll/vim-bbye'
Plug 'burnettk/vim-angular'
Plug 'claco/jasmine.vim'
Plug 'ctrlpvim/ctrlp.vim'
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
Plug 'whatyouhide/vim-gotham'
Plug 'AlessandroYorba/Despacio'
Plug 'AlessandroYorba/Sierra'
Plug 'AlessandroYorba/Alduin'
Plug 'bruth/vim-newsprint-theme'
Plug 'osyo-manga/vim-over'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'taiansu/nerdtree-ag'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'carlitux/deoplete-ternjs'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'jiangmiao/auto-pairs'
Plug 'elixir-lang/vim-elixir'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'rakr/vim-two-firewatch'
Plug 'jacoborus/tender'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'henrik/vim-indexed-search'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'wlangstroth/vim-racket'
Plug 'chriskempson/base16-vim'
Plug 'simnalamburt/vim-mundo'
Plug 'vim-ctrlspace/vim-ctrlspace'
" Plug 'thinca/vim-ref'
" Plug 'bash-support.vim'
" Plug 'blueyed/vim-diminactive'
" Plug 'benekastah/neomake'
" Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'fcpg/vim-fahrenheit'
" Plug 'mhartington/oceanic-next'
" Plug 'gilgigilgil/anderson.vim'
" Plug 'kristijanhusak/vim-hybrid-material'
" Plug 'kristiandupont/shades-of-teal'
" Plug 'neovim/node-host'
" Plug 'bigfish/vim-js-context-coloring', { 'for': 'javascript'}
" Plug 'rschmukler/pangloss-vim-indent', { 'for': 'javascript' }
" Plug 'gavocanov/vim-js-indent'
" Plug 'slashmili/alchemist.vim'
" Plug 'facebook/vim-flow'
" Plug 'grassdog/tagman.vim'
" Plug 'maxbrunsfeld/vim-yankstack'
" Plug 'zefei/vim-colortuner'
" Plug 'itchyny/lightline.vim'
" Plug 'airblade/vim-rooter'
" Plug 'wincent/terminus'
" Plug 'bitc/vim-hdevtools'
" Plug 'neovimhaskell/haskell-vim'
" Plug 'eagletmt/neco-ghc'

call plug#end()

" pangloss javascript settings
let g:javascript_enable_domhtmlcss = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_opfirst = '\%([,:?^%]\|\([-/+]\)\%(\1\|\*\|\/\)\@!\|\*\/\@!\|=>\@!\||\|&\|in\%(stanceof\)\=\>\)\C'

" signify
" let g:signify_vcs_list = [ 'git', 'perforce' ]
let g:signify_vcs_list = [ 'git' ]

" badwolf
let g:badwolf_darkgutter = 1

" ctrlp
let g:ctrlp_map = '<c-q>'
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_root_markers = ['.p4config', '*.def.inc', 'Rakefile', '.git/']
" let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|build|bigiq_ui_docs)$'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:50'
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'

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
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ ''   : 'V',
    \ 's'  : 'S',
    \ }
" exclude preview for CtrlSpace
let g:airline_exclude_preview = 1
let g:bufferline_echo = 0

" vim-rooter
let g:rooter_patterns = ['biq.def.inc', '.git', '.git/']

" deoplete
let g:deoplete#enable_at_startup = 1

" ALE
let g:ale_linters = { 'html': [] }

" markology
let g:markology_include="abcdefghijklmnopqrstuvwxyABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
let g:markology_disable_mappings = 1

" tern
" turn off annoying and mostly useless auto preview window
autocmd BufEnter *.js set completeopt-=preview

" NERDTree
let NERDTreeShowHidden=1

" CTRL Space
" let g:CtrlSpaceDefaultMappingKey = "<space><space>"
" let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
" let g:CtrlSpaceSaveWorkspaceOnExit = 1
" if executable("ag")
"     let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
" endif

" fakeclip.neovim
let g:vim_fakeclip_tmux_plus=1

" Prettier
" max line lengh that prettier will wrap on
let g:prettier#config#print_width = 120

" number of spaces per indentation level
let g:prettier#config#tab_width = 4

" use tabs over spaces
let g:prettier#config#use_tabs = 'false'

" print semicolons
let g:prettier#config#semi = 'true'

" single quotes over double quotes
let g:prettier#config#single_quote = 'true' 

" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true' 

" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'true' 

" none|es5|all
let g:prettier#config#trailing_comma = 'none'

" flow|babylon|typescript|postcss|json|graphql
let g:prettier#config#parser = 'flow'

" CtrlP-Obsession
let g:prosession_dir = '~/.config/nvim/sessions'
