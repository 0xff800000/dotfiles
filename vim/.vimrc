" The default vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Jun 13
"
" This is loaded if no vimrc file was found.
" Except when Vim is run with "-u NONE" or "-C".
" Individual settings can be reverted with ":set option&".
" Other commands can be reverted as mentioned below.

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Bail out if something that ran earlier, e.g. a system wide vimrc, does not
" want Vim to use these default values.
if exists('skip_defaults_vim')
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif

"########## Custom settings ##########"

" Enable lines numbers "
set nu! rnu!
"set number

" Set tab size "
set tabstop=4

" Color theme "
color slate

" Fuzzy search "
" This set the search to recursive
set path+=**

" netrw options "
let g:netrw_altv=1    " open splits to the right
"let g:netrw_banner=0    " disable banner
"let g:netrw_liststyle=3    " tree view

"########## Text object ##########"

" Line
nmap cil 0c$
nmap dil 0d$

"########## Custom keymaps ##########"

" Move line
nmap mj :m++<CR>
nmap mk :m--<CR>

" New tab "
map <C-N> :tabe <CR>
"map <C-M> :q <CR>

" Switch tabs "
map <C-H> gT
imap <C-H> <Esc>gT
map <C-L> gt
imap <C-L> <Esc>gt

" Find word under cursor "
nnoremap <C-d><C-f> /<C-r><C-w><CR>
inoremap <C-d><C-f> <Esc>/<C-r><C-w><CR>

" Find & replace under cursor "
nnoremap <C-d><C-d> :%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>
inoremap <C-d><C-d> <Esc>:%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>

" Find & replace under cursor (confirm) "
nnoremap <C-d><C-k> :%s/\<<C-r><C-w>\>/<C-r><C-w>/c<Left><Left>
inoremap <C-d><C-k> <Esc>:%s/\<<C-r><C-w>\>/<C-r><C-w>/c<Left><Left>

" Find & replace under cursor (line only) "
nnoremap <C-d><C-l> :s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>
inoremap <C-d><C-l> <Esc>:s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>

" Explore "
nnoremap <C-e> :Explore<CR>:set rnu!<CR>


" ########## Plugins ##########"
" Easymotion
set runtimepath^=~/.vim/bundle/vim-easymotion/
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f)

" Tabular
set runtimepath^=~/.vim/bundle/tabular/
