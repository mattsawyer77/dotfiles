let mapleader = "\<Space>"
set timeoutlen=250
nnoremap ; :
vnoremap ; :
inoremap jk <ESC>
" nnoremap <Up> 3<C-y>
" nnoremap <Down> 3<C-e>
" vnoremap <Up> 3<C-y>
" vnoremap <Down> 3<C-e>
" nnoremap <Left> <C-o><CR>
" nnoremap <Right> <C-i><CR>
" vnoremap <Left> <C-o><CR>
" vnoremap <Right> <C-i><CR>
" nnoremap <C-x> :bd<CR>
nnoremap <C-x> :Bdelete<CR>
noremap <C-s> :w<CR>
" nnoremap <F7> :lw<CR>
nnoremap <F8> :NERDTree<CR>
nnoremap <F9> :NERDTreeFind<CR>
nnoremap <F4> :silent CycleColorNext<CR> \| :CycleColorRefresh<CR> \| :echo colors_name<CR>
nnoremap <F5> :redir >> /tmp/vim_colors_selected.txt \| :echo colors_name \| redir END<CR>
nnoremap <D-w> :CommandW<CR>
inoremap <D-w> <Esc>:CommandW<CR>
vnoremap v <Plug>(expand_region_expand)
vnoremap V <Plug>(expand_region_shrink)
nnoremap <Esc> :silent! noh<CR>

" terminal mappings
:tnoremap <Esc> <C-\><C-n>

" perforce shortcuts
nnoremap <leader>pe :silent !p4 edit %<CR>
nnoremap <leader>pa :silent !p4 add %<CR>
nnoremap <leader>ps :!p4 sync; p4 resolve<CR>
nnoremap <leader>pd :silent !p4 diff %<CR>
nnoremap <leader>pr :silent !p4 reconcile %<CR>
map <leader>d /^\(>>>>\\|====\\|<<<<\).*<CR>

" move vertical split
nnoremap <C-H> <C-w><
nnoremap <C-L> <C-w>>
" move horizontal split
nnoremap <C-K> <C-w>+
nnoremap <C-J> <C-w>-

" t-comment (alt+/)
nmap ¯ gcc<Esc>
vmap ¯ gcc<Esc>gv
imap ¯ <Esc>gccli
nmap ÷ gcc<Esc>
vmap ÷ gcc<Esc>gv
imap ÷ gcc<Esc>li
nmap � gcc<Esc>
vmap � gcc<Esc>gv
imap � <Esc>gccli
" JSON formatting
map <leader>jf :%!json<CR>
" tern
map <leader>td :TernDef<CR>
map <leader>tp :TernDefPreview<CR>
map <leader>ts :TernDefSplit<CR>
map <leader>tr :TernRefs<CR>
"
" jsdoc
map <leader>jd :JsDoc<CR>

" show highlight group at the cursor
nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" FZF
map <C-p> :FZF<CR>
" map <leader><space> :FZFMru<CR>

nnoremap <leader>tt :call ToggleTheme()<CR>

" signify
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" format JSON (using node.js)
map <leader>jf :call FormatJSON()<CR>

map <leader>r BTags<CR>

nnoremap <C-,> :NERDTree ~/.config/nvim<CR>
nnoremap ¬ :NERDTree ~/.config/nvim<CR>
nnoremap , :NERDTree ~/.config/nvim<CR>

" markology
nnoremap <leader>m :MarkologyLocationList<CR>

" quick/dirty way to find a function
nnoremap <leader>f /function\s\+

" deoplete
" use tab to iterate items in autocomplete dropdown
" inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" use enter to select the item in the dropdown 
" inoremap <expr><CR> pumvisible() ? "\<Esc>a" : "\<CR>"
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" copy/paste to system clipboard
vnoremap <leader>c "+y
nnoremap <leader>v "+p
" vnoremap <leader>c ""y
" nnoremap <leader>v ""p
" vnoremap <leader>c :Oscyank<CR>

inoremap « λ

" ALE
nmap <silent> ˚ <Plug>(ale_previous_wrap)
nmap <silent> ∆ <Plug>(ale_next_wrap)
nmap <silent> <f7> <Plug>(ale_next_wrap)

" Mundo
nnoremap <leader>r :CtrlPMRUFiles<CR>

" CtrlP
nnoremap <leader><enter> :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlPTag<CR>
nnoremap <c-z> :MundoShow<CR>

" Haskell
" augroup interoMaps
"   au!
"
"   au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
"   au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
"   au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>
"   au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
"   au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>
"
"   au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>
"   au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
"   au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>
"
"   au FileType haskell map <leader>t <Plug>InteroGenericType
"   au FileType haskell map <leader>T <Plug>InteroType
"   au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>
"
"   au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>
"   au FileType haskell nnoremap <silent> <leader>iu :InteroUses<CR>
"   au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
" augroup END
