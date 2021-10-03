"-----Vim Configuration File-----
" Geoff Apps
"
set nocompatible                         "We want the latest Vim settings and options.
filetype plugin on
syntax enable

set backspace=indent,eol,start           "Make backspace behave like other editors
let mapleader=" "                        "Default leader is '\' but space works better for me
set number                               "Enable line numbers
set relativenumber                       "Enable relative line numbers
set encoding=utf8                        "Set utf8 as standard encoding

" Display invisible characters
"set list lcs=tab:▸.,trail:•,nbsp:␣,eol:¬
"set list lcs=tab:▸.,space:\ ,trail:~,nbsp:␣,eol:¬

" wrap long lines
set wrap
" only split lines on whitespace, no broken words
set linebreak

"-------Set backup directories ----"
set backupdir=~/.vim/backup
set directory=~/.vim/swp
set undodir=~/.vim/undo

"----------Disable Arrows -----"         "Useful when getting the hang of using h j k l
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Right> <Nop>
noremap <Left> <Nop>

"----------Buffers---------"
" Easy cycling between buffers
nnoremap <silent> [b :bprevious<CR><Space>
nnoremap <silent> ]b :bnext<CR><Space>
nnoremap <silent> [B :bfirst<CR><Space>
nnoremap <silent> ]B :blast<CR><Space>

"----------Tabs---------"
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap <leader>r :Rexplore<CR>    "Return to explorer

"-----------Color Schemes-------------"
set background=dark
"set background=light
colorscheme solarized
set t_CO=256                        "Make sure terminal uses 256 colors.

"-----------Status-Line--------"
set laststatus=2                   "Make sure statusline displays on startup
"set statusline=[%{getcwd()}]       "Working directory
set statusline=[%t]                "Filename without path
set statusline+=%m                 "Modified indicator
set statusline+=%r                 "Readonly indicator
set statusline+=%=                 "Right align the rest
set statusline+=%y                 "Filetype
set statusline+=[%P]               "Percentage through file
set statusline+=[%l/%L:%v]         "Line/Length:Column
set statusline+=[%{mode()}]        "Mode

"-----------Searching----------"
set hlsearch                            "Highlight search results
set incsearch                           "Enable incremental search
set ignorecase                          "Ignore case when searching

"----------netrw configuration----------"
" No banner by default - can be toggled using `I`
let g:netrw_banner=0
" Tree list style by default - toggle options using `i`
let g:netrw_liststyle=3
" Tree list size 30% when creates a split
let g:netrw_winsize=30
"Open netrw in directory of the current file
nmap <leader>dc :Lexplore %:p:h<cr>
"Open netrw in the current working directory
nmap <leader>dd :Lexplore<cr>

"-----------Mappings-----------"
"Edit vimrc file
nmap <leader>ev :tabedit $MYVIMRC<cr>
"Source vimrc file
nnoremap <leader>sv :so $MYVIMRC<CR>
"Fast save
nmap <leader>w :w<cr>
"Fast quit
nmap <leader>q :q<cr>
"Convenient escape key mapping
inoremap jk <esc>
"Simple search highlight removal
nmap <leader><space> :nohlsearch<cr>

"-----------Auto-Commands-----------"

" Automatically source the Vimrc file on save
" use the augroup to prevent commands piling up
" if you do it too many times in one session
" saving can take forever!
"augroup autosourcing
"	autocmd!
"	autocmd BufWritePost vimrc source %
"augroup END
