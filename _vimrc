runtime bundle/pathogen/autoload/pathogen.vim

set nocompatible
source $VIMRUNTIME/vimrc_example.vim

if has("win64") || has("win32") || has("win16")
	source $VIMRUNTIME/mswin.vim
	behave mswin
	cd ~\Documents
endif

call pathogen#infect()
Helptags " generate documentation from each directory in runtimepath

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set background=dark
colorscheme solarized

set tabstop=2
set shiftwidth=0
set shiftround
set number
set backupskip+=bzr_log*
set showmatch
filetype plugin indent on " turn on filetype plugins, and the indent files for specific filetypes

set ssop=blank,curdir,folds,options,tabpages,winsize
set guifont=Consolas

autocmd BufNewFile,BufRead *.json set ft=javascript
