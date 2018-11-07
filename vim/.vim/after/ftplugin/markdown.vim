" =============================================================
" Description:  Improve Vim's Markdown Editing
" File:         ~/.vim/after/ftplugin/markdown.vim
" =============================================================

setlocal commentstring=<!--%s-->
" setlocal commentstring=[//]:\ #\ (%s)

" Modified version of the default `MarkdownFold()` function, to not react to
" `#` characters in code blocks.
function! MarkdownFold()
    let l:line = getline(v:lnum)

    " Regular headers
    let l:depth = match(l:line, '\(^#\+\)\@<=\( .*$\)\@=')
    if l:depth > 0 && s:isHeading(v:lnum)
        return ">" . l:depth
    endif

    " Setext style headings
    let l:nextline = getline(v:lnum + 1)
    if (l:line =~ '^.\+$') && (l:nextline =~ '^=\+$') && s:isHeading(v:lnum + 1)
        return ">1"
    endif

    if (l:line =~ '^.\+$') && (l:nextline =~ '^-\+$') && s:isHeading(v:lnum + 1)
        return ">2"
    endif

    return "="
endfunction

function! s:isHeading(line)
    return synIDattr(synID(a:line, 1, 1), 'name') =~# '^markdownHeading\(Delimiter\|Rule\)$'
endfunction

setlocal foldexpr=MarkdownFold()
setlocal foldmethod=expr
setlocal foldlevel=1

" Don't enable folding by default, as it can make the file difficult to read.
setlocal nofoldenable

" Make folds more readable
setlocal foldtext=getline(v:foldstart)
setlocal fillchars-=fold:-
setlocal fillchars+=fold:\ 
