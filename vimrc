" 自動で行末の空白を削除
autocmd BufWritePre * :%s/\s\+$//ge

" 行末の空白をハイライト
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" インデント関連
set tabstop=2
set shiftwidth=2
set expandtab

" カレント行
"set cursorline

" 101桁目から背景を変える
let &colorcolumn=join(range(101,999),",")
hi ColorColumn ctermbg=235 guibg=#2c2d27

" 新しいウィンドウを下に開く
set splitbelow
" 新しいウィンドウを右に開く
set splitright
