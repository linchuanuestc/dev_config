set completeopt-=preview
let g:go_autodetect_gopath = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_def_mod_mode='godef'
let g:go_code_completion_enabled = 0 
let g:go_gopls_enabled = 0
let g:go_def_mapping_enabled = 0
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
au filetype go inoremap <buffer> . .<C-x><C-o>
