set encoding=utf-8
set macmeta
macmenu &File.Close key=<nop>
set guifont=Ubuntu\ Mono\ derivative\ Powerline:h19
" set guifont=Droid\ Sans\ Mono\ for\ Powerline:h19
" set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h19
" set guifont=Source\ Code\ Pro\ for\ Powerline:h19
" set guifont=Menlo:h16
" set guifont=Input\ for\ Powerline:h18
set guioptions-=L
set guioptions=R
set guioptions-=R
if has("mouse")
    set mouse=a
endif
let cwd = getcwd()
" TODO: make the following work somehow
" au BufRead,BufWinEnter * 
" 	\| if getcwd() =~ '/home/sawyer/devel' 
" 	\|	let g:ctrlp_user_command = 'ssh sawyer-dev "find %{cwd} -type f"'
" 	\| elseif has("g:ctrlp_user_command") 
" 	\|  unlet g:ctrlp_user_command 
" 	\| endif

" au BufRead,BufWinEnter * 
" 	\| if getcwd() !~ '/home/sawyer/devel' 
" 	\|	silent !unset $P4DIFF
" 	\| elseif has("g:ctrlp_user_command") 
" 	\|  silent !export P4DIFF=/usr/local/bin/ksdiff
" 	\| endif
