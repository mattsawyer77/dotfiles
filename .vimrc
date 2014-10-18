set nocompatible			  " be iMproved, required
filetype off				  " required
set runtimepath+=~/.vim/bundle/neobundle.vim/

let g:jsdoc_default_mapping = 0

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'genutils'
NeoBundle 'editorconfig-vim'
NeoBundle 'MatchTag'
NeoBundle 'badwolf'
" NeoBundle 'maxbrunsfeld/vim-yankstack'
NeoBundle 'https://github.com/kien/ctrlp.vim.git'
NeoBundle 'https://github.com/vim-scripts/CycleColor.git'
NeoBundle 'https://github.com/noahfrederick/vim-hemisu.git'
NeoBundle 'https://github.com/heavenshell/vim-jsdoc.git'
NeoBundle 'https://github.com/tomtom/tcomment_vim.git'
" NeoBundle 'https://github.com/tpope/vim-fireplace.git'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'bling/vim-airline'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-surround'
NeoBundle 'rking/ag.vim'
NeoBundle 'littleq0903/vim-nginx'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'curist/vim-angular-template'
NeoBundle 'groenewege/vim-less'
NeoBundle 'bufkill.vim'
NeoBundle 'nathanaelkane/vim-command-w.git'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'tpope/vim-repeat'
" NeoBundle 'paredit.vim'
" NeoBundle 'slimv.vim'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'Shougo/vimproc.vim'
" NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'aclissold/lunarized-syntax'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'chrisbra/Colorizer'
NeoBundle 'CSApprox'
" NeoBundle 'junegunn/goyo.vim'
" NeoBundle 'dag/vim2hs' " waaaay too slow
" NeoBundle 'eagletmt/ghcmod-vim'
" NeoBundle 'number-marks'
" NeoBundle 'bigfish/vim-js-context-coloring'

" All of your Plugins must be added before the following line
call neobundle#end()
filetype plugin indent on	 " required
NeoBundleCheck

" let b:javascript_fold = 0
" syntax clear javaScriptDocComment
" syntax region javaScriptDocComment		matchgroup=javaScriptComment start="/\*\*\s*$"	end="\*/" contains=javaScriptDocTags,javaScriptCommentTodo,@javaScriptHtml,@Spell

" keymaps
let mapleader = "\<Space>"
set timeoutlen=250
inoremap jk <ESC>
nmap <C-x> :bd<CR>
nmap <F7> :Errors<CR>
nmap <F8> :NERDTree<CR>
nnoremap <F4> :silent CycleColorNext<CR> \| :echo colors_name<CR>
nnoremap <leader>[ :bp<CR>
nnoremap <leader>] :bn<CR>
inoremap <leader>[ <Esc>:bp<CR>
inoremap <leader>] <Esc>:bn<CR>
vnoremap <leader>[ <Esc>:bp<CR>
vnoremap <leader>] <Esc>:bn<CR>
nmap <D-w> :CommandW<CR>
imap <D-w> <Esc>:CommandW<CR>
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" perforce shortcuts
nnoremap <leader>pe :silent !p4 edit %<CR>
nnoremap <leader>pa :silent !p4 add %<CR>
nnoremap <leader>ps :!p4 sync; p4 resolve<CR>
nnoremap <leader>pd :silent !p4 diff %<CR>
map <leader>d /^\(>>>>\\|====\\|<<<<\).*<CR>

" move vertical split
nnoremap <C-H> <C-w><
nnoremap <C-L> <C-w>>
" move horizontal split
nnoremap <C-K> <C-w>+
nnoremap <C-J> <C-w>-
" indentation
nmap <C-C> gcc<Esc>
vmap <C-C> gcc<Esc>gv
imap <C-C> <Esc>gcci<Esc>

