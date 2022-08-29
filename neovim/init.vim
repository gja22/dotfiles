"-----Neovim Configuration File-----
" Geoff Apps
"

" listchar options ----------{{{
set showbreak=↪
set lcs=tab:».,trail:•,nbsp:␣,eol:↲,extends:⟩,precedes:⟨
set nolist
" }}}

" vimrc ----------{{{
" Use the following command to see all commands mapped to ,
" This is useful when youo find clashes or delays etc.
" :map ,
set exrc       " source local vimrc files, useful for per-project settings
" edit vimrc
nnoremap <leader>v :tabedit $MYVIMRC<cr>
" source vimrc
nnoremap <leader>u :so $MYVIMRC<CR>
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

