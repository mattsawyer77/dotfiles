" toggle between light and dark themes
function! ToggleTheme()
	if &background == "light"
		execute ":set background=dark"
		execute ":colorscheme abra"
		execute ":AirlineTheme hybrid"
		" execute ":colorscheme flatlandia"
		" execute ":AirlineTheme tomorrow"
	else
		execute ":set background=light"
		execute ":colorscheme github"
		execute ":AirlineTheme sol"
	endif
endfunction

" auto-delete trailing spaces for certain filetypes
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  retab!
  exe "normal `z"
endfunc

function FormatJSON(...) 
    let code="\"
        \ var i = process.stdin, d = '';
        \ i.resume();
        \ i.setEncoding('utf8');
        \ i.on('data', function(data) { d += data; });
        \ i.on('end', function() {
        \     console.log(JSON.stringify(JSON.parse(d), null, 
        \ " . (a:0 ? a:1 ? a:1 : 2 : 2) . "));
        \ });\""
    execute "%! node -e " . code 
endfunction
