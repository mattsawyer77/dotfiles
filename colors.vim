" colors
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax on
" colorscheme badwolf
" colorscheme seafoam
" colorscheme distinguished
" colorscheme hemisu
" colorscheme codeschool
" colorscheme darktango2
" colorscheme solarized
" colorscheme jellybeans
" colorscheme mattland
" hi LineNr ctermfg=238 ctermbg=235


"hi Error term=reverse ctermfg=15 ctermbg=12 gui=underline guifg=#E9E8D0 guibg=#BA0423
"hi jsCommentTodo ctermbg=160 ctermfg=255 guibg=#cc2222 guifg=#eeeeee

" NERDTree color fixes
hi NERDTreeRO guifg=#cc2222 ctermfg=red
hi NERDTreeFlag guifg=#552222 ctermfg=red

" good dark color schemes for neovim
" set background=light
set background=dark
" colorscheme flatlandia
colorscheme gruvbox | let g:airline_theme='gruvbox'
" colorscheme hybrid
" colorscheme abra | let g:airline_theme='tomorrow'
" colorscheme mattland | let g:airline_theme='lucius'

" good light color schemes for neovim
" set background=light
" colorscheme github | let g:airline_theme='sol'
" colorscheme Userscape
" colorscheme hemisu | let g:airline_theme='sol'

" toggle between light and dark themes
function! ToggleTheme()
    if &background == "light"
        execute ":set background=dark"
        execute ":colorscheme gruvbox"
        execute ":AirlineTheme lucius"
    else
        execute ":set background=light"
        execute ":colorscheme hemisu"
        execute ":AirlineTheme sol"
    endif
endfunction

" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_contrast_light='hard'
