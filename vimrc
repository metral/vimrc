"let $VIMRUNTIME = "/usr/share/vim/vim74"
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME
execute pathogen#infect()
filetype off
filetype plugin indent on
set nocompatible
set modelines=0
syntax on
set t_Co=256
colorscheme molokai

set number
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround
set expandtab
set smartindent
set autoindent
set showmatch
syntax on

set ruler
set nocompatible
set fileformat=unix

"set guifont=Monospace\ 9
set guifont=Droid\ Sans\ Mono\ Slashed\ 9
set mouse=a

set showcmd
set wildmenu
set wildmode=list:longest
set ttyfast
set backspace=indent,eol,start
set showmode
set scrolloff=3
set laststatus=2

" These are annoying and I never use them anyway
set nobackup
set noswapfile

set wrap
set textwidth=79
set formatoptions=qrn1

set formatoptions+=l
" Not supported until version 7.3
"set colorcolumn=85
if version >= 703
    set colorcolumn=80
endif
" turn on whitespace


map <F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F2> :NERDTreeTabsToggle <cr>
map <F3> :TlistToggle<cr>
noremap <F5> :NeoCompleteEnable<cr>
noremap <F6> :NeoCompleteDisable<cr>
"let g:NERDTreeDirArrows = 1
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize = 35 
"autocmd BufWinEnter * NERDTreeMirror
"let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeIgnore = ['\.pyc$','\.o$']
" line indent
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

if has("gui_running")
    set guioptions-=T "no toolbar for gui
    "set lines=30
    "set columns=80
    set cursorline
    "colorscheme wombat
    if has("gui_gtk2")
    elseif has("gui_win32")
    else
        let do_syntax_sel_menu = 1|runtime! synmenu.vim
        set transparency=0
        set guifont=Consolas:h11
    endif
endif

filetype plugin on
filetype indent on

autocmd BufReadPost *.doc silent %!antiword "%"
autocmd BufReadPost *.odt,*.odp silent %!odt2txt "%"
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk -layout -q -eol unix "%" - | fmt -w78
autocmd BufReadPost *.rtf silent %!unrtf --text "%"


" Turn on autocomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" enable filetype detection:
set nocp
filetype on
au BufNewFile,BufRead *.ejs set filetype=html

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType yml,yaml set cindent expandtab shiftwidth=2 tabstop=2 softtabstop=2

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro

" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" for CSS, also have things in braces indented:
autocmd FileType css set smartindent

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" for both CSS and HTML, use genuine tab characters for indentation, to make
" files a few bytes smaller:
"autocmd FileType html,css set noexpandtab tabstop=2

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase
" show the `best match so far' as search strings are typed:
set incsearch
"set gdefault
set showmatch
set hlsearch


" folding settings
set foldmethod=indent   " fold based on indent
set foldnestmax=10      " deepest fold is 10 levels
set nofoldenable        " dont fold by default
set foldlevel=1         " set default fold level to 1


" Rebind autocomplete to ctrl-space
"inoremap <Nul> <C-x><C-o> 

" Super tab
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"let g:SuperTabDefaultCompletionType = "context"
"highlight Pmenu guibg=brown gui=bold
"highlight Pmenu ctermbg=238 gui=bold
" Add tags

"set tags+=$HOME/.vim/tags/python.ctags
"autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\" 
"autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 

au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.rb set expandtab softtabstop=2 tabstop=2 shiftwidth=2

"buffer explorer
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

" Omnicomplete
set ofu=syntaxcomplete#Complete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview


" Syntastic
"SyntasticDisable
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
"let g:syntastic_go_checkers = ['go']

"let g:syntastic_mode_map = {
"        \ "mode": "active",
"        \ "active_filetypes": [],
"        \ "passive_filetypes": ["go"] }

"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck', 'go']
let g:syntastic_go_checkers = ['go']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
        " No location/quickfix list shown, open syntastic error location panel
        Errors
    else
        lclose
    endif
endfunction
nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>

function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction

" Neocomplcache
"let g:neocomplcache_enable_at_startup = 1

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                "let file = fnamemodify(file, ':p:t')
                let file = fnamemodify(file, ':p:h:t').'/'.fnamemodify(file, ':t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

"filetype off
"set rtp+=~/.vim/bundle/vundle/
""call vundle#rc()
""Bundle 'Valloric/YouCompleteMe'
"filetype plugin indent on

let g:netrw_silent = 1
set viminfo+=h

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'fatih/vim-go'
Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'Valloric/YouCompleteMe'
Bundle 'roman/golden-ratio'
Bundle 'gcmt/taboo.vim'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'vim-airline/vim-airline'
Plugin 'Shougo/neocomplete'
"Plugin 'Shougo/echodoc.vim'
Plugin 'Scrooloose/nerdtree'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
call vundle#end()            " required
filetype plugin indent on    " required

"vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_y='win: %{WindowNumber()}'

"set statusline+=%{fugitive#statusline()}
set statusline+=\ %F%R%=%m[row:\ %l/%L,\ col:\ %v\ (%c),\ win:%{WindowNumber()}]
autocmd bufwritepost .vimrc source $MYVIMRC

"syntax-highlighting for Functions, Methods and Structs for golang vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_bin_path = "/mystore/mike/go/src/bin"
au FileType go nmap <leader>b <Plug>(go-build)

"let g:ycm_server_keep_logfiles

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 0
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#enable_auto_select = 0
"let g:echodoc_enable_at_startup = 1
"let g:neocomplete#max_list = 15
set cmdheight=2
set completeopt+=menuone
set completeopt-=preview
setlocal omnifunc=gocode#Complete
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
let g:neocomplete#sources#omni#input_patterns = {}
endif

" golang fix
let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "   "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
"   " <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"Space to select item:
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"


let g:jsx_ext_required = 0

" Don't resize automatically.
let g:golden_ratio_autocommand = 0
"nmap <C-w>- <Plug>(golden_ratio_resize)
" Fill screen with current window.
"nnoremap <C-w>+ <C-w><Bar><C-w>_
nnoremap <F7> :GoldenRatioToggle<CR>
hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse

" Taboo save tab names
set sessionoptions+=tabpages,globals
let g:taboo_tab_format =
    \ get(g:, "taboo_tab_format", " %N-%f ")
let g:taboo_renamed_tab_format =
    \ get(g:, "taboo_renamed_tab_format", " %N-[%l] ")

" automatically run the command (au is short for autocmd) :redraw! when I get the event FocusGained for any file matching the pattern *'.
au FocusGained * :redraw!

nnoremap <silent> <Esc><Esc> :noh<CR> :call clearmatches()<CR>

"autocmd BufWritePre *.go call go#lint#Run()
"autocmd BufWritePre *.go call go#errcheck#Run()

runtime vim-unbundle/plugin/unbundle.vim
