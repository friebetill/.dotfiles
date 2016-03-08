""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"                        VIM - RUNCOM
"
"   Sections:
"       -> Vundle
"       -> General
"       -> User Interface
"       -> Aesthetics
"       -> Files, backups and undo
"       -> Text, tab and indent related
"       -> Automatic watch for .vimrc changes
"       -> Functions
"       -> Mappings and shortcuts
"       -> Leader shortcuts
"       -> Plugin settings
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
        Plugin 'jlanzarotta/bufexplorer'
        Plugin 'powerline/powerline'
        Plugin 'sjl/gundo.vim'
        Plugin 'klen/python-mode'
        Plugin 'easymotion/vim-easymotion'

    " All of your Plugins must be added before the following line
        call vundle#end()            " required
        filetype plugin indent on    " required

    " Activate Powerline
        python from powerline.vim import setup as powerline_setup
        python powerline_setup()
        python del powerline_setup

        set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

    " Always show statusline
        set laststatus=2

    " Use 256 colours (Use this setting only if your terminal supports 256 colours)
        set t_Co=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           General                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Enable filetype plugins
        filetype plugin on
        filetype indent on

        set autoread                    " Set to auto read when a file is changed from the outside
        set shell=/bin/zsh              " Set shell

        set modelines=0
        set shiftround                  " Use multiple of shiftwidth when indenting with '<' and '>'
        set softtabstop=4
        set scrolloff=3
        set autoindent                  " Always set autoindenting on
        set copyindent                  " Copy the previous indentation on autoindenting
        set showmode
        set showcmd
        set hidden                      " Hide buffers instead of closing them
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
        set nolist
        set formatoptions=qrn1
        set colorcolumn=120

        set history=1000                " remember more commands and search history
        set undolevels=1000             " use many muchos levels of undo
        set title                       " change the terminal's title

        set autochdir                   " automatically change window's cwd to file's dir

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

        set guifont=inconsolata:h12
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
      "  set lbr
      "  set tw=500

        set ai      " Auto indent
        set si      " Smart indent
        set nowrap  " No Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"           Automatic watch for .vimrc changes                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    augroup myvimrc
        au!
        au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
    augroup END

    augroup HiglightTODO
        autocmd!
        autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
    augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Functions                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufWritePre * :%s/\s\+$//e

" When open a new file remember the cursor position of the last editing
if has("autocmd")
        " When editing a file, always jump to the last cursor position
        autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Mappings and shortcuts                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
    " Set map leader

        let mapleader = "\<Space>"

    " Keys for closing and saving

        map <leader>q :wq<CR>
        map <leader>w :wa<CR>
        map <leader>s :w<CR>

    " Move split windows easier

        noremap <leader>: <C-W><C-L>
        noremap <leader>L <C-W><C-K>
        noremap <leader>K <C-W><C-J>
        noremap <leader>J <C-W><C-H>

    " Tab mappings

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

        "nnoremap <leader><space> :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Nerdtree settings

        nnoremap <F1> :NERDTreeToggle<CR>
        let NERDTreeShowBookmarks=1


    " Gundo settings

       nnoremap <F5> :GundoToggle<CR>

       let g:gundo_width = 60 " Set the horizontal width of the Gundo graph (and preview)
       let g:gundo_preview_height = 40 " Set the vertical height of the Gundo preview
       let g:gundo_right = 1 " Opens gundo at the right side
       let g:gundo_map_move_older = "k" " Set key to move down in gundo
       let g:gundo_map_move_newer = "l" " Set key to move up in gundo
       let g:gundo_close_on_revert = 1 " Close gundo when reverting

    " Ultisnippets Settings
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<C-l>"
        let g:UltiSnipsJumpBackwardTrigger="<C-k>"

    " Python-mode Settings
        " Activate rope
        " Keys:
        " K             Show python docs
        " <Ctrl-Space>  Rope autocomplete
        " <Ctrl-c>g     Rope goto definition
        " <Ctrl-c>d     Rope show documentation
        " <Ctrl-c>f     Rope find occurrences
        " <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
        " [[            Jump on previous class or function (normal, visual, operator modes)
        " ]]            Jump on next class or function (normal, visual, operator modes)
        " [M            Jump on previous class or method (normal, visual, operator modes)
        " ]M            Jump on next class or method (normal, visual, operator modes)
        let g:pymode_rope = 1

        " Documentation
        let g:pymode_doc = 1
        let g:pymode_doc_key = 'K'

        "Linting
        let g:pymode_lint = 1
        let g:pymode_lint_checker = "pyflakes,pep8"
        " Auto check on save
        let g:pymode_lint_write = 1

        " Support virtualenv
        let g:pymode_virtualenv = 1

        " Enable breakpoints plugin
        let g:pymode_breakpoint = 1
        let g:pymode_breakpoint_bind = '<leader>b'

        " syntax highlighting
        let g:pymode_syntax = 1
        let g:pymode_syntax_all = 1
        let g:pymode_syntax_indent_errors = g:pymode_syntax_all
        let g:pymode_syntax_space_errors = g:pymode_syntax_all

        " Don't autofold code
        let g:pymode_folding = 0

    " Fugitive
        map <leader>gs :Gstatus
        map <leader>gd :Gdiff
        map <leader>gc :Gcommit
        map <leader>gb :Gblame
        map <leader>gl :Glog
        map <leader>gp :Git push

    " Bufexplorer
        " To start exploring in the current window, use: >
        "  <Leader>be   or   :BufExplorer   or   Your custom key mapping
        " To toggle bufexplorer on or off in the current window, use: >
        "  <Leader>bt   or   :ToggleBufExplorer   or   Your custom key mapping
        " To start exploring in a newly split horizontal window, use: >
        "  <Leader>bs   or   :BufExplorerHorizontalSplit   or   Your custom key mapping
        " To start exploring in a newly split vertical window, use: >
        "  <Leader>bv   or   :BufExplorerVerticalSplit   or   Your custom key mapping


    " Easymotion
        " Type <Leader><Leader>w to trigger the word motion |w|.
        " Type <Leader><Leader>fo, and all "o" characters are highlighted.
