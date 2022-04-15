function! s:search_word(target)
  echo 'Searching ' . a:target
  execute 'tabnew | vimgrep '.a:target.' `git ls-files` | cw'
endfunction

command! -nargs=1 S call s:search_word(<f-args>)
command! W call s:search_word(expand('<cword>'))

function! s:search_file(target)
  echo 'Searching ' . a:target
  let l:command = 'find `git ls-files` -name '.a:target
  echo l:command
  let l:f_path = system(l:command)
  echo l:f_path
  "execute 'tabnew | edit '.f_path
endfunction

function! s:get_filepath()
  echo expand('%:h')
endfunction

command! Find call s:search_file(<f-args>)
command! Path call s:get_filepath()

nmap <space>w :W<CR>
