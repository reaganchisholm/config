""""""
" UI "
""""""

" set indent spacing
set tabstop=4
set shiftwidth=4

" insert spaces instead of tab
set expandtab

" turn relative line numbers on
:set number relativenumber
:set nu rnu

" When auto-indenting, use the indenting format of the previous line
set copyindent

" When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.
" 'tabstop' is used in other places. A <BS> will delete a 'shiftwidth' worth of
" space at the start of the line.
set smarttab

" Copy indent from current line when starting a new line (typing <CR> in Insert
" mode or when using the "o" or "O" command)
set autoindent

" Automatically inserts one extra level of indentation in some cases, and works
" for C-like files
set smartindent

" disable vi compatibility
set nocompatible

" automatically load changed files
set autoread

" auto-reload vimrc
autocmd! bufwritepost vimrc source ~/.vim/vimrc

" show the filename in the window titlebar
set title

" set encoding
set encoding=utf-8

" display incomplete commands at the bottom
set showcmd

" wrapping stuff
set textwidth=80

" ignore whitespace in diff mode
set diffopt+=iwhite

" Be able to arrow key and backspace across newlines
set whichwrap=bs<>[]

" Status bar
set laststatus=2

" change cursor in edit mode
if exists('$TMUX')
    " tmux will only forward escape sequences to the terminal if surrounded by a
    " DCS sequence
    let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
    let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[0 q\<Esc>\\"
    autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[0 q\033\\"
else
    let &t_SI .= "\<Esc>[6 q"
    let &t_EI .= "\<Esc>[0 q"
    autocmd VimLeave * silent !echo -ne "\033[0 q"
endif

" remember last cursor position
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ 	exe "normal g`\"" |
	\ endif

" enable completion
set ofu=syntaxcomplete#Complete

" let vim open up to 100 tabs at once
set tabpagemax=100

" case-insensitive filename completion
set wildignorecase

"""""""""""""
" Searching "
"""""""""""""

set hlsearch "when there is a previous search pattern, highlight all its matches
set incsearch "while typing a search command, show immediately where the so far typed pattern matches
set ignorecase "ignore case in search patterns
set smartcase "override the 'ignorecase' option if the search pattern contains uppercase characters
set gdefault "imply global for new searches

""""""""
" Misc "
""""""""

set history=1000 " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set nobackup " do not keep backup files, it's 70's style cluttering
set noswapfile " do not write annoying intermediate swap files,
set cmdheight=1 " use a status bar that is 1 rows high

"""""""""""""""""""""
" Language-Specific "
"""""""""""""""""""""

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Add json syntax highlighting
au BufNewFile,BufRead *.json set ft=json syntax=javascript

"""""""""""
" Plugins "
"""""""""""

call plug#begin('~/.vim/plugged')
	Plug 'liuchengxu/space-vim-dark'
	Plug 'sheerun/vim-polyglot'
	Plug 'preservim/nerdtree'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
call plug#end()

""""""""""""
" Bindings "
""""""""""""

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"

endif

" Move lines with Shift+Up / Shift+Down
nnoremap <S-Up> :m-2<CR>==
nnoremap <S-Down> :m+<CR>==
inoremap <S-Up> <Esc>:m-2<CR>==gi
inoremap <S-Down> <Esc>:m+<CR>==gi
vnoremap <S-Up> :m '<-2<CR>gv=gv
vnoremap <S-Down> :m '>+1<CR>gv=gv

nmap <C-B> :NERDTreeToggle<CR>

"""""""""
" Theme "
"""""""""

syntax enable
set background=dark 
colorscheme space-vim-dark
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi Comment guifg=#5C6370 ctermfg=59

