" OS毎に設定を変える
if has('win32') || has('win64')
    let s:dein_dir  = expand('~/AppData/Local/nvim')
    let s:dein_toml = expand('~/AppData/Local/nvim/plug/normal.toml')
    let g:python3_host_prog='C:\Python39\python.exe'
else
    let s:dein_dir  = expand('~/.config/nvim')
    let s:dein_toml = expand('~/.config/nvim/plug/normal.toml')
endif

" 基本設定
execute 'source '.s:dein_dir.'/normal.vim'

" キーマップ設定
execute 'source '.s:dein_dir.'/keymap.vim'

" dein.vim 設定 {{{
if &compatible
    set nocompatible
endif

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#load_toml(s:dein_toml, {'lazy': 0})
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
    call map(s:removed_plugins, "delete(v:val, 'rf')")
    call dein#recache_runtimepath()
endif
"}}}

" プラグイン 設定
execute 'source '.s:dein_dir.'/plugin.vim'

set guicursor+=n:ver10,v:ver10,c:ver10

filetype plugin indent on
syntax enable

colorscheme molokai
