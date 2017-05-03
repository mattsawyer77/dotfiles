" filetype mapping
au BufRead,BufNewFile /etc/nginx/*,/usr/local/etc/nginx/*.conf,*nginx.conf,*webd.conf set filetype=nginx
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.less if &ft == '' | set filetype=less | endif
au BufRead,BufNewFile *.js,*.css,*.html,*.spec,*.less,*.sh,*.conf,*.hs,*.rkt,*.rktl set expandtab
au BufRead /etc/rsnapshot.conf set noexpandtab
au BufRead,BufNewFile *.def.inc set tabstop=8 noexpandtab
" au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
" au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au BufRead,BufNewFile php-fpm.conf,php.ini* set filetype=dosini
au BufRead set nofoldenable
" attempt to go to the line we last left when reopening a file
au BufWinLeave ?* silent! mkview
au BufWinEnter ?* silent! loadview

au BufRead,BufNewFile *.js setlocal ts=4 sts=4 sw=4 expandtab
au BufRead,BufNewFile *.html setlocal ts=4 sts=4 sw=4 expandtab
au BufRead,BufNewFile *.less setlocal ts=4 sts=4 sw=4 expandtab
au BufRead,BufNewFile *.css setlocal ts=4 sts=4 sw=4 expandtab
au Filetype elixir setlocal ts=2 sts=2 sw=2 expandtab
au Filetype racket,lisp,clojure,scheme RainbowParentheses
au Filetype racket,lisp,clojure,scheme setlocal expandtab
au BufRead,BufNewFile *.hs,*.lhs setlocal ts=2 sts=2 sw=2 expandtab
au Filetype yaml setlocal autoindent sw=4 ts=4 expandtab
" put the name of the session in the airline
au VimEnter,BufWinEnter,CursorHold * if exists("g:this_obsession")
	\|		let g:airline_section_y = '%{fnamemodify(g:this_obsession, ":t")}'
	\| else
	\|		let g:airline_section_y = 'no session'
	\| endif

" au BufRead,BufWinEnter *.hs set lazyredraw

" au InsertLeave *.js Neomake!
" au BufRead,BufWrite *.js Neomake
" au BufRead,BufWrite *.ex Neomake
" au BufRead,BufWrite *.exs Neomake
" au BufRead,BufWrite *.html Neomake
" au BufRead,BufWrite *.less Neomake

" rainbow parenthesis
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

" deoplete
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1

  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.html :call DeleteTrailingWS()
autocmd BufWrite *.css :call DeleteTrailingWS()
autocmd BufWrite *.less :call DeleteTrailingWS()
autocmd BufWrite *.yaml :call DeleteTrailingWS()
autocmd BufWrite *.conf :call DeleteTrailingWS()
autocmd BufWrite *.lua :call DeleteTrailingWS()
autocmd BufWrite *.bash :call DeleteTrailingWS()
autocmd BufWrite *.hs :call DeleteTrailingWS()
