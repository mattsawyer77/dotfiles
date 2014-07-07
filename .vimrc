set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on     " required

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'genutils'
Bundle 'HiColors'
Bundle 'editorconfig-vim'
Bundle 'MatchTag'
Bundle 'badwolf'
Bundle 'maxbrunsfeld/vim-yankstack'
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
Bundle 'airblade/vim-rooter'
Bundle 'osyo-manga/vim-over'
Bundle 'tpope/vim-repeat'
" Bundle 'number-marks'
" Bundle 'bigfish/vim-js-context-coloring'

" YouCompleteMe options
let g:ycm_autoclose_preview_window_after_insertion = 1


" filetype mapping
au BufRead,BufNewFile /etc/nginx/*,/usr/local/etc/nginx/*.conf,*nginx.conf,*webd.conf setfiletype nginx
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
let g:syntastic_html_checkers=[]
" let g:syntastic_html_tidy_ignore_errors = [
"     \"trimming empty <i>",
"     \"trimming empty <span>",
"     \"<input> proprietary attribute \"autocomplete\"",
"     \"proprietary attribute \"role\"",
"     \"proprietary attribute \"hidden\"",
"     \"proprietary attribute \"ng\"",
"     \"proprietary attribute \"ng-\"",
"     \"proprietary attribute \"ng-app\"",
"     \"proprietary attribute \"data-ng\"",
"     \"is not recognized!"
"     \]

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
let g:ctrlp_root_markers = ['*.spec', '.p4config', '*.def.inc', 'Rakefile', '.git/']
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:50'
let g:ctrlp_show_hidden = 1

" airline
" let g:airline_theme='badwolf'
" let g:airline_theme='ubaryd'
let g:airline_theme='wombat' "good with hemisu, kellys"
" let g:airline_theme='jellybeans' "good with darktango2"
" let g:airline_theme='bubblegum' "good with hemisu"
" let g:airline_theme='molokai' "good with distinguished"
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0

" multiple cursors
let g:multi_cursor_prev_key='<C-l>'

" vim-rooter
let g:rooter_patterns = ['bigiq_ui.spec', 'biq.def.inc', 'webd.spec']

" keymaps
inoremap jk <ESC>
nmap <F7> :Errors<CR>
nmap <F8> :NERDTree<CR>
nnoremap <F4> :silent CycleColorNext<CR> \| :echo colors_name<CR>
nnoremap <leader>[ :bp<CR>
nnoremap <leader>] :bn<CR>
inoremap <leader>[ <Esc>:bp<CR>
inoremap <leader>] <Esc>:bn<CR>
vnoremap <leader>[ <Esc>:bp<CR>
vnoremap <leader>] <Esc>:bn<CR>
nmap \\ :CtrlPBuffer<CR>
nmap <D-w> :CommandW<CR>
imap <D-w> <Esc>:CommandW<CR>

" perforce shortcuts
nnoremap <leader>pe :silent !p4 edit %<CR>
nnoremap <leader>pa :silent !p4 add %<CR>
nnoremap <leader>ps :!p4 sync; p4 resolve<CR>
nnoremap <leader>pd :silent !p4 diff %<CR>
map <leader>d /^\(>>>>\\|====\\|<<<<\).*<CR>

" move vertical split
nnoremap <A-Left> <C-w><
nnoremap <A-Right> <C-w>>
" move horizontal split
nnoremap <A-D-Up> <C-w>+
nnoremap <A-D-Down> <C-w>-
" indentation
nnoremap <A-]> a<C-t><Esc>
nnoremap <A-[> a<C-d><Esc>
imap <A-]> <C-t>
imap <A-[> <C-d>
vmap <A-]> <Esc>`<i<C-t><C-o>my<C-d><C-o>`><C-t><C-o>mz<C-d><Esc>gv:><CR>gv`yo`z
vmap <A-[> <Esc>`<i<C-d><C-o>my<C-t><C-o>`><C-d><C-o>mz<C-t><Esc>gv:<<CR>gv`yo`z
nmap <A-/> gcc<Esc>
vmap <A-/> gcc<Esc>gv
imap <A-/> <Esc>gcci<Esc>
map <C-ESC> :only<CR>

"Bubble single lines
nmap <A-Up> ddkP
nmap <A-Down> ddp
"Bubble multiple lines
vmap <A-Up> xkP`[V`]
vmap <A-Down> xp`[V`]
" JSON formatting
map <leader>jf :%!python -mjson.tool<CR>
" tern
map <leader>td :TernDef<CR>
map <leader>tp :TernDefPreview<CR>
map <leader>ts :TernDefSplit<CR>
map <leader>tr :TernRefs<CR>

" show highlight group at the cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" general options
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set showtabline=0
set smartindent
set hidden
set laststatus=2
set splitright
set ignorecase
set smartcase  "- use case if any caps used
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
set t_Co=256
set cursorline
" only show line numbers in the current window
set nu
" au WinEnter * :setlocal number
" au WinLeave * :setlocal nonumber

" colors
syntax on
colorscheme default
set background=dark
" colorscheme badwolf
" colorscheme seafoam
" colorscheme distinguished
" colorscheme hemisu
" colorscheme codeschool
" colorscheme darktango2
" colorscheme solarized
" colorscheme jellybeans
colorscheme kellys 
   \| hi Search guibg=#5AB6DB guifg=#311F17 
   \| hi IncSearch guifg=#9FF3F6 guibg=#000 
   \| hi Cursor guifg=#2a2b2f guibg=#FF4740

hi Error term=reverse ctermfg=15 ctermbg=12 gui=underline guifg=#E9E8D0 guibg=#BA0423

" NERDTree color fixes
hi NERDTreeRO guifg=#cc2222 ctermfg=red
hi NERDTreeFlag guifg=#552222 ctermfg=red

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
