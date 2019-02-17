" Based on: https://github.com/zhester/vim-hz/blob/master/colors/mindark.vim

" ============================================================================
" This file does not define the colors.  This, rather, gets the ANSI colors in
" a good arrangement to be used with the TTY's scheme.
"
"  0 black              (unmapped)
"  1 red                (unmapped)
"  2 green              string literals
"  3 yellow             (unmapped)
"  4 blue               type identifiers
"  5 magenta            (unmapped)
"  6 cyan               comments
"  7 white              normal text foreground
"  8 bblack             (unmapped)
"  9 bred               (unmapped)
" 10 bgreen             (unmapped)
" 11 byellow            (unmapped)
" 12 bblue              (unmapped)
" 13 bmagenta           (unmapped)
" 14 bcyan              (unmapped)
" 15 bwhite             highlighted/special foreground
" ============================================================================

" TODO make some keywords bold
" TODO go through syntax.txt and see which items have been missed

"-----------------------------------------------------------------------------
" Colorscheme Boilerplate
"-----------------------------------------------------------------------------

" This is a dark scheme.
set background=dark

" Drop current highlighting.
highlight clear

" Reset highlighting to the defaults.
if exists('syntax_on')
    syntax reset
endif

" Set the name of the scheme.
let g:colors_name = 'envy'

"-----------------------------------------------------------------------------
" Editor Display
"-----------------------------------------------------------------------------

" Normal Text (everything that isn't "highlighted", must be first in scheme)
hi Normal           cterm=none      ctermbg=none    ctermfg=7
hi link Terminal Normal

" Cursor and Selection
hi Cursor           cterm=none      ctermbg=none    ctermfg=11
hi CursorColumn     cterm=none      ctermbg=none    ctermfg=none
hi CursorLine       cterm=none      ctermbg=none    ctermfg=none
hi Visual           cterm=reverse   ctermbg=0       ctermfg=none
hi link VisualNOS Visual

" Window Margins
hi LineNr           cterm=none      ctermbg=0       ctermfg=15
hi CursorLineNr     cterm=bold      ctermbg=none    ctermfg=7
hi SignColumn       cterm=none      ctermbg=none    ctermfg=13
hi ColorColumn      cterm=none      ctermbg=0       ctermfg=none
hi VertSplit        cterm=none      ctermbg=0       ctermfg=7

" Status Line
hi StatusLine       cterm=bold,reverse   ctermbg=0  ctermfg=15
hi StatusLineNC     cterm=none           ctermbg=8  ctermfg=15
hi link StatusLineTerm StatusLine
hi link StatusLineTermNC StatusLineNC
hi WildMenu         cterm=bold      ctermbg=4       ctermfg=15

" Tab Line
hi! link TabLine StatusLineNC
hi! link TabLineFill StatusLine
hi! link TabLineSel WildMenu

" Folds
hi Folded           cterm=bold      ctermbg=none    ctermfg=4
hi FoldColumn       cterm=none      ctermbg=none    ctermfg=4

" Popup Menu
hi Pmenu            cterm=none      ctermbg=15      ctermfg=4
hi PmenuSel         cterm=none      ctermbg=4       ctermfg=15
hi! link PmenuSbar Pmenu
hi! link PmenuThumb PmenuSel

"-----------------------------------------------------------------------------
" In-buffer Highlighting
"-----------------------------------------------------------------------------

" Search
hi Search           cterm=none      ctermbg=4       ctermfg=7
hi! link IncSearch Search

" Spell
hi SpellBad         cterm=underline ctermbg=none    ctermfg=1
hi SpellCap         cterm=underline ctermbg=none    ctermfg=12
hi SpellLocal       cterm=underline ctermbg=none    ctermfg=12
hi SpellRare        cterm=underline ctermbg=none    ctermfg=none

" Special
hi Special          cterm=none      ctermbg=none    ctermfg=12
hi link SpecialChar Special
hi link SpecialComment Special

" Other
hi Underlined       cterm=underline
hi MatchParen       cterm=bold,underline    ctermbg=none    ctermfg=10
hi Conceal          cterm=none              ctermbg=none    ctermfg=15
hi NonText          cterm=none              ctermbg=none    ctermfg=4

"-----------------------------------------------------------------------------
" Informational Highlighting
"-----------------------------------------------------------------------------

" FIXME Errors and Debugging
hi Error            cterm=bold      ctermbg=15      ctermfg=1
hi Warning          cterm=bold      ctermbg=15      ctermfg=5
hi link ErrorMsg Error
hi link WarningMsg Warning
hi QuickFixLine     cterm=none      ctermbg=none    ctermfg=2

"-----------------------------------------------------------------------------
" Code Syntax Highlighting
"-----------------------------------------------------------------------------

" Highlight other delimiters the same as parenthesis.
hi link Delimiter Parens

" Comments
hi Comment          cterm=none      ctermbg=none    ctermfg=6
hi Todo             cterm=bold      ctermbg=none    ctermfg=10

" Constants
hi Constant         cterm=none      ctermbg=none    ctermfg=1
hi String           cterm=none      ctermbg=none    ctermfg=2

" Highlight other constants similarly.
hi link Boolean Constant
hi link Character Constant
hi link Float Constant
hi link Number Constant

" Include the quotation marks when highlighting string constants.
hi link StringDelimiter String

" Named Identifiers
hi Function         cterm=none      ctermbg=none    ctermfg=15
hi Identifier       cterm=none      ctermbg=none    ctermfg=15

" Language Constructs
hi Operator         cterm=none      ctermbg=none    ctermfg=15
hi Statement        cterm=none      ctermbg=none    ctermfg=15

" Preprocessor
hi PreProc          cterm=none      ctermbg=none    ctermfg=15
" hi PreProc          cterm=none      ctermbg=none    ctermfg=5

" Types
hi Type             cterm=none      ctermbg=none    ctermfg=15

" Vimdiff
hi DiffAdd          cterm=none      ctermbg=none    ctermfg=2
hi DiffChange       cterm=none      ctermbg=none    ctermfg=3
hi DiffDelete       cterm=none      ctermbg=none    ctermfg=1
hi DiffText         cterm=none      ctermbg=none    ctermfg=4

"-----------------------------------------------------------------------------
" File Type
"-----------------------------------------------------------------------------

" Diff
hi link diffAdded DiffAdd
hi link diffRemoved DiffDelete

" TODO HTML
hi link htmlSpecialTagName Tag
hi htmlBold         cterm=bold      ctermbg=none    ctermfg=7
hi htmlItalic       cterm=none      ctermbg=none    ctermfg=7

" TODO Markdown
hi link mdBold htmlBold
hi link mdItalic htmlItalic

" Git Commit
hi gitcommitOverflow    cterm=none      ctermbg=none    ctermfg=12
hi gitcommitFile        cterm=none      ctermbg=none    ctermfg=5

" Vim
hi helpHyperTextJump    cterm=none      ctermbg=none    ctermfg=4
hi helpOption           cterm=none      ctermbg=none    ctermfg=5

" ----------------------------------------------------------------------------
" Colorscheme Maintenance Helpers
" ----------------------------------------------------------------------------

function! s:SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction
" TODO use <plug>
nnoremap <leader>h :call <SID>SynStack()<CR>
