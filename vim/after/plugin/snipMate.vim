" These are the mappings for snipMate.vim. Putting it here ensures that it
" will be mapped after other plugins such as supertab.vim.
if !exists('loaded_snips') || exists('s:did_snips_mappings')
	finish
endif
let s:did_snips_mappings = 1

ino <silent> <tab> <c-r>=TriggerSnippet()<cr>
snor <silent> <tab> <esc>i<right><c-r>=TriggerSnippet()<cr>
ino <silent> <s-tab> <c-r>=BackwardsSnippet()<cr>
snor <silent> <s-tab> <esc>i<right><c-r>=BackwardsSnippet()<cr>
ino <silent> <c-r><tab> <c-r>=ShowAvailableSnips()<cr>

" The default mappings for these are annoying & sometimes break snipMate.
" You can change them back if you want, I've put them here for convenience.
snor <bs> b<bs>
snor <right> <esc>a
snor <left> <esc>bi
snor ' b<bs>'
snor ` b<bs>`
snor % b<bs>%
snor U b<bs>U
snor ^ b<bs>^
snor \ b<bs>\
snor <c-x> b<bs><c-x>

" By default load snippets in snippets_dir
if empty(snippets_dir)
	finish
endif

call GetSnippets(snippets_dir, '_') " Get global snippets

au FileType * if &ft != 'help' | call GetSnippets(snippets_dir, &ft) | endif
" vim:noet:sw=4:ts=4:ft=vim

"added by bco:

"ruby {{{1
function! Snippet_RubyClassNameFromFilename(...)
    let name = expand("%:t:r")
    if len(name) == 0
        if a:0 == 0
            let name = 'MyClass'
        else
            let name = a:1
        endif
    endif
    return Snippet_Camelcase(name)
endfunction

function! Snippet_MigrationNameFromFilename(...)
    let name = substitute(expand("%:t:r"), '^.\{-}_', '', '')
    if len(name) == 0
        if a:0 == 0
            let name = 'MyClass'
        else
            let name = a:1
        endif
    endif
    return Snippet_Camelcase(name)
endfunction




"global {{{1
function! s:start_comment()
    return substitute(&commentstring, '^\([^ ]*\)\s*%s\(.*\)$', '\1', '')
endfunction

function! s:end_comment()
    return substitute(&commentstring, '^.*%s\(.*\)$', '\1', '')
endfunction

function! Snippet_Modeline()
    return s:start_comment() . " vim: set ${1:settings}:" . s:end_comment()
endfunction

function! Snippet_Camelcase(s)
    "upcase the first letter
    let toReturn = substitute(a:s, '^\(.\)', '\=toupper(submatch(1))', '')
    "turn all '_x' into 'X'
    return substitute(toReturn, '_\(.\)', '\=toupper(submatch(1))', 'g')
endfunction

function! Snippet_Underscore(s)
    "down the first letter
    let toReturn = substitute(a:s, '^\(.\)', '\=tolower(submatch(1))', '')
    "turn all 'X' into '_x'
    return substitute(toReturn, '\([A-Z]\)', '\=tolower("_".submatch(1))', 'g')
endfunction


" modeline {{{1
" vim: set fdm=marker:
