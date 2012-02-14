syntax enable

set background=dark

set lisp
set ai

filetype on
au BufNewFile,BufRead *.rkt set filetype=scheme
au BufRead,BufNewFile *.go set filetype=go
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"Highlight lines over 80 chars
:match ErrorMsg '\%>80v.\+'
