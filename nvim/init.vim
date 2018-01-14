"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                                           "
"                        VIM - RUNCOM                                                       "
"                                                                                           "
"   Sections:                                                                               "
"       -> Plug                                                                             "
"       -> General                                                                          "
"       -> User Interface                                                                   "
"       -> Aesthetics                                                                       "
"       -> Testing stuff                                                                       "
"       -> File specific options                                                            "
"       -> Files, backups and undo                                                          "
"       -> Text, tab and indent related                                                     "
"       -> Automatic watch for .vimrc changes                                               "
"       -> Functions                                                                        "
"       -> Not well known shortcuts                                                         "
"       -> Mappings and shortcuts                                                           "
"       -> Leader shortcuts                                                                 "
"       -> Plugin settings                                                                  "
"       -> Abbreviations                                                                    "
"                                                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Plug                                                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  call plug#begin('~/.vim/plugged')

    " Lean & mean status/tabline for vim that's light as air
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'

    " Precision colorscheme for the vim text editor
        Plug 'altercation/vim-colors-solarized'

    " A Git wrapper so awesome, it should be illegal
        Plug 'tpope/vim-fugitive'

    " A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
        Plug 'airblade/vim-gitgutter'

    " A tree explorer plugin for vim.
        Plug 'scrooloose/nerdtree'

    " Syntax checking hacks for vim
        Plug 'w0rp/ale'

    " Coding style between editors
        Plug 'editorconfig/editorconfig-vim'

    " True Sublime Text style multiple selections for Vim
        Plug 'terryma/vim-multiple-cursors'

    " Vim motions on speed!
        Plug 'easymotion/vim-easymotion'

    " Perform all your vim insert mode completions with Tab
        Plug 'ervandew/supertab'

    " Search local vimrc files (".lvimrc") in the tree (root dir up to current dir) and load them.
        Plug 'embear/vim-localvimrc'

    " Autoformat Plugins
        Plug 'Chiel92/vim-autoformat'

    " UltiSnips - The ultimate snippet solution for Vim
        Plug 'SirVer/ultisnips'
        "
    " A powerful grammar checker for Vim using LanguageTool
        Plug 'rhysd/vim-grammarous'

    " Fuzzy file, buffer, mru, tag, etc finder.
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'

    " Script for text filtering and alignment Vim script for text filtering and alignment
        Plug 'godlygeek/tabular'

    " Personal Wiki for Vim
        Plug 'vimwiki/vimwiki'

    " Proper project management with Taskwarrior in vim.
        Plug 'tbabej/taskwiki'

    " A calendar application for vim
        Plug 'itchyny/calendar.vim'


    " The ultimate undo history visualizer for VIM
        Plug 'mbbill/undotree'

    " Language specific plugins
    " Dark powered asynchronous completion framework for neovim
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Dark powered neo-completion

        " Vim plugin for insert mode completion of words in adjacent tmux panes
            Plug 'wellle/tmux-complete.vim'

        " deoplete.nvim source for Python
            Plug 'zchee/deoplete-jedi'

        " Typescript tooling for Neovim
            Plug 'mhartington/nvim-typescript', { 'do': 'npm install -g typescript', 'for': 'typescript' }
            let g:deoplete#enable_at_startup = 1

        " A collection of language packs for Vim
            Plug 'sheerun/vim-polyglot'

        " deoplete.nvim source for C/C++/Obj-C/Obj-C++ with clang-python3
            Plug 'daeyun/vim-matlab', { 'for': 'matlab' } " matlab support



    " Rarely used plugins
        " A Vim plugin for visually displaying indent levels in code
        "    Plug 'nathanaelkane/vim-indent-guides'


        " Vim plugin to list, select and switch between buffers.
        "    Plug 'jeetsukumaran/vim-buffergator'

        " Gundo.vim is Vim plugin to visualize your Vim undo tree.
        "    Plug 'sjl/gundo.vim'

        " Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
        "    Plug 'klen/python-mode'

        " Plug 'nelstrom/vim-markdown-folding' " markdown folding support


  " All of your Plugins must be added before the following line
  call plug#end()

  " Use 256 colours (Use this setting only if your terminal supports 256 colours)
  set t_Co=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           General                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Enable filetype plugins
    filetype plugin on
    filetype indent on

    set shell=/bin/zsh              " Set shell


  " Tab control
    set expandtab                   " Use spaces instead of tabs
    set tabstop=4                   " the visible width of tabs
    set softtabstop=4               " edit as if the tabs are 4 characters wide
    set shiftwidth=4                " 1 tab = 4 spaces
    set shiftround                  " round indent to a multiple of 'shiftwidth'

    set modelines=0
    set scrolloff=3
    set copyindent                  " Copy the previous indentation on autoindenting
    set showmode
    set showcmd
    set hidden                      " Hide buffers instead of closing them
    set noundofile

    set gdefault
    set colorcolumn=160

    set clipboard+=unnamedplus      " Systemwide clipboard

    set undolevels=1000             " use many muchos levels of undo
    set title                       " change the terminal's title

    set autochdir                   " automatically change window's cwd to file's dir

    set exrc                        " Looks for vimrc in current folder, for projcet specfic settings
    set secure                      " Disable critical vim commands in currentfolder, look exrc

    set nospell                     " Disable spell check

  " code folding settings
  " set foldmethod=syntax           " fold based on indent
    set foldnestmax=10              " deepest fold is 10 levels
    set nofoldenable                " don't fold by default
    set foldlevel=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Folding                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " function! MarkdownLevel()
  "   let h = matchstr(getline(v:lnum), '^#\+')
  "   if empty(h)
  "     return "="
  "   else
  "     return ">" . len(h)
  "   endif
  " endfunction

  " au BufEnter *.md setlocal foldexpr=MarkdownLevel()
  " au BufEnter *.md setlocal foldmethod=expr

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        User Interface                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " Searching
    set ignorecase                  " Ignore case when searching
    set smartcase                   " Ignore case if search pattern is all lowercase,
    set nolazyredraw                " don't redraw while executing macros

  " Live Preview
    set inccommand=split

  " Vim’s “very magic” search mode
    nnoremap / /\v
    vnoremap / /\v

  " Visualize tab and whitespaces
    set listchars=tab:>-,trail:·
    set list

  " Set 7 lines to the cursor - when moving vertically using j/k
    set so=7

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

    " Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with
    " line wrapping on, this can cause the cursor to actually skip a few lines on the screen because
    " it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down'
    " to mean the next line on the screen
    nmap j gj
    nmap k gk

    " Word wrap without line breaks
    set wrap
    set linebreak

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Aesthetics                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Enable syntax hightlighting
    syntax on

  " Colorscheme solarized
    set background=dark

  " Set utf8 as standard encoding and en_US as the standard language
    set encoding=utf-8

    set guifont=inconsolata:h12
    set number                      " Always show line numbers
    set relativenumber              " Show numbers relative to cursor

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Testing stuff                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Files, backups and undo                                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Turn backup off, since most stuff is in git etc. anyway...
    set nobackup
    set nowb
    set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                Text, tab and indent related                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set ai      " Auto indent
    set si      " Smart indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"           Automatic watch for .vimrc changes                                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
  augroup END

  augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
  augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Functions                                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


  " Switch between last file with CTRL-e
  nmap <C-e> :e#<CR>

  autocmd BufWritePre * :%s/\s\+$//e

  " When open a new file remember the cursor position of the last editing
  if has("autocmd")
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
  endif

  function! CleanUmlaute()
    execute '%s/Ä/\"A/'
    execute '%s/ä/\"a/'
    execute '%s/Ö/\"O/'
    execute '%s/ö/\"o/'
    execute '%s/Ü/\"U/'
    execute '%s/ü/\"u/'
  endfunction

  " Section AutoGroups {{{
  " file type specific settings
  augroup configgroup
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab
    " autocmd FileType html setlocal ts=2 sts=2 sw=2 noexpandtab indentkeys-=*<return> foldmethod=indent
    autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab indentkeys-=*<return>
    autocmd FileType javascript setlocal ts=2 sts=2 sw=2 noexpandtab indentkeys-=*<return>
    autocmd FileType json setlocal ts=2 sts=2 sw=2 noexpandtab indentkeys-=*<return>
    autocmd FileType jade setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd FileType markdown,textile setlocal textwidth=0 wrapmargin=0 wrap spell
    autocmd FileType .xml exe ":silent %!xmllint --format --recover - 2>/dev/null"
    autocmd FileType crontab setlocal nobackup nowritebackup
    autocmd FileType git nmap q :q<cr>
    autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab

    " automatically resize panes on resize
    autocmd VimResized * exe 'normal! \<c-w>='
    autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
    autocmd BufWritePost .vimrc.local source %
    " save all files on focus lost, ignoring warnings about untitled buffers
    autocmd FocusLost * silent! wa

    autocmd BufNewFile,BufRead *.ejs set filetype=html
    autocmd BufNewFile,BufRead *.ino set filetype=c
    autocmd BufNewFile,BufRead *.svg set filetype=xml
    autocmd BufNewFile,BufRead .babelrc set filetype=json
    autocmd BufNewFile,BufRead .jshintrc set filetype=json
    autocmd BufNewFile,BufRead .eslintrc set filetype=json
    autocmd BufNewFile,BufRead *.es6 set filetype=javascript

    " close help files on 'q'
    autocmd FileType help nnoremap q :bd<cr>

    " make quickfix windows take all the lower section of the screen
    " when there are multiple windows open
    autocmd FileType qf wincmd J

    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']

    " autocmd! BufEnter * call ApplyLocalSettings(expand('<afile>:p:h'))

    autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/

    " autocmd! BufWritePost * Neomake
  augroup END

  " }}}

  autocmd BufWritePost *.tex !cd ../ && make all > /dev/null & xdotool key Ctrl+j
  autocmd BufWritePost *.tex make all > /dev/null & xdotool key Ctrl+j

  " Toggle language for spell check
  let b:myLang=0
  let g:myLangList=["nospell","de_de","en_us"]
  function! ToggleSpell()
    let b:myLang=b:myLang+1
    if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
    if b:myLang==0
      setlocal nospell
    else
      execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
    endif
    echo "spell checking language:" g:myLangList[b:myLang]
  endfunction

  nmap <silent> <F7> :call ToggleSpell()<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Not well known shortcuts                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " ^ = ctrl
  " ^E - scroll down the window dawn
  " ^Y - scroll up the window dawn
  " ^F - scroll up one page
  " ^B - scroll up one page
  "  H - Move cursor to the top of the window
  "  M - Move cursor to the middle of the window
  "  L - Move cursor to the bottom of the window.
  "
  " ^A^A - Increase current number
  " ^x - Decrease current number
  "
  " :earlier 2m   - goes to 2 minutes in time back
  " :normal @w    - plays macro in current lines
  " :reg          - to look at all registers
  " "5p           - to print register 5

  " CTRL+R a      - Register in insert mode
  " CTRL+a        - Last inserted text
  " ctrl+x ctrl+] - Tag completion
  " ctrl+x ctrl+f - Filename completion
  " ctrl+x ctrl+p - Word completion
  " ctrl+x ctrl+l - Line completion
  " ctrl+o        - Jump back to last position

  " Fugitive
  " :Gstatus and than - to add/unadd current file

  " Folding
      " Operate on position of cursor
        " zo to open fold
        " zc to close fold
        " za to toggle between open and close
      " Operate on all folding levels
        " zC to close
        " zO to open
        " zA to toggle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Mappings and shortcuts                                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Arrows are unvimlike
    noremap <up>    <nop>
    noremap <down>  <nop>
    noremap <left>  <nop>
    noremap <right> <nop>

  " Miscellaneous
    set pastetoggle=<F12>

    " Allow saving of files as sudo when I forgot to start vim using sudo.
    cmap w!! w !sudo tee > /dev/null %

    " Easy exit with jk
    inoremap jk <esc>
    " xnoremap jk <esc>

    " Force to relearn esc
    " Need a better mapping
    "         :inoremap <esc> <nop>

  " Autoformat
    noremap <F3> :Autoformat<CR>

  " Better jump command(Buggy)
