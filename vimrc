"-----Vim Configuration File-----
" Geoff Apps
"
set nocompatible                         "We want the latest Vim settings and options.
filetype plugin on
syntax enable
let mapleader=","
set encoding=utf8                        "Set utf8 as standard encoding
set fileencoding=utf8                    "Set utf8 as standard encoding

colorscheme tender

" display options
set cursorline                           " highlight the current line
set number                               " show line numbers
set norelativenumber                     " no relative line numbers
set wrap                                 " wrap long lines
set linebreak                            " split on whitespace, no broken words
set showmatch                            " show matching brackets
set noshowmode                           " show INSERT, VISUAL, etc. mode
set scrolloff=3                          " lines above/below

" tabs and indenting
set backspace=indent,eol,start           " make backspace behave like other editors
set smarttab                             " better backspace and tab functionality
set autoindent                           " auto indenting
set smartindent                          " smart indenting
set expandtab                            " spaces instead of tabs
set tabstop=2                            " 2 spaces for tabs
set shiftwidth=2                         " 2 spaces for indentation

" listchar options
" To support more contrast in the display I updated the
" tender colorscheme with these modifications.
" ctermfg=205 is hot pink
" NonText ctermfg=205
" SpecialKey ctermfg=205
set showbreak=↪
set lcs=tab:▸.,trail:•,nbsp:␣,eol:↲,extends:⟩,precedes:⟨
set nolist
" toggle listchars
nnoremap <leader>h :set list!<CR>

" code folding
" set foldmethod=syntax

" bells
set noerrorbells                         " turn off audio bell
set visualbell                           " leave on visual bell

" set backup directories
set backupdir=~/.vim/backup
set directory=~/.vim/swp
set undodir=~/.vim/undo

" easier save and quit
nnoremap <leader>w :w<cr>
" nnoremap <leader>q :q<cr>

" line movement
" normal mode
" nnoremap <C-j> :m .+1<CR>
" nnoremap <C-k> :m .-2<CR>
" insert mode
" inoremap <C-j> <ESC>:m .+1<CR>gi
" inoremap <C-k> <ESC>:m .-2<CR>gi
" visual mode
" vnoremap <C-j> :m '>+1<CR>gv=gv
" vnoremap <C-k> :m '<-2<CR>gv=gv

" buffers
" delete current buffer
nnoremap <leader>x :bd<CR>
" list buffers and allow selection
nnoremap <leader>l :ls<CR>:b<Space>
" Change local directory to location of current open file in window
" nnoremap <leader>cd :lcd %:h<CR>
" open files from working directory
" nnoremap <leader>e :edit<Space>
" nnoremap <leader>ee :edit<Space>
" open files located within the same dir in with the current file is edited
" nnoremap <leader>ew :edit <C-R>=expand("%:.:h") . "/"<CR>

" windows
set splitbelow
set splitright
" fast window creation
nnoremap <leader><Right> <C-w>v
nnoremap <leader><Down> <C-w>s
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

" tabs
"nnoremap tn :tabnew<Space>

" status line
hi statusline ctermfg=DarkYellow
set laststatus=2                   "Make sure statusline displays on startup
set statusline=[%{mode()}]        "Mode
set statusline+=%{FugitiveStatusline()}
set statusline+=%f                 "Filename with project path
set statusline+=%m                 "Modified indicator
set statusline+=%r                 "Readonly indicator
set statusline+=%=                 "Right align the rest
set statusline+=%y                 "Filetype
"set statusline+=[%P]               "Percentage through file
set statusline+=[%l/%L:%v]         "Line/Length:Column

" search
set hlsearch                            "Highlight search results
let @/ = ""                             "But not when sourcing .vimrc
set incsearch                           "Enable incremental search
set ignorecase                          "Ignore case when searching
" search highlight removal
nnoremap <silent> <leader>c :nohlsearch<cr>

" CtrlP plugin settings
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

" Easymotion plugin settings
nnoremap <leader>f <plug>(easymotion-bd-f)

" netrw builtin settings
"nmap <leader>n :Explore<cr>
" No banner by default - can be toggled using `I`
"let g:netrw_banner=0
" Tree list style by default - toggle options using `i`
"let g:netrw_liststyle=3
" Tree list size 30% when creates a split
"let g:netrw_winsize=30
"Open netrw in directory of the current file
"nmap <leader>dc :Lexplore %:p:h<cr>
"Open netrw in the current working directory
"nmap <leader>dd :Lexplore<cr>
"nnoremap <leader>r :Rexplore<CR>    "Return to explorer

" vimrc
" edit vimrc
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
" source vimrc
nnoremap <leader>sv :so $MYVIMRC<CR>

