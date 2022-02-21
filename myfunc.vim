function! s:search_word(target)
  echo 'Searching ' . a:target
  execute 'tabnew | vim '.a:target.' */** | cw'
endfunction

command! -nargs=1 S call s:search_word(<f-args>)
command! W call s:search_word(expand('<cword>'))

nmap <space>w :W<CR>
