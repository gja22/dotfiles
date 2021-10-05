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
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>
inoremap <Left> <Nop>

"----------Buffers---------"
"Fast save
nnoremap <leader>w :w<cr>
"Fast quit
nnoremap <leader>q :q<cr>
"Easier escape key
inoremap jk <esc>
"Delete current buffer
nnoremap <leader>x :bd<CR>
"List buffers and allow selection
nnoremap <leader>b :ls<CR>:b<Space>
"Change local directory to location of current open file in window
"nnoremap <leader>cd :lcd %:h<CR>
" Open files from working directory
nnoremap <leader>ee :edit<Space>
" Open files located within the same dir in with the current file is edited
nnoremap <leader>ew :edit <C-R>=expand("%:.:h") . "/"<CR>
" Easy cycling between buffers
nnoremap <silent> [b :bprevious<CR><Space>
nnoremap <silent> ]b :bnext<CR><Space>
nnoremap <silent> [B :bfirst<CR><Space>
nnoremap <silent> ]B :blast<CR><Space>

"----------Windows---------"
"Use arrows in normal mode to move between windows.
"This makes me smile every time!
nnoremap <Down> <c-w>j
nnoremap <Up> <c-w>k
nnoremap <Left> <c-w>h
nnoremap <Right> <c-w>l

"----------Tabs---------"
nnoremap tn :tabnew<Space>
" Easy cycling between tabs
nnoremap <silent> [t :tabprev<CR><Space>
nnoremap <silent> ]t :tabnext<CR><Space>
nnoremap <silent> [T :tabfirst<CR><Space>
nnoremap <silent> ]T :tablast<CR><Space>

"-----------Color Scheme-------------"
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
let @/ = ""                             "But not when sourcing .vimrc
set incsearch                           "Enable incremental search
set ignorecase                          "Ignore case when searching
"Simple search highlight removal
nmap <leader><space> :nohlsearch<cr>

"----------netrw configuration----------"
" No banner by default - can be toggled using `I`
"let g:netrw_banner=0
" Tree list style by default - toggle options using `i`
"let g:netrw_liststyle=3
" Tree list size 30% when creates a split
"let g:netrw_winsize=30
"Open netrw
nmap <leader>n :Explore<cr>
"Open netrw in directory of the current file
"nmap <leader>dc :Lexplore %:p:h<cr>
"Open netrw in the current working directory
"nmap <leader>dd :Lexplore<cr>
"nnoremap <leader>r :Rexplore<CR>    "Return to explorer

"-----------Mappings-----------"
"Edit vimrc file
nmap <leader>ev :tabedit $MYVIMRC<cr>
"Source vimrc file
nnoremap <leader>sv :so $MYVIMRC<CR>
"-----------Auto-Commands-----------"

" Automatically source the Vimrc file on save
" use the augroup to prevent commands piling up
" if you do it too many times in one session
" saving can take forever!
"augroup autosourcing
"	autocmd!
"	autocmd BufWritePost vimrc source %
"augroup END
