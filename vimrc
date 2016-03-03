
" Tab 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Disable sound on tab completion
set visualbell

" XMl formatting
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
