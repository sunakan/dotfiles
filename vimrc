colorscheme desert

if filereadable(expand('~/.vim/autoload/plug.vim'))
  call plug#begin('~/.vim/plugged')
    Plug 'nathanaelkane/vim-indent-guides'
  call plug#end()
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_auto_colors=0
  let g:indent_guides_start_level=1
  let g:indent_guides_guide_size=1
  hi IndentGuidesOdd  ctermbg=236
  hi IndentGuidesEven ctermbg=243
endif

" 自動で行末の空白を削除
autocmd BufWritePre * :%s/\s\+$//ge

" 行末の空白をハイライト
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=1
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" インデント関連
set tabstop=2
set shiftwidth=2
set expandtab
au BufNewFile,BufRead *.go set noexpandtab tabstop=4 shiftwidth=4

" カレント行
"set cursorline

" 121桁目から背景を変える
let &colorcolumn=join(range(121,999),",")
hi ColorColumn ctermbg=235 guibg=#2c2d27

" 新しいウィンドウを下に開く
set splitbelow
" 新しいウィンドウを右に開く
set splitright
