function! s:search_word(target)
  echo 'Searching ' . a:target
  execute 'tabnew | vim '.a:target.' */** | cw'
endfunction

command! -nargs=1 S call s:search_word(<f-args>)
command! W call s:search_word(expand('<cword>'))

function! s:search_file(target)
  echo 'Searching ' . a:target
  let l:command = 'find ./ -name '.a:target
  echo l:command
  let l:f_path = system(l:command)
  echo l:f_path
  "execute 'tabnew | edit '.f_path
endfunction

command! Find call s:search_file(<f-args>)

nmap <space>w :W<CR>
