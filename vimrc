colorscheme desert
if filereadable(expand('~/.vim/autoload/plug.vim'))
  call plug#begin('~/.vim/plugged')
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'w0ng/vim-hybrid'
    Plug 'slim-template/vim-slim'
    Plug 'hashivim/vim-terraform'
  call plug#end()
  "set background=dark
  "colorscheme hybrid

  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_auto_colors=0
  let g:indent_guides_start_level=1
  let g:indent_guides_guide_size=1
  hi IndentGuidesOdd  ctermbg=236
  hi IndentGuidesEven ctermbg=243
  " Terraformの自動フォーマット
  let g:terraform_fmt_on_save = 1
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
set list
set listchars=tab:»-,trail:-
set tabstop=2
set shiftwidth=2
set expandtab
au BufNewFile,BufRead *.go set noexpandtab tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.java set expandtab tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.gradle set expandtab tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.groovy set expandtab tabstop=4 shiftwidth=4

" カレント行
"set cursorline

" 121桁目から背景を変える
let &colorcolumn=join([81,91]+range(121,999),",")
hi ColorColumn ctermbg=235 guibg=#2c2d27

" 新しいウィンドウを下に開く
set splitbelow
" 新しいウィンドウを右に開く
set splitright

" 行番号の色を指定
highlight LineNr ctermfg=155

" Vagrantfileのシンタックスハイライト
augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

" Jenkinsifleのシンタックスハイライト
au BufNewFile,BufRead Jenkinsfile setf groovy
