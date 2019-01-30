" enable mouse
set mouse=a

" enable escaping terminal mode
tnoremap <Esc> <C-\><C-n>

" enable spellchecking
:setlocal spell spelllang=en_us

filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

" relative line numbers
set number
set relativenumber

" enable system clipboard
set clipboard=unnamedplus
syntax enable


" theming
set background=dark
colorscheme solarized
let g:airline_theme='solarized'
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif
let g:airline_symbols.space="\ua0"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" enables tagbar hotkey
nmap <F8> :TagbarToggle<CR>
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let python_hightlight_all = 1

" Ale
let g:airline#extensions#ale#enabled = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
      \   'c' : ['cppcheck', 'clang-check'],
      \   'cpp' : ['cppcheck', 'clang-check'],
      \   'haskell' : [],
      \   'go' : [],
      \   'python': [],
      \   'rust': [],
      \}
let g:ale_fixers = {
      \   'c' : ['remove_trailing_lines'],
      \   'cpp' : ['remove_trailing_lines'],
      \   'haskell' : [],
      \   'go': [],
      \   'python': [],
      \   'rust': [],
      \}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'

" Use deoplete
let g:deoplete#enable_at_startup = 1

" associate lalrpop files with rust
au BufNewFile,BufRead *.lalrpop setlocal ft=rust
" Required for operations modifying multiple buffers like rename.
set hidden

set runtimepath+=~/.vim-plugins/LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \ 'c': ['cquery', '--language-server', '--log-file=/tmp/cq.log'],
    \ 'cpp': ['cquery', '--language-server', '--log-file=/tmp/cq.log'],
    \ 'haskell': ['hie', '--lsp'],
    \ 'go': ['gopls', 'server', '--logfile=/tmp/gopls.log'],
    \ 'rust': ['rls'],
    \ 'python': ['pyls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ }
let g:LanguageClient_loadSettings = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <F4> :call LanguageClient_textDocument_formatting()<CR>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>

" autocmd BufWritePre *.hs,*.rs,*.py,*.ts,*.js :call LanguageClient_textDocument_formatting()<CR>
