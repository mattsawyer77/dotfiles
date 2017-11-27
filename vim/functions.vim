" auto-delete trailing spaces for certain filetypes
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    retab!
    exe "normal `z"
endfunc

function! FormatJSON(...)
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

" quickfixopenall.vim
"Author:
"   Tim Dahlin
"
"Description:
"   Opens all the files in the quickfix list for editing.
"
"Usage:
"   1. Perform a vimgrep search
"       :vimgrep /def/ *.rb
"   2. Issue QuickFixOpenAll command
"       :QuickFixOpenAll

function! QuickFixOpenAll()
    if empty(getqflist())
        return
    endif
    let s:prev_val = ""
    for d in getqflist()
        let s:curr_val = bufname(d.bufnr)
        if (s:curr_val != s:prev_val)
            exec "edit " . s:curr_val
        endif
        let s:prev_val = s:curr_val
    endfor
endfunction

command! QuickFixOpenAll call QuickFixOpenAll()

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
"
" Helper function, called below with mappings
function! HaskellFormat(which) abort
  if a:which ==# 'hindent' || a:which ==# 'both'
    :Hindent
  endif
  if a:which ==# 'stylish' || a:which ==# 'both'
    silent! exe 'undojoin'
    silent! exe 'keepjumps %!stylish-haskell'
  endif
endfunction
