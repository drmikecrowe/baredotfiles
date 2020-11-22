"
" dotphiles : https://github.com/dotphiles/dotphiles
"
" Setup vim and load required plugins before dotvim
"
" Authors:
"   Ben O'Hara <bohara@gmail.com>
"

if has("user_commands")
  set nocompatible
  filetype off
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  let g:vundles=['general', 'git', 'programming', 'completion', 'python', 'javascript', 'html', 'misc']
  let g:neocomplcache_enable_at_startup = 1
  " Load 'vundles'
  source ~/.vim/vundles.vim
  " Add extra bundles here...
  " Bundle 'reponame'
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'vim-airline/vim-airline-themes'
  Bundle 'endel/vim-github-colorscheme'
endif


" Call dotvim
source ~/.vim/dotvim.vim

" Override colorscheme from base16
" let g:dotvim_colorscheme = 'github'

" Customize to your needs...
syntax on
filetype plugin indent on
set autochdir                       "auto-change directory to current file
set magic
set mat=2
set nocompatible                    "set nofoldenable
set noeb " disable error bells
set nohlsearch

