call plug#begin()
Plug 'editorconfig/editorconfig-vim'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
call plug#end()

augroup autoformat_settings
  autocmd FileType c,cpp AutoFormatBuffer clang-format
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType python AutoFormatBuffer black
augroup END

set number

function! s:Pandoc()
  let mdpath = expand('%:p')
  let pdfpath = expand('%:p:r') . '.pdf'
  write
  execute('!pandoc --defaults=$HOME/.pandoc.yaml ' . mdpath . ' -o ' . pdfpath)
endfunction
command! Pandoc call s:Pandoc()

function! s:Latexmk()
  let texpath = expand('%:p')
  write
  execute('!latexmk ' . texpath)
endfunction
command! Latexmk call s:Latexmk()
