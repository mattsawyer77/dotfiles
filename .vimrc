set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on     " required

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
" Bundle 'perforce'
" Bundle 'genutils'
Bundle 'HiColors'
Bundle 'number-marks'
Bundle 'editorconfig-vim'
Bundle 'MatchTag'
Bundle 'badwolf'
Bundle 'yankstack'
Bundle 'https://github.com/kien/ctrlp.vim.git'
Bundle 'https://github.com/vim-scripts/CycleColor.git'
Bundle 'https://github.com/noahfrederick/vim-hemisu.git'
Bundle 'https://github.com/heavenshell/vim-jsdoc.git'
Bundle 'https://github.com/tomtom/tcomment_vim.git'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'marijnh/tern_for_vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'bling/vim-airline'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-surround'
Bundle 'rking/ag.vim'
Bundle 'littleq0903/vim-nginx'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'curist/vim-angular-template'
Bundle 'groenewege/vim-less'
Bundle 'bufkill.vim'
Bundle 'nathanaelkane/vim-command-w.git'
Bundle 'terryma/vim-multiple-cursors'
" Bundle 'bigfish/vim-js-context-coloring'

" filetype mapping
au BufRead,BufNewFile /etc/nginx/*,/usr/local/etc/nginx/*.conf,nginx.conf,webd.conf setfiletype nginx
au BufRead,BufNewFile *.less if &ft == '' | setfiletype less | endif

" NERDTree auto-open to current file folder
au BufEnter * lcd %:p:h

" syntastic
let g:syntastic_auto_loc_list = 2

" sh
let g:syntastic_sh_checkers=['sh', 'shellcheck']

" javascript
let g:syntastic_javascript_checkers=['jshint']

" json
let g:syntastic_json_checkers=['jsonlint', 'jsonval']

" html
let g:syntastic_html_checkers=['jshint', 'tidy']
let g:syntastic_html_tidy_ignore_errors = [
    \"trimming empty <i>",
    \"trimming empty <span>",
    \"<input> proprietary attribute \"autocomplete\"",
    \"proprietary attribute \"role\"",
    \"proprietary attribute \"hidden\"",
    \"proprietary attribute \"ng\"",
    \"proprietary attribute \"ng-app\"",
    \"proprietary attribute \"data-ng\"",
    \"is not recognized!"
    \]

" css
let g:syntastic_css_checkers=['csslint']

" JS context syntax colors
" let g:js_context_colors = [ '#D92E41', '#D97F53', '#D9A553', '#C9D997', '#9FD9A4', '#81D9BD', '#D1A9D9', '#D996A6' ]
" let g:js_context_colors_colorize_comments = 0
" let g:js_context_colors_insertmode = 0

" pangloss javascript settings
let g:javascript_enable_domhtmlcss = 1

" badwolf
let g:badwolf_darkgutter = 1

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_root_markers = ['*.spec']
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:50'
let g:ctrlp_show_hidden = 1

" airline
" let g:airline_theme='badwolf'
" let g:airline_theme='ubaryd'
" let g:airline_theme='wombat'
let g:airline_theme='jellybeans'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0

" multiple cursors
let g:multi_cursor_prev_key='<C-l>'

" keymaps
nmap <F7> :Errors<CR>
nmap <F8> :NERDTree<CR>
nnoremap <leader>[ :bp<CR>
nnoremap <leader>] :bn<CR>
inoremap <leader>[ <Esc>:bp<CR>
inoremap <leader>] <Esc>:bn<CR>
vnoremap <leader>[ <Esc>:bp<CR>
vnoremap <leader>] <Esc>:bn<CR>
nmap \\ :CtrlPBuffer<CR>
nmap <D-w> :CommandW<CR>
imap <D-w> <Esc>:CommandW<CR>

" move vertical split
nmap <A-D-Left> <C-w><
nmap <A-D-Right> <C-w>>
" move horizontal split
nmap <A-D-Up> <C-w>+
nmap <A-D-Down> <C-w>-
" indentation
nmap <D-]> a<C-t><Esc>
nmap <D-[> a<C-d><Esc>
imap <D-]> <C-t>
imap <D-[> <C-d>
vmap <D-]> <Esc>`<i<C-t><C-o>my<C-d><C-o>`><C-t><C-o>mz<C-d><Esc>gv:><CR>gv`yo`z
vmap <D-[> <Esc>`<i<C-d><C-o>my<C-t><C-o>`><C-d><C-o>mz<C-t><Esc>gv:<<CR>gv`yo`z
nmap <D-/> gcc
vmap <D-/> gcc
imap <D-/> <Esc>gcci

" general options
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set showtabline=0
set smartindent
set hidden
set laststatus=2
" set smartcase  "- use case if any caps used
set ic " case insensitive
set incsearch  "- show match as search proceeds
set hlsearch   "- search highlighting
set history=1000
set magic
set foldcolumn=1
set visualbell
set noerrorbells
set wildignore+=build,.git,*.swp,*.tgz,*.zip,*.gz
set backupdir=/tmp,/home/sawyer/devel/vim_tmp
set noautochdir
set wildmenu
set wildmode=longest,list
set macmeta
set t_Co=256
" only show line numbers in the current window
set nu
au WinEnter * :setlocal number
au WinLeave * :setlocal nonumber

" colors
syntax on
colorscheme default
set background=dark
" colorscheme badwolf
" colorscheme seafoam
" colorscheme distinguished
" colorscheme darkburn
" colorscheme busierbee
" colorscheme zephyr
" colorscheme hemisu
" colorscheme codeschool
" colorscheme mustang
" colorscheme obsidian2
" colorscheme pacific
colorscheme darktango2
" colorscheme solarized
" colorscheme iceberg

" auto-delete trailing spaces for certain filetypes
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  retab!
  exe "normal `z"
endfunc

autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.html :call DeleteTrailingWS()
autocmd BufWrite *.css :call DeleteTrailingWS()
autocmd BufWrite *.less :call DeleteTrailingWS()
autocmd BufWrite *.yaml :call DeleteTrailingWS()
autocmd BufWrite *.conf :call DeleteTrailingWS()
autocmd BufWrite *.lua :call DeleteTrailingWS()
autocmd BufWrite *.bash :call DeleteTrailingWS()
autocmd! GUIEnter * set vb t_vb=
