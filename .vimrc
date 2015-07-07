call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'genutils'
Plug 'editorconfig-vim'
Plug 'MatchTag'
Plug 'badwolf'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/vim-scripts/CycleColor.git'
Plug 'https://github.com/noahfrederick/vim-hemisu.git'
Plug 'https://github.com/heavenshell/vim-jsdoc.git'
Plug 'https://github.com/tomtom/tcomment_vim.git'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
" Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
" Plug 'bling/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'daylerees/colour-schemes', { 'rtp': 'vim/' }
Plug 'zefei/vim-colortuner'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'
Plug 'littleq0903/vim-nginx'
Plug 'maksimr/vim-jsbeautify'
Plug 'groenewege/vim-less'
Plug 'bufkill.vim'
Plug 'airblade/vim-rooter'
Plug 'osyo-manga/vim-over'
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-signify'
Plug 'Shougo/vimproc.vim', { 'do': 'make '}
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-expand-region'
Plug 'kien/rainbow_parentheses.vim'
Plug 'chrisbra/Colorizer'
" Plug 'CSApprox'
Plug 'scrooloose/syntastic'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'wincent/terminus'
" Plug 'jelera/vim-javascript-syntax'
" Plug 'junegunn/goyo.vim'
" Plug 'eagletmt/ghcmod-vim'
" Plug 'bigfish/vim-js-context-coloring'

call plug#end()

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
nmap <D-w> :CommandW<CR>
imap <D-w> <Esc>:CommandW<CR>
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)
nmap <leader><space> :CtrlPMRUFiles<CR>

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
" nmap <C-C> gcc<Esc>
" vmap <C-C> gcc<Esc>gv
" imap <C-C> <Esc>gcci<Esc>

" JSON formatting
map <leader>jf :%!json<CR>
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
set wildmode=longest,list
set t_Co=256
set cursorline
set nu
set nolazyredraw
set ttyfast
set shortmess=a

" only show line numbers in the current window
" au WinEnter * :setlocal number
" au WinLeave * :setlocal nonumber
" filetype mapping
au BufRead,BufNewFile /etc/nginx/*,/usr/local/etc/nginx/*.conf,*nginx.conf,*webd.conf set filetype=nginx
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.less if &ft == '' | set filetype=less | endif
au BufRead,BufNewFile *.js,*.css,*.html,*.spec,*.less,*.sh,*.conf,*.hs set expandtab
au BufRead /etc/rsnapshot.conf set noexpandtab
au BufRead,BufNewFile *.def.inc set tabstop=8
" the following autocmd has some issues, fix them...
" au BufRead,InsertLeave *.js JSHint
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au BufRead,BufNewFile php-fpm.conf,php.ini* set filetype=dosini

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
" colorscheme kellys
"	 \| hi Search guibg=#5AB6DB guifg=#311F17
"	 \| hi IncSearch guifg=#9FF3F6 guibg=#000
"	 \| hi Cursor guifg=#2a2b2f guibg=#FF4740
" colorscheme graded_a
" colorscheme mattland
colorscheme flatlandia
hi LineNr ctermfg=238 ctermbg=235

"hi Error term=reverse ctermfg=15 ctermbg=12 gui=underline guifg=#E9E8D0 guibg=#BA0423
"hi jsCommentTodo ctermbg=160 ctermfg=255 guibg=#cc2222 guifg=#eeeeee

" NERDTree color fixes
hi NERDTreeRO guifg=#cc2222 ctermfg=red
hi NERDTreeFlag guifg=#552222 ctermfg=red

" Unite
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#custom#source('file_rec/async', 'ignore_globs', split(&wildignore, ','))
"call unite#custom#source('file_rec/async','sorters','sorter_rank', )
" replacing unite with ctrl-p
"let g:unite_data_directory='~/.vim/.cache/unite'
"let g:unite_enable_start_insert=1
"let g:unite_source_history_yank_enable=1
"let g:unite_prompt='» '
"let g:unite_split_rule = 'botright'
"if executable('ag')
	"let g:unite_source_grep_command='ag'
	"let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
	"let g:unite_source_grep_recursive_opt=''
"endif
" nnoremap <silent> <c-p> :Unite -start-insert file_rec/async<cr>
"nnoremap <silent> <leader>u :Unite -start-insert file_rec/async<cr>
"nnoremap <silent> <leader><Space> :Unite -auto-resize buffer file_mru<cr>
"nnoremap <silent> <leader>v :Unite -auto-resize buffer file_mru -default-action=vsplit<cr>
"nnoremap <silent> <leader>r :Unite register<cr>
"nnoremap <silent> <leader>f :Unite grep<cr>
" YouCompleteMe options
let g:ycm_autoclose_preview_window_after_insertion = 1

" syntastic
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_auto_jump = 2

" sh
let g:syntastic_sh_checkers=['sh', 'shellcheck']

" javascript
" let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_javascript_checkers=['eslint']

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

" jshint2
let jshint2_read = 1
let jshint2_save = 1
let jshint2_confirm = 0
let jshint2_height = 5

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
let g:airline_theme='lucius' "good with mattland, flatland, graded_a"
" let g:airline_theme='zenburn' "~good with mattland"
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

" lightline config
" let g:lightline.colorscheme = 'default'
" let g:lightline.colorscheme = 'wombat'
" let g:lightline.colorscheme = 'solarized'
" let g:lightline.colorscheme = 'powerline'
" let g:lightline.colorscheme = 'jellybeans'
" let g:lightline.colorscheme = 'Tomorrow'
" let g:lightline.colorscheme = 'Tomorrow_Night'
" let g:lightline.colorscheme = 'Tomorrow_Night_Blue'
" let g:lightline.colorscheme = 'Tomorrow_Night_Eighties'
" let g:lightline.colorscheme = 'landscape'
" let g:lightline.colorscheme = '16color'


let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" multiple cursors
let g:multi_cursor_prev_key='<C-N>'

" vim-rooter
let g:rooter_patterns = ['bigiq_ui.spec', 'biq.def.inc', 'webd.spec', '.git', '.git/']

" ShowMarks7
" let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

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

" vim-slime
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

" signify
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" neovim stuff
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

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
