" =============================================================
" Description:  Set up Vim for Editing Shell Files
" File:         ~/.vim/ftplugin/sh.vim
" =============================================================

" Set up Vim make and quickfix
if executable('shellcheck')
    setlocal makeprg=shellcheck\ -f\ gcc\ %
endif