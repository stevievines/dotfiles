call pathogen#infect()
call pathogen#helptags()

runtime macros/matchit.vim " required for ruby block selection

set nocompatible               " be iMproved
 filetype off                   " required!

set number
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

" Handlebars Abbreviations
let g:mustache_abbreviations = 1

" Force Syntastic to Use RVM Managed Ruby Executable
let g:syntastic_ruby_mri_exec = '~/.rvm/rubies/ruby-2.1.6/bin/ruby'

" Ctrl P ignore
set wildignore+=*/tmp/*,*/dist/*,*/node_modules/*,*.so,*.swp,*.zip     " MacOSX/Linux

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" vim-test https://github.com/janko-m/vim-test
nmap <silent> <leader>t :TestNearest -strategy=neovim<CR>
nmap <silent> <leader>T :TestFile -strategy=neovim<CR>
nmap <silent> <leader>l :TestLast -strategy=neovim<CR>
nmap <silent> <leader>a :TestSuite<CR>

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

" goldenview has a default mapping for <C P> which I need for ctrlP
let g:goldenview__enable_default_mapping = 0

nmap <C-A> :AV<CR>
nmap <silent> <C-L>  <Plug>GoldenViewSplit

" save and check ruby syntax
command! Rubyw :w | :! ruby -cw %

filetype plugin indent on     " required!
filetype plugin on

autocmd! bufwritepost .vimrc source ~./vimrc

:imap jj <Esc>
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