" JSON formatting
map <leader>jf :%!python -mjson.tool<CR>
" tern
map <leader>td :TernDef<CR>
map <leader>tp :TernDefPreview<CR>
map <leader>ts :TernDefSplit<CR>
map <leader>tr :TernRefs<CR>
" goyo
" nnoremap <leader>gy :Goyo<CR>
" let g:goyo_width = 110
" let g:goyo_linenr = 1
"
" jsdoc
map <C-J> :JsDoc<CR>

" show highlight group at the cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" general options
" set shell='/usr/local/bin/zsh'
set scrolloff=3
set backspace=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set noexpandtab
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
set wildignore+=build,.git,.npm,*.swp,*.tgz,*.zip,*.gz
set backupdir=/tmp,/home/sawyer/devel/vim_tmp
set noautochdir
set wildmenu
" set wildmode=longest,list
set t_Co=256
set cursorline
set nu
set nolazyredraw
if has("mouse")
	set mouse=a
endif
" only show line numbers in the current window
" au WinEnter * :setlocal number
" au WinLeave * :setlocal nonumber
" filetype mapping
au BufRead,BufNewFile /etc/nginx/*,/usr/local/etc/nginx/*.conf,*nginx.conf,*webd.conf set filetype=nginx
au BufRead,BufNewFile *.less if &ft == '' | set filetype=less | endif
au BufRead,BufNewFile *.js,*.css,*.html,*.spec,*.less,*.sh,*.conf,*.hs set expandtab
au BufRead,BufNewFile *.def.inc set tabstop=8

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
" colorscheme brookstream
" colorscheme carvedwoodcool
" colorscheme lunarized
" 	\| hi Normal ctermbg=7 ctermfg=243 guibg=#222222 guifg=#7a7a7a guisp=#0f0f0f
"     \| hi CursorLine cterm=none gui=none
" 	\| hi Search guibg=#5AB6DB guifg=#311F17
" 	\| hi IncSearch guifg=#9FF3F6 guibg=#000
colorscheme flatland
	\| hi Search guibg=#5AB6DB guifg=#311F17 cterm=none ctermbg=6 ctermfg=0
	\| hi IncSearch guifg=#9FF3F6 guibg=#000 cterm=none ctermbg=7 ctermfg=0 
	\| hi Cursor ctermbg=178 guifg=#2a2b2f guibg=#FF4740
	\| hi Normal ctermbg=none ctermfg=250 guifg=#aabbcc
	\| hi javaScriptCommentTodo ctermbg=160 guibg=#cc2222
	\| hi SignColor guibg=#2D2F31
	\| hi FoldColumn ctermbg=74 guibg=#72aaca
	\| hi LineNr ctermbg=235 guibg=#222222 guifg=#445566
	\| hi CursorLine ctermbg=236 
	\| hi CursorLineNr guifg=#ffa300
" colorscheme kellys
"	 \| hi Search guibg=#5AB6DB guifg=#311F17
"	 \| hi IncSearch guifg=#9FF3F6 guibg=#000
"	 \| hi Cursor guifg=#2a2b2f guibg=#FF4740
" colorscheme graded_a

hi Error term=reverse ctermfg=15 ctermbg=12 gui=underline guifg=#E9E8D0 guibg=#BA0423
hi jsCommentTodo ctermbg=160 ctermfg=255 guibg=#cc2222 guifg=#eeeeee

" NERDTree color fixes
hi NERDTreeRO guifg=#cc2222 ctermfg=red
hi NERDTreeFlag guifg=#552222 ctermfg=red

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async', 'ignore_globs', split(&wildignore, ','))
"call unite#custom#source('file_rec/async','sorters','sorter_rank', )
" replacing unite with ctrl-p
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_prompt='» '
let g:unite_split_rule = 'botright'
if executable('ag')
	let g:unite_source_grep_command='ag'
	let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
	let g:unite_source_grep_recursive_opt=''
endif
" nnoremap <silent> <c-p> :Unite -start-insert file_rec/async<cr>
nnoremap <silent> <leader>u :Unite -start-insert file_rec/async<cr>
nnoremap <silent> <leader><Space> :Unite -auto-resize buffer file_mru<cr>
nnoremap <silent> <leader>v :Unite -auto-resize buffer file_mru -default-action=vsplit<cr>
nnoremap <silent> <leader>r :Unite register<cr>
nnoremap <silent> <leader>f :Unite grep<cr>
" YouCompleteMe options
let g:ycm_autoclose_preview_window_after_insertion = 1

" syntastic
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_auto_jump = 2

" sh
let g:syntastic_sh_checkers=['sh', 'shellcheck']

" javascript
let g:syntastic_javascript_checkers=['jshint']

" json
let g:syntastic_json_checkers=['jsonlint', 'jsonval']

" haskell

" html
let g:syntastic_html_checkers=[]
" let g:syntastic_html_tidy_ignore_errors = [
"	  \"trimming empty <i>",
"	  \"trimming empty <span>",
"	  \"<input> proprietary attribute \"autocomplete\"",
"	  \"proprietary attribute \"role\"",
"	  \"proprietary attribute \"hidden\"",
"	  \"proprietary attribute \"ng\"",
"	  \"proprietary attribute \"ng-\"",
"	  \"proprietary attribute \"ng-app\"",
"	  \"proprietary attribute \"data-ng\"",
"	  \"is not recognized!"
"	  \]

" css
let g:syntastic_css_checkers=['csslint']

" JS context syntax colors
" let g:js_context_colors = [ '#D92E41', '#D97F53', '#D9A553', '#C9D997', '#9FD9A4', '#81D9BD', '#D1A9D9', '#D996A6' ]
" let g:js_context_colors_colorize_comments = 0
" let g:js_context_colors_insertmode = 0

" pangloss javascript settings
let g:javascript_enable_domhtmlcss = 1

" signify
let g:signify_vcs_list = [ 'git', 'perforce' ]

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
" let g:airline_theme='wombat' "good with hemisu, kellys"
" let g:airline_theme='jellybeans' "good with darktango2"
" let g:airline_theme='bubblegum' "good with hemisu"
" let g:airline_theme='molokai' "good with distinguished"
" let g:airline_theme='sol' "good with flatland, carvedwoodcool"
" let g:airline_theme='murmur' "good with lunarized"
let g:airline_theme='lucius' "good with flatland, graded_a"
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
" put the name of the session in the airline
au VimEnter,BufWinEnter * if exists("g:this_obsession") 
			\|		let g:airline_section_y = '%{fnamemodify(g:this_obsession, ":t")}' 
			\| else 
			\|		let g:airline_section_y = 'no session'
			\| endif
let g:bufferline_echo = 0

" multiple cursors
let g:multi_cursor_prev_key='<C-N>'

" vim-rooter
let g:rooter_patterns = ['bigiq_ui.spec', 'biq.def.inc', 'webd.spec', '.git', '.git/']

" vim2hs
let g:haskell_conceal		= 0
let g:haskell_quasi			= 0
let g:haskell_interpolation = 0
let g:haskell_regex			= 0
let g:haskell_jmacro		= 0
let g:haskell_shqq			= 0
let g:haskell_sql			= 0
let g:haskell_json			= 0
let g:haskell_xml			= 0
let g:haskell_hsp			= 0
let g:haskell_tabular		= 0
au BufRead,BufWinEnter *.hs set lazyredraw

" auto-delete trailing spaces for certain filetypes
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  retab!
  exe "normal `z"
endfunc

" rainbow parenthesis
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.html :call DeleteTrailingWS()
autocmd BufWrite *.css :call DeleteTrailingWS()
autocmd BufWrite *.less :call DeleteTrailingWS()
autocmd BufWrite *.yaml :call DeleteTrailingWS()
autocmd BufWrite *.conf :call DeleteTrailingWS()
autocmd BufWrite *.lua :call DeleteTrailingWS()
autocmd BufWrite *.bash :call DeleteTrailingWS()
autocmd! GUIEnter * set vb t_vb=
