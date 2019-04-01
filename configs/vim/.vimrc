set nocompatible
filetype off
set noshowmode
set laststatus=2
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'evidens/vim-twig'
Plugin 'StanAngeloff/php.vim'
Plugin 'pearofducks/ansible-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'junegunn/goyo.vim'

" Background
set background=dark

" End Vundle
call vundle#end()
filetype plugin indent on

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Mappings
nmap \q :NERDTreeToggle<CR>
nmap \w :TagbarToggle<CR>
nmap \p :set paste!<CR>
nmap \n :setlocal number!<CR>
nmap \h :nohl<cr>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

filetype plugin indent on
syntax on

" Colours
set term=screen-256color
color zellner
colorscheme zellner
" let g:lightline = { 'colorscheme': 'one' }
highlight VertSplit ctermbg=60 ctermfg=60
highlight StatusLine ctermbg=60 ctermfg=60
highlight StatusLineNC ctermbg=60 ctermfg=60

" Remove | characters in vertical bar split
:set fillchars+=vert:\ 

set number
set shiftwidth=2
set tabstop=2
set nowrap
set expandtab
set noswapfile
set hlsearch
set incsearch
set ignorecase

let NERDTreeShowHidden=1
let NERDTreeHighlightCursorline=1
let g:NERDTreeWinSize=35

" CtrlP
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 1
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_show_hidden = 1

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Place copied text into global clipboard
set clipboard=unnamedplus

" Remove delay on exiting modes
set timeoutlen=1000 ttimeoutlen=0

" Enable word wrap for markdown files
autocmd BufNewFile,BufRead *.md set wrap
