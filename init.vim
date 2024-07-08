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
    "Plug 'dense-analysis/ale'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Plug 'ycm-core/YouCompleteMe' " for symbles

"" snippets
"    Plug 'SirVer/ultisnips'
"    Plug 'honza/vim-snippets'
"    Plug 'ervandew/supertab'

    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" coc config

let g:coc_global_extensions = ['coc-json', 'coc-git']

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

"let g:ale_completion_enabled = 1
"map <M-w> :ALEGoToDefinition  <cr>
"map <M-r> :ALEFindReferences  <cr> 
"map <M-z> :ALESymbolSearch 
"map <M-h> :ALEHover<cr>
"map <M-i> :ALEGoToImplementation <cr>

map <M-w>  <Plug>(coc-definition)
map <M-r>  <Plug>(coc-references-used)
map <M-d>  <Plug>(coc-declaration)
map <M-l>  :CocList symbols <CR>
imap <M-l>  :CocList symbols <CR>
map <M-z>  :CocList references <CR>
imap <M-z>  :CocList references<CR>
map <M-t>  <Plug>(coc-type-definition)
map <M-i>  <Plug>(coc-implementation)
inoremap <silent><expr> <C-y> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"
  "<Plug>(coc-declaration)
"" ale lint warnes
"let g:ale_echo_cursor = 1
"let g:ale_virtualtext_cursor = 1
"let g:ale_set_balloons = 1
"let g:ale_linters_explicit = 1
""if expand('%:p') =~# '^/home/samuel/Documentos/php/LojaDecamisetasPHP'
"" /data matches the path in Docker.
""
""
"let g:ale_filename_mappings = {
"\ 'phpcs': [
"\   [getcwd(), '/var/www'],
"\ ],
"\ 'phpcbf': [
"\   [getcwd(), '/var/www'],
"\ ],
"\ 'php': [
"\   ['/home/samuel/Documentos/php/LojaDecamisetasPHP/', '/var/www/'],
"\ ],
"\}
"
""endif
"
"let g:ale_linters = {
"\    '*': ['clangd'],
"\   'php': ['intelephense'],
"\   'phtml':['tidy', 'intelephense'],
"\   'vim': ['vimls'],
"\   'make': ['checkmake'],
"\   'cmake': ['cmakelint']
"\}
"let g:ale_fixers = {
"\   'javascript': ['clang-format'],
"\   'php':  ['phpcbf']
"\}
"let g:ale_linter_aliases = {
"\   'js': ['javascript']
"\}
"let g:ale_fixer_aliases = {
"\   'js': ['javascript']
"\}
"let g:ale_echo_delay = 0
"let g:ale_lint_on_text_changed = 1
"let g:ale_lint_on_insert_leave = 1
"let g:ale_lint_on_enter = 1
"let g:ale_lint_on_save = 1
"let g:ale_lint_on_filetype_changed = 1
"let g:ale_completion_delay = 0
"let g:ale_cpp_cc_options = '-std=c++17 -Wall -I /usr/include/openFrameworks -I /usr/include/c++/9 -I /usr/include/cairo'
"let g:ale_cpp_clangd_options = '-std=c++17 -Wall -I /usr/include/openFrameworks -I /usr/include/c++/9 -I /usr/include/cairo'
"let g:ale_c_cc_header_exts = ['h', 'hpp']
"""" ale configuration for expecific lenguage
"
"let g:ale_php_php_executable  = '/home/samuel/Documentos/php/LojaDecamisetasPHP/php'
"let g:ale_php_phpcs_executable='phpcs'
"let g:ale_php_phpcbf_executable = 'phpcbf'
"let b:ale_php_phpcs_use_global = 1
"let b:ale_php_phpcbf_use_global = 1
"let g:ale_php_intelephense_config = {
"\   'intelephense.environment.includePaths' :[
"\       '/home/samuel/Documentos/php/LojaDecamisetasPHP/app',
"\       '/home/samuel/Documentos/php/LojaDecamisetasPHP/lib',
"\       '/home/samuel/Documentos/php/LojaDecamisetasPHP/util',
"\   ],
"\   'intelephense.environment.documentRoot':[
"\       '/home/samuel/Documentos/php/LojaDecamisetasPHP/public'
"\   ],
"\   "intelephense.environment.shortOpenTag": 1,
"\   
"\}
" visual
colorscheme sonokai
let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
let g:airline_right_sep='< '
let g:airline_detect_modified=1
let g:airline_left_sep=' >'
