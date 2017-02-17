" Vim color file
" Converted from Textmate theme PlasticCodeWrap using Coloration v0.3.3 (http://github.com/sickill/coloration)
" and then forked

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "mattland"

hi Cursor ctermfg=16 ctermbg=16 cterm=NONE guifg=#2a2b2f guibg=#FF4740 gui=NONE
hi CursorLineNr guifg=#ffa300 ctermfg=208
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#515559 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#2A2D31 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#3b3e40 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#3b3e40 gui=NONE
hi LineNr ctermfg=102 ctermbg=235 cterm=NONE guifg=#445566 guibg=#222222 gui=NONE
hi VertSplit ctermfg=241 ctermbg=241 cterm=NONE guifg=#636567 guibg=#636567 gui=NONE
hi MatchParen ctermfg=209 ctermbg=NONE cterm=underline guifg=#fa9a4b guibg=NONE gui=underline
hi StatusLine ctermfg=231 ctermbg=241 cterm=bold guifg=#f8f8f8 guibg=#636567 gui=bold
hi StatusLineNC ctermfg=231 ctermbg=241 cterm=NONE guifg=#f8f8f8 guibg=#636567 gui=NONE
hi Pmenu ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#3c3f42 gui=NONE
hi Search ctermfg=0 ctermbg=6 cterm=NONE guibg=#5AB6DB guifg=#311F17
hi IncSearch ctermfg=0 ctermbg=7 cterm=NONE guifg=#9FF3F6 guibg=#000 gui=NONE
hi Directory ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi Folded ctermfg=102 ctermbg=16 cterm=NONE guifg=#798188 guibg=#26292c gui=NONE
hi Normal ctermfg=250 ctermbg=NONE cterm=NONE guifg=#aabbcc guibg=#23272A gui=NONE
hi Boolean ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi Character ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi Comment ctermfg=102 ctermbg=NONE cterm=NONE guifg=#798188 guibg=NONE gui=NONE
hi Conditional ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi Constant ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi Define ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f8f8f8 guibg=#46830e gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8b0809 guibg=NONE gui=NONE
hi DiffChange ctermfg=231 ctermbg=23 cterm=NONE guifg=#f8f8f8 guibg=#233a5a gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f8f8f8 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=231 ctermbg=124 cterm=NONE guifg=#f8f8f8 guibg=#aa2915 gui=NONE
hi WarningMsg ctermfg=231 ctermbg=124 cterm=NONE guifg=#f8f8f8 guibg=#aa2915 gui=NONE
hi Float ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi Function ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=bold
hi Identifier ctermfg=228 ctermbg=NONE cterm=NONE guifg=#f6f080 guibg=NONE gui=NONE
hi Keyword ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi Label ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f6f6f6 guibg=NONE gui=NONE
hi NonText ctermfg=102 ctermbg=59 cterm=NONE guifg=#7a8288 guibg=#313336 gui=NONE
hi Number ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi Operator ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi PreProc ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f8 guibg=NONE gui=NONE
hi SpecialKey ctermfg=102 ctermbg=59 cterm=NONE guifg=#7a8288 guibg=#3b3e40 gui=NONE
hi Statement ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi StorageClass ctermfg=228 ctermbg=NONE cterm=NONE guifg=#f6f080 guibg=NONE gui=NONE
hi String ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f6f6f6 guibg=NONE gui=NONE
hi Tag ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f8f8f8 guibg=NONE gui=bold
hi Todo ctermfg=102 ctermbg=NONE cterm=inverse,bold guifg=#798188 guibg=NONE gui=inverse,bold
hi Type ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi rubyFunction ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi rubyConstant ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f6f6f6 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyInclude ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyRegexp ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi rubyEscape ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi rubyControl ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyOperator ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi rubyException ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fa9a4b guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=102 ctermbg=NONE cterm=NONE guifg=#798188 guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi htmlTag ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b7d877 guibg=NONE gui=NONE
hi htmlEndTag ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b7d877 guibg=NONE gui=NONE
hi htmlTagName ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b7d877 guibg=NONE gui=NONE
hi htmlArg ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b7d877 guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=221 ctermbg=NONE cterm=NONE guifg=#f1e94b guibg=NONE gui=NONE
hi yamlKey ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi yamlAnchor ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi yamlAlias ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f6f6f6 guibg=NONE gui=NONE
hi cssURL ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi cssFunctionName ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi cssColor ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi cssClassName ctermfg=74 ctermbg=NONE cterm=NONE guifg=#72aaca guibg=NONE gui=NONE
hi cssValueLength ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b8d977 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=150 ctermbg=NONE cterm=NONE guifg=#b7d877 guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi SignColor guibg=#2D2F31 
hi FoldColumn ctermbg=235 guibg=#444444

