" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

runtime macros/matchit.vim " required for ruby block selection

set nocompatible               " be iMproved
 filetype off                   " required!

 "vim-plug plugin management. :PlugInstall to install new ones
call plug#begin(stdpath('data'))
Plug 'janko/vim-test', { 'for': ['ruby','go'] }
Plug 'https://github.com/tpope/vim-endwise.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-repeat.git'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
"Plug 'https://github.com/vim-syntastic/syntastic.git'

" async linting
Plug 'dense-analysis/ale'

" fzf
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" git
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/tpope/vim-fugitive.git'

" colorscheme
Plug 'https://github.com/altercation/vim-colors-solarized.git'

" terraform
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

" go stuff
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Use release branch (Recommend) for language server
" followed this tutorial BTW: https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}

" ruby and rails stuff
Plug 'https://github.com/vim-ruby/vim-ruby.git'
Plug 'https://github.com/tpope/vim-rails.git'
call plug#end()

" FZF
nnoremap <C-p> :FZF<cr>

"Line number goodies
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set ruler
set nowrap
"set cursorline
set autoindent
syntax enable

" Whitespace Stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
set expandtab
set list listchars=tab:\ \ ,trail:·

" highlight 80 column
set colorcolumn=80

" search
set hlsearch

" Tab Completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-P>"
  endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

" Run golint and errckeck on save
"let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
"let g:syntastic_aggregate_errors = 1

" always show gutter
let g:ale_sign_column_always = 1

let g:go_fmt_command = "goimports"

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
"au FileType go nmap <leader>gd <Plug>(go-def-vertical)

" Ctrl P ignore
set wildignore+=*/tmp/*,*/dist/*,*/node_modules/*,*.so,*.swp,*.zip     " MacOSX/Linux

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" vim-test https://github.com/janko-m/vim-test
autocmd FileType ruby nmap <silent> <leader>t :TestNearest -strategy=neovim<CR>
autocmd FileType ruby nmap <silent> <leader>T :TestFile -strategy=neovim<CR>
autocmd FileType ruby nmap <silent> <leader>l :TestLast -strategy=neovim<CR>
autocmd FileType ruby nmap <silent> <leader>a :TestSuite<CR>

autocmd FileType go nmap <leader>t <Plug>(go-test)

"disable arrow keys in insert mode
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>
"disable arrow keys in normal mode
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" Ctrl-j/k deletes line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/.*/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/.*/d<CR>``:noh<CR>
nnoremap <silent><Tab>j :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><Tab>k :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Vim rails: ctrl A to open associated file in vertical split, ctrl s for
" horizontal
autocmd FileType ruby nmap <C-A> :AV<CR>
autocmd FileType ruby nmap <C-S> :AS<CR>

" vim-go-tutorial said to turn this on
set autowrite
" open alternate go files in vertical split by default
let g:go_alternate_mode = "vsplit"
autocmd FileType go nmap <C-A> :GoAlternate<CR>

"this was supposed to enable quick jumping but some other plugin must have
"mapped it
"map <C-n> :cnext<CR>
"map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" toggle go coverage with leader gc
autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" save and check ruby syntax
command! Rubyw :w | :! ruby -cw %

filetype plugin indent on     " required!
filetype plugin on

autocmd! bufwritepost .vimrc source ~./vimrc

" terraform
autocmd BufWritePre *.tf TerraformFmt
autocmd BufWritePre *.tfvars TerraformFmt

imap jj <Esc>
imap jk <Esc>
" Solarized stuff
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

function! s:RubyHashSyntaxToggle() range
  if join(getline(a:firstline, a:lastline)) =~# '=>'
    silent! execute a:firstline . ',' . a:lastline . 's/[^{,]*[{,]\?\zs:\([^: ]\+\)\s*=>/\1:/g'
  else
    silent! execute a:firstline . ',' . a:lastline . 's/[^{,]*[{,]\?\zs\([^: ]\+\):/:\1 =>/g'
  endif
endfunction
command! -bar -range RubyHashSyntaxToggle <line1>,<line2>call s:RubyHashSyntaxToggle()
noremap <Leader>rh :RubyHashSyntaxToggle<CR>

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

