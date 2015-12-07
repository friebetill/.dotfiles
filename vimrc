""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"   -> Vundle
"   -> General
"   -> User Interface
"   -> Aesthetics
"   -> Files, backups and undo
"   -> Text, tab and indent related
"   -> Automatic watch for .vimrc changes
"   -> Mappings and shortcuts
"   -> Leader shortcuts
"   -> Plugin settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Vundle                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

" let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'
 
 Plugin 'altercation/vim-colors-solarized'
 Plugin 'tpope/vim-fugitive'
 Plugin 'scrooloose/nerdtree'
 Plugin 'SirVer/ultisnips'
 Plugin 'easymotion/vim-easymotion'
 Plugin 'jlanzarotta/bufexplorer'

 " All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           General                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Enable filetype plugins
        filetype plugin on              
        filetype indent on

        set autoread                    " Set to auto read when a file is changed from the outside
        set shell=/bin/zsh              " Set shell

        set nocompatible
        set modelines=0
        set shiftround                  " Use multiple of shiftwidth when indenting with '<' and '>'
        set softtabstop=4
        set scrolloff=3
        set autoindent                  " Always set autoindenting on
        set copyindent                  " Copy the previous indentation on autoindenting
        set showmode
        set showcmd
        set hidden                      " Hide buffers instead of closing them
        set nowrap                      " Don't wrap lines
        set visualbell
        set ttyfast
        set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
        set laststatus=2
        set number                      " Always show line numbers
        set noundofile
        nnoremap / /\v
        vnoremap / /\v
        set ignorecase                  " Ignore case when searching
        set smartcase                   " Ignore case if search pattern is all lowercase,
                                "   Case-sensitive otherwise
        set gdefault
        set incsearch                   " Show search matches as you type
        set hlsearch                    " Highlight search terms
        nnoremap <tab> %
        vnoremap <tab> %
        set linebreak
        set nolist
        set formatoptions=qrn1
        set colorcolumn=80

        set history=1000                " remember more commands and search history
        set undolevels=1000             " use many muchos levels of undo
        set title                       " change the terminal's title

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        User Interface                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Set 7 lines to the cursor - when moving vertically using j/k
        set so=7

    " Turn on wildmenu
        set wildmenu

    " Ignore filetypes
        set wildignore=*.swp,*.bak,*.pyc,*.class,*.pdf,*.aux,*.log,*.toc,*.snm,*.nav,*.out

    " Always show current position
        set ruler

    " For regular expressions turn magic on
        set magic

    " Show matching brackets when text indicator is over them
        set showmatch                   

    " How many tenths of a second to blink when matching brackets
        set mat=2

    " No annoying sound on errors
        set visualbell                  " don't beep
        set noerrorbells                " don't beep
        set t_vb=
        set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Aesthetics                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Enable syntax hightlighting
        syntax on

        colorscheme solarized
        set background=dark

    " Set utf8 as standard encoding and en_US as the standard language
        set encoding=utf-8

        set guifont=Menlo:h14
        set relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Files, backups and undo                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Turn backup off, since most stuff is in git etc. anyway...
        set nobackup
        set nowb
        set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                Text, tab and indent related                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Use spaces instead of tabs
        set expandtab

    " Insert tabs on the start of a line according to Shiftwidth, not tabstop
        set smarttab

    " 1 tab == 4 spaces
        set shiftwidth=4
        set tabstop=4

    " Linebreak on 500 characters
        set lbr
        set tw=500

        set ai      " Auto indent
        set si      " Smart indent
        set wrap    " Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"           Automatic watch for .vimrc changes                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    augroup myvimrc
        au!
        au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
    augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Mappings and shortcuts                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Control shortcuts

        noremap ; l
        noremap l k
        noremap k j
        noremap j h

    " Arrows are unvimlike 

        nnoremap <up>    <nop>
        nnoremap <down>  <nop>
        nnoremap <left>  <nop>
        nnoremap <right> <nop>
        inoremap <up>    <nop>
        inoremap <down>  <nop>
        inoremap <left>  <nop>
        inoremap <right> <nop>

    " Miscellaneous 

        inoremap <F1> <ESC>
        nnoremap <F1> <ESC>
        vnoremap <F1> <ESC>
        au FocusLost * :wa
        vnoremap . :norm.<CR>
        set pastetoggle=<F2>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Set map leader and keys

        let mapleader = "\<Space>"
        map <leader>w :wa<CR>
        map <leader>s :w<CR>

    " Nerdtree 

        nnoremap <leader>n :NERDTree<CR>

    " Move split windows easier

        noremap <leader>: <C-W><C-L>
        noremap <leader>L <C-W><C-K>
        noremap <leader>K <C-W><C-J>
        noremap <leader>J <C-W><C-H>

    " tab mappings
        
        map <leader>tn :tabnew<cr>
        map <leader>to :tabonly<cr>
        map <leader>tc :tabclose<cr>
        map <leader>tm :tabmove

        map <leader>1 1gt
        map <leader>2 2gt
        map <leader>3 3gt
        map <leader>4 4gt
        map <leader>5 5gt
        map <leader>6 6gt
        map <leader>7 7gt
        map <leader>8 8gt
        map <leader>9 9gt

    " Disable cursor highlighting

        nnoremap <leader><space> :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Nerdtree settings

        let NERDTreeShowBookmarks=1
