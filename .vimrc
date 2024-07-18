" Basic Editor configuration 

packadd! dracula
packadd! onedark.vim

filetype plugin on
filetype detect
syntax on

" Light themes

"set background=light
"colorscheme cake16
"colorscheme warm_grey
"colorscheme codeburn

"let ayucolor="dark"
"colorscheme ayu

" Dark themes
set background=dark

" General dark themes.

"colorscheme solarized
"colorscheme gotham
"colorscheme duotone-darksea
"colorscheme duotone-darkforest
"colorscheme duotone-darkspace
"colorscheme tesla
"colorscheme underwater
"colorscheme nerv-ous
"colorscheme citylights " among my favorites
"colorscheme dracula
"colorscheme nord
"colorscheme onedark " slate-colored theme
"colorscheme tokyonight " A slightly more vibrant dark theme.
colorscheme dracula

" Green themes
"colorscheme duotone-darkmeadow
"colorscheme greenvision

" Blue themes
"colorscheme blueprint
"colorscheme Tomorrow-Night-Blue
"colorscheme colorsbox-stblue

set shell=/bin/zsh

set guioptions-=m
set guioptions-=T

"set virtualedit=all
set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set number
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set confirm
set visualbell
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set wrapmargin=0
set tw=80
set formatoptions=cqtl
set linebreak
set autowrite
set nowrap
set smartindent
set cindent
set nolist
set history=1000
set tags=./tags,tags
set autoread
set cryptmethod=blowfish
set cursorline

set formatoptions+=t " Autowrap to textwidth
set formatoptions+=j " Allow comments to be joined cleanly

set signcolumn=yes " Always draw sign column. Prevent buffer moving when adding/deleting sign.
set hidden " Required for operations modifying multiple buffers like rename.

" backup to ~/.tmp 
set backup 
set backupdir=~/.tmp
set backupskip=~/.tmp
set directory=~/.tmp
set writebackup

setglobal fileencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1

set errorformat=\ %#%f(%l\\\,%c):\ %m

set wildignore=*.dll,*.pdb,*.nupkg,*.exe,*.jpg,*.png,*.bin,tags,**/target/**,**/node_modules/**

set grepprg=rg\ --vimgrep\ --no-heading\ -g\ !tags
"set grepformat=%f:%l:%c:%m,%f:%l:%m

set path+=.,**

" Key mappings
let mapleader = ","

let g:netrw_liststyle=3 " tree listing

nmap <F11> :make!<CR>

nmap <leader>g :execute "grep -w '" . expand("<cword>") . "' ."<CR>
nmap <leader>f :execute "lgrep -w '" . expand("<cword>") . "' ."<CR>
nmap <leader>e :execute ":find **/" . expand("<cword>") . "." . expand("%:e")<cr>

nmap <leader><Space> :noh<CR>

function! UpdateCtags()
    :! ctags -R --exclude=target --exclude=build --exclude=node_modules .
    " ctags on my mac == universal ctags. I've installed it as unctags elsewhere.
endfunction

nmap <leader>t :call UpdateCtags()<cr>

" Java settings
" See: https://superuser.com/questions/627636/better-syntax-highlighting-for-java-in-vim

let java_highlight_functions = 1
let java_highlight_all = 1
" If you are trying this at runtime, you need to reload the syntax file
"set filetype=java

" Some more highlights, in addition to those suggested by cmcginty
highlight link javaScopeDecl Statement
highlight link javaType Type
highlight link javaDocTags PreProc

" Buffer settings

au BufRead,BufNewFile *.xaml         setlocal filetype=xml
au BufRead,BufNewFile *.aspx         setlocal filetype=xml
au BufRead,BufNewFile *.ascx         setlocal filetype=xml
au BufRead,BufNewFile *.json         setlocal filetype=javascript
au BufRead,BufNewFile *.puml         setlocal filetype=plantuml
au BufRead,BufNewFile *.sw         setlocal filetype=sw

au BufEnter *.md setlocal   foldexpr=pandoc#MarkdownLevel() | setlocal foldmethod=expr
au FileType qf setlocal wrap linebreak 

au filetype java setlocal makeprg=mvn\ -q\ compile\ -f\ pom.xml
au filetype java setlocal errorformat=[ERROR]\ %f:[%l\\,%v]\ %m

" Detect Drools files
au bufreadpost,filereadpost *.drl set ft=drools

" https://lornajane.net/posts/2018/vim-settings-for-working-with-yaml
" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=manual
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Plugin settings. 

"set guicursor+=a:blinkon0 " this option, strange as it may seem, has a reason: remote desktop suffers when cursors blink.

set completefunc=syntaxcomplete#Complete
set omnifunc=syntaxcomplete#Complete

let spiralweb_language = "clojure"
let spiralweb_backend = "markdown"

set popt=syntax:n,number:y,duplex:off,paper:letter

let g:ultisnips_java_brace_style='nl'
let g:ultisnips_java_junit='4'
let g:pandoc_no_folding = 1

command! -nargs=1 -complete=file Ptab :call ProjectTab(<f-args>) 

function! JCLMode()
    runtime! plugin/jcl.vim
endfunction

" FZF Setup
"
set rtp+=~/.fzf
nmap <leader>p :Files<CR>
nmap <leader>b :Buffers<CR>

" LSC Setup

let g:lsc_server_commands = {
\    'clojure': 'clojure-lsp',
\    'dhall': 'dhall-lsp-server',
\    'java': 'jdtls',
\ }

let g:lsc_auto_map=v:true

" Dhall
"
" comment the next line to disable automatic format on save
let g:dhall_format=1

" LSP Setup
let g:lsp_auto_enable = 1
let g:lsp_diagnostics_enabled = 0         " disable diagnostics support

if executable('clojure-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clojure-lsp',
        \ 'cmd': ['clojure-lsp'],
        \ 'allowlist': ['clojure'],
        \ })
endif

if executable('jdtls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'jdtls',
        \ 'cmd': ['jdtls'],
        \ 'allowlist': ['java'],
        \ })
endif

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': ['typescript-language-server', '--stdio'],
        \ 'allowlist': ['typescript', 'javascript'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes

    "nmap <buffer> gd <plug>(lsp-definition)
    "nmap <buffer> <f2> <plug>(lsp-rename)

    nmap <leader>d :LspDefinition<CR>
    nmap <leader>r :LspReferences<CR>
endfunction


augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
