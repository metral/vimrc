"let $VIMRUNTIME = "/usr/share/vim/vim82"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME
execute pathogen#infect()
filetype off
filetype plugin indent on
set nocompatible
set modelines=0
syntax on
set t_Co=256

set number
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround
set expandtab
set smartindent
set autoindent
set showmatch
set splitbelow
set splitright
syntax on

colorscheme molokai

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
map <F2> :NERDTreeTabsToggle<cr>
"map <F4> :NeoCompleteToggle<cr>
map <F3> :Tagbar <cr>
map <F4> :call ToggleIndent()<cr>

map <F7> :GoldenRatioToggle<CR>
map <F8> :ToggleWorkspace<cr>

" NERDTree settings
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize = 35 
let g:NERDTreeGlyphReadOnly = "RO"
let g:NERDTreeNodeDelimiter = "\u00a0"

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
"autocmd FileType python set omnifunc=pythoncomplete#Complete

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" enable filetype detection:
set nocp
filetype on
au BufNewFile,BufRead *.ejs set filetype=html

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent expandtab shiftwidth=4 tabstop=4 softtabstop=4

" for yaml & ansible
"autocmd FileType yaml set cindent expandtab shiftwidth=2 tabstop=2 softtabstop=2 ft=ansible

au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible

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
"set ofu=syntaxcomplete#Complete
"set completefunc=syntaxcomplete#Complete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"set completeopt=menuone,menu

" Syntastic
"SyntasticDisable
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list=1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1

