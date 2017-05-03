let mapleader = "\<Space>"
set timeoutlen=250
nnoremap ; :
vnoremap ; :
inoremap jk <ESC>
nnoremap <Up> 3<C-y>
nnoremap <Down> 3<C-e>
vnoremap <Up> 3<C-y>
vnoremap <Down> 3<C-e>
nnoremap <Left> <C-o><CR>
nnoremap <Right> <C-i><CR>
vnoremap <Left> <C-o><CR>
vnoremap <Right> <C-i><CR>
" nnoremap <C-x> :bd<CR>
nnoremap <C-x> :Bdelete<CR>
noremap <C-s> :w<CR>
nnoremap <tab> >>
nnoremap <S-Tab> <<
vnoremap <tab> >gv
vnoremap <S-Tab> <gv
nmap <F7> :lw<CR>
nmap <F8> :NERDTree<CR>
nmap <F9> :NERDTreeFind<CR>
nnoremap <F4> :silent CycleColorNext<CR> \| :CycleColorRefresh<CR> \| :echo colors_name<CR>
nnoremap <F5> :redir >> /tmp/vim_colors_selected.txt \| :echo colors_name \| redir END<CR>
nnoremap <leader>[ :bp<CR>
nnoremap <leader>] :bn<CR>
nmap <D-w> :CommandW<CR>
imap <D-w> <Esc>:CommandW<CR>
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)
nmap <leader><space> :CtrlPMRUFiles<CR>
nmap <leader><enter> :CtrlPBuffer<CR>
nmap <leader>t :CtrlPTag<CR>
nnoremap <Esc> :silent noh<CR>
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
nnoremap <leader>f function\s*

" deoplete
" use tab to iterate items in autocomplete dropdown
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" use enter to select the item in the dropdown 
inoremap <expr><CR> pumvisible() ? "\<Esc>a" : "\<CR>"

" messages hack for clipboard functionality in Neovim.app:
nmap <leader>mm :vnew \| :redir @a \| :silent messages \| :redir END \| :normal "ap<CR>

" copy/paste to system clipboard
vnoremap <leader>c "+y
nnoremap <leader>v "+p

" vim-js-context-coloring
nnoremap <leader>jc :JSContextColorToggle<CR>

inoremap « λ

" ALE
nmap <silent> ˚ <Plug>(ale_previous_wrap)
nmap <silent> ∆ <Plug>(ale_next_wrap)
