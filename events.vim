" filetype mapping
au BufRead,BufNewFile /etc/nginx/*,/usr/local/etc/nginx/*.conf,*nginx.conf,*webd.conf set filetype=nginx
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.less if &ft == '' | set filetype=less | endif
au BufRead,BufNewFile *.js,*.css,*.html,*.spec,*.less,*.sh,*.conf,*.hs set expandtab
au BufRead /etc/rsnapshot.conf set noexpandtab
au BufRead,BufNewFile *.def.inc set tabstop=8
" au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
" au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au BufRead,BufNewFile php-fpm.conf,php.ini* set filetype=dosini
au BufRead normal zR

" turn off cursorline since yajs performs poorly with it on in some cases
" https://github.com/othree/yajs.vim/issues/37
" https://github.com/othree/yajs.vim/issues/88
au Syntax javascript set nocursorline | set foldmethod=syntax

" put the name of the session in the airline
au VimEnter,BufWinEnter,CursorHold * if exists("g:this_obsession")
	\|		let g:airline_section_y = '%{fnamemodify(g:this_obsession, ":t")}'
	\| else
	\|		let g:airline_section_y = 'no session'
	\| endif

" au BufRead,BufWinEnter *.hs set lazyredraw

" au InsertLeave *.js Neomake!
au BufRead,BufWrite *.js Neomake

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
autocmd BufWrite *.hs :call DeleteTrailingWS()