"        noremap <CTRL-[>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader shortcuts                                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Set map leader
    let mapleader = "\<Space>"

  " Keys for closing and saving
    noremap <leader>q :wq<CR>
    noremap <leader>w :wa<CR>
    noremap <leader>s :w<CR>

  " Move split windows easier
    noremap <leader>: <C-W><C-L>
    noremap <leader>L <C-W><C-K>
    noremap <leader>K <C-W><C-J>
    noremap <leader>J <C-W><C-H>

  " Tab mappings
    noremap <leader>tn :tabnew<cr>
    noremap <leader>to :tabonly<cr>
    noremap <leader>tc :tabclose<cr>
    noremap <leader>tm :tabmove

    noremap <leader>1 1gt
    noremap <leader>2 2gt
    noremap <leader>3 3gt
    noremap <leader>4 4gt
    noremap <leader>5 5gt
    noremap <leader>6 6gt
    noremap <leader>7 7gt
    noremap <leader>8 8gt
    noremap <leader>9 9gt


  " Edit faster vimrc
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>

  " Disable cursor highlighting
    nnoremap <leader><space> :noh<cr>

  " Nice functions
    " Double Quotes around current word
    :nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
    " Increase current number
    :nnoremap <leader>i s<C-r>=<C-r>"+1<Enter><esc>

  " Open link with vim
    map <Leader>gw :call system('firefox "' . expand('') . '"')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings                                                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Nerdtree settings
    nnoremap <F4> :NERDTreeToggle<CR>
    let NERDTreeShowBookmarks=1

  " Gundo settings
    nnoremap <F5> :GundoToggle<CR>

    let g:gundo_width = 60 " Set the horizontal width of the Gundo graph (and preview)
    let g:gundo_preview_height = 40 " Set the vertical height of the Gundo preview
    let g:gundo_right = 1 " Opens gundo at the right side
    let g:gundo_map_move_older = "k" " Set key to move down in gundo
    let g:gundo_map_move_newer = "l" " Set key to move up in gundo
    let g:gundo_close_on_revert = 1 " Close gundo when reverting

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
    let g:pymode_rope = 0

    " Documentation
    let g:pymode_doc = 1
    let g:pymode_doc_key = 'K'

    " Linting
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

  " Vim localvimrc
    let g:localvimrc_ask = 0

  " Fugitive
    noremap <leader>gs :Gstatus
    noremap <leader>gd :Gdiff
    noremap <leader>gc :Gcommit
    noremap <leader>gb :Gblame
    noremap <leader>gl :Glog
    noremap <leader>gp :Git push

  " Tabular
    noremap <leader>s, :Tabular /,<CR>
    noremap <leader>s; :Tabular /;<CR>

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

  "
    noremap <F8> :TagbarToggle<CR>


  " better key bindings for UltiSnipsExpandTrigger
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

  " Airline
    let g:airline_powerline_fonts = 1
    "let g:airline_theme='solarized'


   let g:grammarous#show_first_error = 1
   let g:grammarous#use_vim_spelllang = 1

   nmap <F9> <Plug>(grammarous-open-info-window)

   let g:ctrlp_map = '<c-p>'

  " Rust
    let g:rustfmt_autosave = 1

  " Fuzzy finder FZF
    nmap ; :Buffers<CR>
    nmap <Leader>t :Files<CR>
    nmap <Leader>r" --column: Show column number

  " Vimwiki
    let g:vimwiki_list = [{'path': '~/vimwiki/',
                         \ 'template_path': '~/vimwiki/templates/',
                         \ 'template_default': 'def_template',
                         \ 'template_ext': '.html'}]
    :nmap <Leader>wc <Plug>Vimwiki2HTML
    let g:vimwiki_folding='list'

  " Calendar
    let g:calendar_google_calendar = 1
    let g:calendar_google_task = 1


" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0) :Tags<CR>


let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Abbreviations                                                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  ab @@ friebetill@gmail.com
