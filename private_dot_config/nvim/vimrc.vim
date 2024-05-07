"============general setting
syntax on
let g:python_highlight_space_errors = 0
let g:python_highlight_indent_errors = 0
let g:python_highlight_all = 1
set clipboard=unnamedplus
set guicursor=i:block
set ignorecase
set smartcase
set hlsearch
set backspace=indent,eol,start
" Common Style
set nu rnu
" autocmd TabEnter,WinEnter,FocusGained * :setlocal nu rnu
" autocmd TabLeave,WinLeave,FocusLost   * :setlocal nu nornu
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set splitbelow
set splitright
set nofoldenable
set foldmethod=indent
set foldignore=''
set wildmenu
set laststatus=3
map <Space> <Leader>
nnoremap <silent><Leader>G :tab G<CR>
nnoremap <silent><c-t> :$tabnew %<CR>
nnoremap <silent><c-o> <C-O>:noh<CR>
"============end of general setting

"============ColorTheme
set termguicolors
set t_ZH=[3m
set t_ZR=[23m
let &t_8f = "[38;2;%lu;%lu;%lum"
let &t_8b = "[48;2;%lu;%lu;%lum"
set background=dark
let g:gruvbox_material_background = "hard"
let g:gruvbox_material_better_performance = 1
"hi Normal guibg=NONE ctermbg=NONE
set fileencodings=utf-8,big5
set encoding=utf-8
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
set cursorline
set shortmess+=S
autocmd InsertEnter * :match none "highlight trailing white space
autocmd BufEnter,InsertLeave * :match curSearch /\s\+$/ "highlight trailing white space
autocmd BufEnter {} :match none
autocmd BufEnter {} :set nu

"============mouse setting
"set ttymouse=xterm2
set mouse=a

"===========cscope
"source ~/.cscope.vim
"cscope add ~/Desktop/ssl_lab/linux/cscope.out ~/Desktop/ssl_lab/linux

"==========arm assembly
au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7

"==========lvimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
let g:localvimrc_debug = 1
let g:localvimrc_sourced_once = 1
let g:localvimrc_sourced_once_for_file = 1
"let g:localvimrc_name = [".nvim.lua"]

"==========hard mode
"for key in ['<Up>', '<Down>', '<Left>', '<Right>', '<PageUp>', '<PageDown>', '<Home>', '<End>']
"    exec 'noremap' key '<Nop>'
"    exec 'inoremap' key '<Nop>'
"    exec 'vnoremap' key '<Nop>'
"endfor

"==========fugitive
nnoremap <silent><Leader>gb :Git blame<CR>
