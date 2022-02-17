function! S(target)
  echo a:target
  execute ':vim '.a:target.' */** | cw'
endfunction
command! -nargs=1 S call S(<f-args>)