" extended javascript syntax highlighting:
hi jsPrototype ctermfg=80
hi jsFuncCall ctermfg=195 guifg=#D7FFFF
hi jsFuncName ctermfg=195 guifg=#D7FFFF
hi jsFunction ctermfg=195 guifg=#D7FFFF
hi jsParens ctermfg=195
hi jsFuncParens ctermfg=195
hi jsBrackets ctermfg=195
hi jsBraces ctermfg=195
hi jsRegexpQuantifier ctermfg=191
hi jsRegexpBoundary ctermfg=191
hi jsObjectKey ctermfg=250
"hi jsStorageClass       "const var let
"hi jsOperator           "delete instanceof typeof void new in
"hi jsBooleanTrue        "true
"hi jsBooleanFalse       "false
hi jsCommentTodo ctermbg=160 ctermfg=254       "TODO FIXME XXX TBD contained
"hi jsLineComment        "start=+\/\/+ end=+$+ keepend contains=jsCommentTodo,@Spell
"hi jsEnvComment         "start="\%^#!" end="$" display
"hi jsLineComment        "start=+^\s*\/\/+ skip=+\n\s*\/\/+ end=+$+ keepend contains=jsCommentTodo,@Spell fold
"hi jsCvsTag             "start="\$\cid:" end="\$" oneline contained
"hi jsComment            "start="/\*"  end="\*/" contains=jsCommentTodo,jsCvsTag,@Spell fold
hi jsStringD ctermbg=236 ctermfg=254 guibg=#36342C         "start=+"+  skip=+\\\\\|\\$"+  end=+"+  contains=jsSpecial,@htmlPreproc,@Spell
hi jsStringS ctermbg=236 ctermfg=254 guibg=#36342C         "start=+'+  skip=+\\\\\|\\$'+  end=+'+  contains=jsSpecial,@htmlPreproc,@Spell
"hi jsTemplateString     "start=+`+  skip=+\\\\\|\\$`+  end=+`+  contains=jsTemplateVar,jsSpecial,@htmlPreproc
hi jsRegexpCharClass ctermfg=191   "start=+\[+ skip=+\\.+ end=+\]+ contained
hi jsRegexpGroup ctermfg=191      "start="\\\@<!(" end="\\\@<!)" contained contains=jsRegexpCharClass,@jsRegexpSpecial keepend
hi jsRegexpString ctermfg=191      "start=+\(\(\(return\|case\)\s\+\)\@<=\|\(\([)\]"']\|\d\|\w\)\s*\)\@<!\)/\(\*\|/\)\@!+ skip=+\\.\|\[\(\\.\|[^]]\)*\]+ end=+/[gimy]\{,4}+ contains=jsRegexpCharClass,jsRegexpGroup,@jsRegexpSpecial,@htmlPreproc oneline keepend
hi jsNumber ctermfg=160            "Infinity
"hi jsStatement          "break continue with
"hi jsConditional        "if else switch
"hi jsRepeat             "do while for
"hi jsLabel              "case default
"hi jsKeyword            "yield
"hi jsException          "try catch throw finally
"hi jsGlobalObjects      "Array Boolean Date Function Iterator Number Object RegExp String Proxy ParallelArray ArrayBuffer DataView Float32Array Float64Array Int16Array Int32Array Int8Array Uint16Array Uint32Array Uint8Array Uint8ClampedArray Intl JSON Math console document window
"hi jsExceptions         "Error EvalError InternalError RangeError ReferenceError StopIteration SyntaxError TypeError URIError
"hi jsBuiltins           "decodeURI decodeURIComponent encodeURI encodeURIComponent eval isFinite isNaN parseFloat parseInt uneval
"hi jsFutureKeys         "abstract enum int short boolean export interface static byte extends long super char final native synchronized class float package throws goto private transient debugger implements protected volatile double import public
"hi jsGlobalObjects      "DOMImplementation DocumentFragment Document Node NodeList NamedNodeMap CharacterData Attr Element Text Comment CDATASection DocumentType Notation Entity EntityReference ProcessingInstruction
"hi jsExceptions         "DOMException
"hi jsDomErrNo           "INDEX_SIZE_ERR DOMSTRING_SIZE_ERR HIERARCHY_REQUEST_ERR WRONG_DOCUMENT_ERR INVALID_CHARACTER_ERR NO_DATA_ALLOWED_ERR NO_MODIFICATION_ALLOWED_ERR NOT_FOUND_ERR NOT_SUPPORTED_ERR INUSE_ATTRIBUTE_ERR INVALID_STATE_ERR SYNTAX_ERR INVALID_MODIFICATION_ERR NAMESPACE_ERR INVALID_ACCESS_ERR
"hi jsDomNodeConsts      "ELEMENT_NODE ATTRIBUTE_NODE TEXT_NODE CDATA_SECTION_NODE ENTITY_REFERENCE_NODE ENTITY_NODE PROCESSING_INSTRUCTION_NODE COMMENT_NODE DOCUMENT_NODE DOCUMENT_TYPE_NODE DOCUMENT_FRAGMENT_NODE NOTATION_NODE
"hi jsHtmlEvents         "onblur onclick oncontextmenu ondblclick onfocus onkeydown onkeypress onkeyup onmousedown onmousemove onmouseout onmouseover onmouseup onresize
"hi jsBracket            "matchgroup=jsBrackets     start="\[" end="\]" contains=@jsAll,jsParensErrB,jsParensErrC,jsBracket,jsParen,jsBlock,@htmlPreproc fold
"hi jsParen              "matchgroup=jsParens       start="("  end=")"  contains=@jsAll,jsParensErrA,jsParensErrC,jsParen,jsBracket,jsBlock,@htmlPreproc fold
hi jsBlock ctermfg=255             "matchgroup=jsBraces       start="{"  end="}"  contains=@jsAll,jsParensErrA,jsParensErrB,jsParen,jsBracket,jsBlock,jsObjectKey,@htmlPreproc fold
hi jsFuncBlock ctermfg=254 guifg=#DEEFF0        "matchgroup=jsFuncBraces   start="{"  end="}"  contains=@jsAll,jsParensErrA,jsParensErrB,jsParen,jsBracket,jsBlock,@htmlPreproc contained fold
"hi jsTernaryIf          "matchgroup=jsTernaryIfOperator start=+?+  end=+:+  contains=@jsExpression,jsTernaryIf
hi jsFuncArgs ctermfg=254          "contained matchgroup=jsFuncParens start='(' end=')' contains=jsFuncArgCommas,jsFuncArgRest nextgroup=jsFuncBlock keepend skipwhite skipempty
"hi jsArgsObj            "arguments contained containedin=jsFuncBlock
hi jsDocTags ctermfg=102 ctermbg=NONE cterm=NONE guifg=#A9B4C0 guibg=NONE gui=NONE
hi jsDocParam ctermfg=102 ctermbg=NONE cterm=NONE guifg=#A9B4C0 guibg=NONE gui=NONE
