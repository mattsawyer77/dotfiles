let mapleader = "\<Space>"
set timeoutlen=250
inoremap jk <ESC>
nmap <C-x> :bd<CR>
nmap <F7> :Errors<CR>
nmap <F8> :NERDTree<CR>
nmap <F9> :NERDTreeCWD<CR>
nnoremap <F4> :silent CycleColorNext<CR> \| :echo colors_name<CR>
nnoremap <leader>[ :bp<CR>
nnoremap <leader>] :bn<CR>
nmap <D-w> :CommandW<CR>
imap <D-w> <Esc>:CommandW<CR>
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)
" nmap <leader><space> :CtrlPMRUFiles<CR>

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

" t-comment (alt+/)
nmap ¯ gcc<Esc>
vmap ¯ gcc<Esc>gv
imap ¯ <Esc>gccli

" JSON formatting
map <leader>jf :%!json<CR>
" tern
map <leader>td :TernDef<CR>
map <leader>tp :TernDefPreview<CR>
map <leader>ts :TernDefSplit<CR>
map <leader>tr :TernRefs<CR>
"
" jsdoc
map <C-J> :JsDoc<CR>

" show highlight group at the cursor
nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" FZF
map <C-p> :FZF<CR>
map <leader><space> :FZFMru<CR>

nnoremap <leader>tt :call ToggleTheme()<CR>

" signify
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" format JSON (using node.js)
map <leader>jf :call FormatJSON()<CR>
