" insert
imap jj <Esc>
imap <c-j> <Down>
imap <c-h> <Left>
imap <c-k> <Up>
imap <c-l> <Right>
imap <c-a> <Esc>0a
imap <c-e> <Esc>$a

" normal
nmap ; :
nmap j gj
nmap k gk
nmap <esc><esc> :nohlsearch<cr><cr>

" defx.nvim 開く
nmap <Space>ls :Defx -columns=icons:indent:filename:type<CR>

" 新しいタブ
nmap <Space>t  :tabnew<CR>

" ターミナル
nmap tt :split<CR><c-w>j<c-w>J<c-w>w10<c-w>+<c-w>j:term<CR>

" WindowsでBackSpace出来ない
if has('win32') || has('win64')
    imap <Char-0x08> <BS>
endif
