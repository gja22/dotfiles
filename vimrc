"-----Vim Configuration File-----
" Geoff Apps
"
" basics ----------{{{
set nocompatible                         " Latest Vim features
filetype plugin on
set encoding=utf8                        " Set utf8 as standard encoding
set fileencoding=utf8                    " Set utf8 as standard encoding
" }}}

" Leader ----------{{{ 
let mapleader=" "
" }}}

" Syntax highlighting and colorscheme ----------{{{
syntax enable
colorscheme gruvbox
set background=dark
" }}}

" display options ----------{{{
set cursorline                 " highlight the current line
set number                     " show line numbers
set colorcolumn=80             " visually indicate line width
set signcolumn=yes             " always show sign column (errors etc.)
" easy toggling of numbering
nnoremap <leader>r :set relativenumber!<CR>
nnoremap <leader>n :set number!<CR>
set wrap                       " wrap long lines
set linebreak                  " split on whitespace, no broken words
set showmatch                  " show matching brackets
set showmode                   " show INSERT, VISUAL, etc. mode in command line
set showcmd                    " show active command in command line
set scrolloff=3                " lines to keep above/below when scrolling
" }}}

" tabs and indenting ----------{{{
set backspace=indent,eol,start       " make backspace behave like other editors
set smarttab                         " better backspace and tab functionality
set autoindent                       " auto indenting
set smartindent                      " smart indenting
set expandtab                        " spaces instead of tabs
set tabstop=2                        " 2 spaces for tabs
set shiftwidth=2                     " 2 spaces for indentation
" }}}

" listchar options ----------{{{ 
set showbreak=↪
set lcs=tab:».,trail:•,nbsp:␣,eol:↲,extends:⟩,precedes:⟨
set nolist
" toggle listchars, mnemonic h is for hidden
nnoremap <leader>h :set list!<CR>
" }}}

" writing options ----------{{{ 
" redraw long/short lines onto muliple lines 
nnoremap <leader>d gqip<CR>
" }}}

" code folding ----------{{{
" easy toggling of folded sections
" clashes with easymotion, still figuring out best folding shortcuts
" nnoremap <leader><space> za
" }}}

" warnings ----------{{{
set noerrorbells                         " turn off audio bell
set visualbell                           " leave on visual bell
" }}}

" backup directories ----------{{{
set backupdir=~/.vim/backup
set directory=~/.vim/swp
set undodir=~/.vim/undo
" }}}

" save and quit ----------{{{
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
set hidden                    " don't force buffer saves
" }}}

" buffers ----------{{{
" list buffers and allow selection
" not sure that I still need this now that I am using ctrlp
" nnoremap <leader>l :ls<CR>:b<Space>
" Change local directory to location of current open file in window
" nnoremap <leader>cd :lcd %:h<CR>
" open files from working directory
" nnoremap <leader>e :edit<Space>
" nnoremap <leader>ee :edit<Space>
" open files located within the same dir in with the current file is edited
" nnoremap <leader>ew :edit <C-R>=expand("%:.:h") . "/"<CR>
" }}}

" windows ----------{{{
set splitbelow
set splitright
" fast window creation
nnoremap <leader><Right> <C-w>v
nnoremap <leader><Down> <C-w>s
" close current window
nnoremap <leader>c :close<CR>
" close other windows
nnoremap <leader>o :only<CR>
" make all windows equal size
nnoremap <leader>= <C-w>=
" increase height of window
nnoremap <leader><Up> <C-w>5+
" increase width of window
nnoremap <leader><Left> <C-w>5>
" use arrows in normal mode to move between windows.
" makes me smile every time!
nnoremap <Down> <c-w>j
nnoremap <Up> <c-w>k
nnoremap <Left> <c-w>h
nnoremap <Right> <c-w>l
" }}}

" tabs ----------{{{
"nnoremap tn :tabnew<Space>
" }}}

" status line ----------{{{
set laststatus=2                        "Always display the statusline (0=never, 1=only when multiple windows)
set updatetime=100                      "Update status line every 100ms, default is 800ms
set statusline=[%{mode()}]              "Mode
set statusline+=%f                      "Filename with project path
set statusline+=%m                      "Modified indicator
set statusline+=%r                      "Readonly indicator
set statusline+=%{FugitiveStatusline()} "Git branch
set statusline+=%=                      "Right align the rest
set statusline+=%{LastSearchCount()}    "Search details
set statusline+=%y                      "Filetype
set statusline+=%l/%L:%v                "Line/Length:Column
" }}}

" search ----------{{{
set incsearch                           " enable incremental search
set ignorecase                          " ignore case when searching
set smartcase                           " ignore case when searching
set shortmess-=S                        " show counts when searching
" search highlight removal
" nnoremap <leader><space> :nohlsearch<cr>
" search details for statusline, from :help searchcount()
function! LastSearchCount() abort
  let result = searchcount(#{recompute: 0})
  if empty(result)
    return ''
  endif
  if result.incomplete ==# 1     " timed out
    return printf(' /%s [?/??]X', @/)
  elseif result.incomplete ==# 2 " max count exceeded
    if result.total > result.maxcount &&  result.current > result.maxcount
      return printf(' /%s [>%d/>%d]Y', @/, result.current, result.total)
    elseif result.total > result.maxcount
      return printf(' /%s [%d/>%d]Z', @/, result.current, result.total)
    endif
  endif
  return printf('(/%s %d/%d)', @/, result.current, result.total)
endfunction
" }}}

" CtrlP plugin ----------{{{
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
" }}}

" vim-go plugin ----------{{{
" easy compiling
nnoremap <leader>gb :GoBuild<cr>
" highlight everything
let g:go_auto_type_info = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
" }}}

" Easymotion plugin ----------{{{ 
let g:EasyMotion_smartcase = 1
nmap <leader>f <plug>(easymotion-bd-f)
nmap <Leader>s <Plug>(easymotion-overwin-f2)
" }}}

" Vinegar plugin ----------{{{
" Vinegar uses `-` to invoke which I actually used
" so I map what `-` did to `\`. This actually works better
" because they are above and below each other on the keyboard
nnoremap \ :normal! -<cr>
" }}}

" Zettel ----------{{{
function! ZettelGen(type)
  call inputsave()
  let name = input('Enter title: ')
  call inputrestore()
  let command = 'zgen msg ' . '"' . name . '"'
  let file = system(command)
  " Only open file if no error
  if v:shell_error != 0
    echom ">>>ERROR:" . file . "<<<"
  else
    execute "e ".file
  endif
endfunction
" map call
nnoremap <leader>zn :call ZettelGen('msg')<CR>
" }}}

" vimrc ----------{{{
" Use the following command to see all commands mapped to ,
" This is useful when youo find clashes or delays etc.
" :map ,
" edit vimrc
nnoremap <leader>v :tabedit $MYVIMRC<cr>
" source vimrc
nnoremap <leader>u :so $MYVIMRC<CR>
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
