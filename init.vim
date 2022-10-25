" OS毎に設定を変える
if has('win32') || has('win64')
    let s:dein_dir  = expand('~/AppData/Local/nvim')
    let s:dein_toml = expand('~/AppData/Local/nvim/plug/normal.toml')
    let g:python3_host_prog='C:\Users\sweshelo\scoop\shims\python3.exe'
    set shell=pwsh.exe
    set shellxquote=
    set shellcmdflag=-NoProfile\ -NoLogo\ -NonInteractive\ -C
    set guifont=RictyDiminished\ NF:h12
    " PowerShell 辞書ロード
    autocmd FileType powershell,ps1,psm1 set dictionary+=~/AppData/Local/nvim/plug/dict/powershell.dict
else
    let s:dein_dir  = expand('~/.config/nvim')
    let s:dein_toml = expand('~/.config/nvim/plug/normal.toml')
    set guifont=RictyDiminished\ NF\ 12
    autocmd FileType powershell,ps1,psm1 set dictionary+=~/.config/nvim/plug/dict/powershell.dict
endif

" 基本設定
execute 'source '.s:dein_dir.'/normal.vim'

" キーマップ設定
execute 'source '.s:dein_dir.'/eucalyn.vim'

" myfunc
execute 'source '.s:dein_dir.'/myfunc.vim'

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
autocmd BufRead,BufNewFile *.ts set filetype=typescript

set guicursor+=n:ver30,v:ver30,c:ver30,i:ver30

filetype plugin indent on
syntax enable

" QuickFix時
autocmd FileType qf nnoremap <buffer> j j<CR><c-w>j
autocmd FileType qf nnoremap <buffer> k k<CR><c-w>j

" Terminalで行番号非表示
autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber
autocmd FileType defx setlocal nonumber

colorscheme molokai
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
highlight EndOfBuffer ctermfg=black ctermbg=black guifg=black guibg=black
highlight CocFloating ctermbg=236
highlight CocErrorFloat ctermbg=52
