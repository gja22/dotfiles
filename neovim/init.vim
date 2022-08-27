"-----Neovim Configuration File-----
" Geoff Apps
"

" plugins ----------{{{
" This relies on vim-plugbeing installed
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
call plug#end()
" }}}

" basics ----------{{{
filetype plugin on
set encoding=utf8
set fileencoding=utf8
" }}}

" Leader ----------{{{
let mapleader = " "
" }}}

" Syntax highlighting and colorscheme ----------{{{
syntax enable
colorscheme gruvbox
set background=dark
" }}}

" Display options ----------{{{
set cursorline             " highlight the current line
set termguicolors          " allow 24-bit RGB colors in the TUI
set guicursor=             " keep block cursor in insert mode
" Not sure what this does, copied from some random place
highlight Normal guibg=none
set number                 " show line numbers
set colorcolumn=80         " visually indicate line width
set signcolumn=yes         " show sign column (errors etc.)
" easy toggling of numbering
nnoremap <leader>r :set relativenumber!<cr>
nnoremap <leader>n :set number!<cr>
set nowrap                 " don't wrap long lines by default
set linebreak              " split on whitespace, no broken words
set showmatch              " show matching brackets
set showmode               " show INSERT, VISUAL, etc. mode on command line
set showcmd                " show active command on command line
set scrolloff=3            " lines above/below when scrolling
set cmdheight=2            " More space for displaying messages
" }}}

" tabs and indenting  ----------{{{
set backspace=indent,eol,start   " make backspace behave like other editors
set smarttab                     " better backspace and tab functionality
set autoindent                   " auto indenting
set smartindent                  " smart indenting
set expandtab                    " spaces instead of tabs
set tabstop=2 softtabstop=2      " 2 spaces for tabs
set shiftwidth=2                 " 2 spaces for indentation
" }}}

" listchar options ----------{{{
set showbreak=↪
set lcs=tab:».,trail:•,nbsp:␣,eol:↲,extends:⟩,precedes:⟨
set nolist
" toggle listchars, mnemonic h is for hidden
nnoremap <leader>h :set list!<CR>
" }}}

" writing options ----------{{{ 
" wrap is better when prose, need to set it just for *.md files
" set wrap
" redraw long/short lines onto muliple lines 
nnoremap <leader>d gqip<CR>
" }}}

" warnings ----------{{{
set noerrorbells                         " turn off audio bell
set visualbell                           " leave on visual bell
" }}}

" backup settings ----------{{{
set noswapfile
set nobackup
set backupdir=~/.vim/backup
set directory=~/.vim/swp
set undodir=~/.vim/undo
set undofile
" }}}

" save and quit ----------{{{
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
set hidden                    " don't force buffer saves
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

" status line ----------{{{
set laststatus=2                        "Always display the statusline (0=never, 1=only when multiple windows)
set updatetime=50                       "Update status line every 100ms, default is 800ms
set statusline=[%{mode()}]              "Mode
set statusline+=%f                      "Filename with project path
set statusline+=%m                      "Modified indicator
set statusline+=%r                      "Readonly indicator
" set statusline+=%{FugitiveStatusline()} "Git branch
set statusline+=%=                      "Right align the rest
set statusline+=%y                      "Filetype
set statusline+=%l/%L:%v                "Line/Length:Column
" }}}

" search ----------{{{
set incsearch                           " enable incremental search
set ignorecase                          " ignore case when searching
set smartcase                           " ignore case when searching
set shortmess-=S                        " show counts when searching
" search highlight and removal
set nohlsearch
" set hlsearch! to toggle
nnoremap <leader><space> :nohlsearch<cr>
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

" Misc stuff I need to still group
set completeopt=menuone,noinsert,noselect

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ")})<cr>

