" lightline 設定
let g:lightline = {
    \ 'colorscheme': 'deus',
    \ 'component': {
    \   'readonly': '%{&readonly?"x":""}',
    \ },
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
    \ }

" deoplete
let g:deoplete#enable_at_startup = 1

autocmd

" nerdtree 設定
" 引数なしでvimを開いたらNERDTreeを起動
autocmd vimenter * if !argc() | NERDTree | endif

" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
