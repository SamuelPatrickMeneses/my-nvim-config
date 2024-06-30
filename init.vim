call plug#begin()
" test
    Plug 'terroo/vim-simple-emoji'
" visual
    Plug 'sainnhe/sonokai' " um tema visual
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
"debug 
    Plug 'sakhnik/nvim-gdb'
" auto complite
    Plug 'jiangmiao/auto-pairs' " for (), [], {}, <>, ''...
    Plug 'dense-analysis/ale'
    "Plug 'ycm-core/YouCompleteMe' " for symbles

"" snippets
"    Plug 'SirVer/ultisnips'
"    Plug 'honza/vim-snippets'
"    Plug 'ervandew/supertab'

    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()


" glovbal setings
syntax on
set nu               " enumerad lines
let g:mapleader = '<C-M>'
filetype plugin on
set hlsearch 
"" tabulation config
set tabstop=4        " Show existing tab with 4 spaces width
set softtabstop=4    " Show existing tab with 4 spaces width
set shiftwidth=4     " When indenting with '>', use 4 spaces width
set expandtab        " On pressing tab, insert 4 spaces
set ai
"" encoding
set encoding=utf8

"" auto pair 
let g:AutoPairsFlyMode = 0

" autocomplite
"" ale with ccls

let g:ale_completion_enabled = 1
map <M-w> :ALEGoToDefinition  <cr>
map <M-r> :ALEFindReferences  <cr> 
map <M-z> :ALESymbolSearch 
map <M-h> :ALEHover<cr>
map <M-i> :ALEGoToImplementation <cr>

" ale lint warnes
let g:ale_echo_cursor = 1
let g:ale_virtualtext_cursor = 1
let g:ale_set_balloons = 1
let g:ale_linters_explicit = 1
"if expand('%:p') =~# '^/home/samuel/Documentos/php/LojaDecamisetasPHP'
" /data matches the path in Docker.
"
"
let g:ale_filename_mappings = {
\ 'phpcs': [
\   [getcwd(), '/var/www'],
\ ],
\ 'phpcbf': [
\   [getcwd(), '/var/www'],
\ ],
\ 'php': [
\   ['/home/samuel/Documentos/php/LojaDecamisetasPHP/', '/var/www/'],
\ ],
\}

"endif

let g:ale_linters = {
\    '*': ['clangd'],
\   'c': ['ccls'],
\   'cpp': ['ccls'],
\   'php': ['intelephense'],
\   'phtml':['tidy', 'intelephense'],
\   'vim': ['vimls'],
\   'make': ['checkmake'],
\   'cmake': ['cmakelint']
\}
let g:ale_fixers = {
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\   'javascript': ['clang-format'],
\   'php':  ['phpcbf']
\}
let g:ale_linter_aliases = {
\   'h': ['cpp'],
\   'hpp': ['cpp'],
\   'cc': ['cpp'],
\   'c++': ['cpp'],
\   'js': ['javascript'],
\}
let g:ale_fixer_aliases = {
\   'h': ['cpp'],
\   'hpp': ['cpp'],
\   'cc': ['cpp'],
\   'c++': ['cpp'],
\   'js': ['javascript'],
\}
let g:ale_echo_delay = 0
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_completion_delay = 0
"let g:ale_cpp_ccls_init_options = {
"            \   "cache": {
"            \       "directory": "/tmp/ccls/cache"
"            \   },
"            \   "clang": {
"            \       "extraArgs": [
"            \           "-std=c++17 -Wall -I /usr/include/openFrameworks -I /usr/include/c++/9 -I /usr/include/cairo"
"            \           ]
"            \   }
"            \}
let g:ale_cpp_cc_executable = 'clang++'
let g:ale_cpp_cc_options = '-std=c++17 -Wall -I /usr/include/openFrameworks -I /usr/include/c++/9 -I /usr/include/cairo'
let g:ale_cpp_clangd_options = '-std=c++17 -Wall -I /usr/include/openFrameworks -I /usr/include/c++/9 -I /usr/include/cairo'
let g:ale_c_cc_header_exts = ['h', 'hpp']
""" ale configuration for expecific lenguage

let g:ale_php_php_executable  = '/home/samuel/Documentos/php/LojaDecamisetasPHP/php'
let g:ale_php_phpcs_executable='phpcs'
let g:ale_php_phpcbf_executable = 'phpcbf'
let b:ale_php_phpcs_use_global = 1
let b:ale_php_phpcbf_use_global = 1
let g:ale_php_intelephense_config = {
\   'intelephense.environment.includePaths' :[
\       '/home/samuel/Documentos/php/LojaDecamisetasPHP/app',
\       '/home/samuel/Documentos/php/LojaDecamisetasPHP/lib',
\       '/home/samuel/Documentos/php/LojaDecamisetasPHP/util',
\   ],
\   'intelephense.environment.documentRoot':[
\       '/home/samuel/Documentos/php/LojaDecamisetasPHP/public'
\   ],
\   "intelephense.environment.shortOpenTag": 1,
\   
\}
"let  g:ale_c_clangd_executable= 'clangd-10'

" supertab congig
"let g:SuperTabDefaultCompletionType = '<C-n>'

"" util snipets config
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"



"" autocomplite (pugin: 'ycm-core/youCompleteMe')
"let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py' " set extra config file
"set completeopt-=preview " remove preview
"let g:ycm_language_server =
"  \ [{
"  \     'name': 'intelephense',
"  \     'cmdline': [ 'intelephense'],
"  \     'filetypes': [ 'php', 'phtml' ],
"  \     'project_root_files': [ '.git/', '.gitignore', 'composer.json']
"  \   }]
"
"let g:ycm_clangd_args = ["-I", "/usr/include/openFramework/" ]

"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:ycm_auto_trigger = 1
"map <M-w> :YcmCompleter GoToDefinition<cr>
""map <M-r> :YcmCompleter <cr>
"map <M-w> :YcmCompleter GoToDefinition<cr><cr>
""map <M-h> :YcmCompleter <cr>
"map <M-i> :YcmCompleter GoToImplementation<cr>
"
" visual
colorscheme sonokai
let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
let g:airline_right_sep='< '
let g:airline_detect_modified=1
let g:airline_left_sep=' >'