let g:syntastic_go_checkers = ['golangci-lint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

"let g:syntastic_python_flake8_exec = 'python3'
"let g:syntastic_python_flake8_args = ['-m', 'flake8']

"let g:syntastic_go_checkers = ['go']
"let g:syntastic_mode_map = {
"        \ "mode": "active",
"        \ "active_filetypes": [],
"        \ "passive_filetypes": ["go"] }
"
"let g:syntastic_mode_map = {
"        \ "mode": "active",
"        \ "active_filetypes": [],
"        \ "passive_filetypes": ["go"] }

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

let g:ale_completion_enabled = 1
let g:ale_sign_error = '!'
let g:ale_sign_warning = '!'
let g:ale_completion_enabled = 1
let g:ale_set_highlights = 0
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_sign_column_always = 1
let g:ale_go_bingo_executable = 'gopls'
let g:go_auto_type_info = 1
let g:ale_fix_on_save = 1
"let g:ale_go_golangci_lint_options = "--max-issues-per-linter 0"
"let g:ale_go_golangci_lint_options = "-c $HOME/aapl/sdk/.golangci.yaml"
let g:ale_go_golangci_lint_package = 1
let g:ale_javascript_prettier_options = '--trailing-comma all --tab-width 4 --print-width 120'
let g:ale_python_black_options='--line-length 120'
let g:ale_python_flake8_options='--max-line-length 120'
let g:ale_python_pylint_options='--max-line-length 120'
let g:syntastic_python_flake8_post_args='--ignore=E501,E128,E225'
let g:syntastic_python_pylint_post_args='--ignore=E501,E128,E225'

autocmd FileType typescript set omnifunc=ale#completion#OmniFunc shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType go set omnifunc=ale#completion#OmniFunc

"autocmd FileType python set omnifunc=ale#completion#OmniFunc shiftwidth=4 tabstop=4 softtabstop=4
let g:ale_linters = {
\   'go': ['golangci-lint', 'gopls', 'govet'],
\   'typescript': ['eslint', 'tsserver'],
\   'python': ['mypy', 'flake8', 'pyls', 'pylint'],
\}

let g:ale_fixers = {
\   'python': ['black'],
\   'typescript': ['eslint', 'prettier'],
\}

"\   'python': ['mypy', 'pylint', 'flake8'],
"\   'python': ['flake8', 'pylint'],
highlight Pmenu ctermbg=white ctermfg=black
highlight PmenuSel ctermbg=green ctermfg=black

let g:netrw_silent = 1
set viminfo+=h

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'fatih/vim-go'
Plugin 'ekalinin/Dockerfile.vim'
Bundle 'roman/golden-ratio'
Bundle 'gcmt/taboo.vim'
Bundle "lepture/vim-jinja"
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'vim-airline/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'thaerkh/vim-workspace'
Plugin 'Shougo/neocomplete'
Plugin 'Scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'pearofducks/ansible-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'dense-analysis/ale'
Plugin 'relastle/vim-nayvy'
Plugin 'davidhalter/jedi-vim'
call vundle#end()            " required
filetype plugin indent on    " required

let g:jedi#use_tabs_not_buffers = 1
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1
"let g:tsuquyomi_use_vimproc=1

"vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_section_y='win: %{WindowNumber()}'

"set statusline+=%{fugitive#statusline()}
set statusline+=\ %F%R%=%m[row:\ %l/%L,\ col:\ %v\ (%c),\ win:%{WindowNumber()}]
autocmd bufwritepost .vimrc source $MYVIMRC

"syntax-highlighting for Functions, Methods and Structs for golang vim-go
let g:go_highlight_functions = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_interfaces = 1
let g:go_auto_sameids = 1
let g:go_addtags_transform = "camelcase"
let g:go_fmt_command = "gopls"
let g:go_gopls_gofumpt=1
let g:go_build_tags="linux darwin"
let g:go_bin_path = "/Users/metral/go/bin"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

"let g:ycm_server_keep_logfiles

"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' : 
"           \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"           \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

"let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript setlocal completeopt+=menu,preview
set pumheight=10

"let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 0
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#enable_auto_select = 0
let g:echodoc_enable_at_startup = 1
let g:neocomplete#max_list = 15

"if !exists('g:neocomplete#sources')
"    let g:neocomplete#sources = {}
"endif
"let g:neocomplete#sources._ = ['buffer', 'member', 'tag', 'file', 'dictionary']
"let g:neocomplete#sources.go = ['omni']

set cmdheight=3
"setlocal omnifunc=go#code#Complete
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

"let g:neocomplcache_omni_functions.go = 'gocomplete#Complete'

" golang fix
let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"    " For no inserting <CR> key.
"    "   "return pumvisible() ? "\<C-y>" : "\<CR>"
"endfunction
""   " <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
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

"By default the mapping gd is enabled, which opens the target identifier in current buffer. You can also open the definition/declaration, in a new vertical, horizontal, or tab, for the word under your cursor:
au FileType go nmap <C-t>gd :ALEGoToDefinition<CR>
au FileType go nmap <C-t>gs :ALEGoToDefinition -split<CR>
au FileType go nmap <C-t>gv :ALEGoToDefinition -vsplit<CR>
au FileType go nmap <C-t>gt :ALEGoToDefinition -tab<CR>
au FileType go nmap <F6> :ALEHover<CR>
au FileType go nmap <C-t>gh :ALEDocumentation<CR>
au FileType go nmap <C-t>le :lopen<CR>
au FileType go nmap <C-t>ne :ALENext<CR>
au FileType go nmap <C-t>pe :ALEPrevious<CR>

au FileType python nmap <C-t>gd :ALEGoToDefinition<CR>
au FileType python nmap <C-t>gs :ALEGoToDefinition -split<CR>
au FileType python nmap <C-t>gv :ALEGoToDefinition -vsplit<CR>
au FileType python nmap <C-t>gt :ALEGoToDefinition -tab<CR>
au FileType python nmap <F6> :ALEHover<CR>
au FileType python nmap <C-t>gh :ALEDocumentation<CR>
au FileType python nmap <C-t>le :lopen<CR>
au FileType python nmap <C-t>ne :ALENext<CR>
au FileType python nmap <C-t>pe :ALEPrevious<CR>

au FileType typescript nmap <C-t>gd :ALEGoToDefinition<CR>
au FileType typescript nmap <C-t>gs :ALEGoToDefinition -split<CR>
au FileType typescript nmap <C-t>gv :ALEGoToDefinition -vsplit<CR>
au FileType typescript nmap <C-t>gt :ALEGoToDefinition -tab<CR>
au FileType typescript nmap <F6> :ALEHover<CR>
au FileType typescript nmap <C-t>gh :ALEDocumentation<CR>
au FileType typescript nmap <C-t>le :lopen<CR>
au FileType typescript nmap <C-t>ne :ALENext<CR>
au FileType typescript nmap <C-t>pe :ALEPrevious<CR>

"settings for https://github.com/thaerkh/vim-workspace
let g:workspace_autosave_untrailspaces = 0
let g:workspace_autosave_ignore = ['gitcommit']

" toggle indent using vim conceal
let g:toggleindent = 0
function! ToggleIndent()
    if g:toggleindent
        call ToggleIndentOff()
    else
        call ToggleIndentOn()
    endif
endfunction

function! ToggleIndentOn()
    set listchars=tab:\┆\ 
    set list
    let g:toggleindent = 1
endfunction

function! ToggleIndentOff()
    set listchars=eol:$
    set nolist
    let g:toggleindent = 0
endfunction
call ToggleIndentOff()

" add live column + line cross-hair cursor tracking
set cursorcolumn
set cursorline
