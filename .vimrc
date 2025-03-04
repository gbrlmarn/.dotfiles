" Gabriel Marin .vimrc
"
" Download Plug first:
" $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Plugins
call plug#begin()
  Plug 'tpope/vim-sensible'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'arzg/vim-colors-xcode'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'mbbill/undotree'
call plug#end()

" Basic
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set ai
set number
set hlsearch
set ruler
set noswapfile
set autoindent
set smartindent
set relativenumber
set autowrite

" Color
colorscheme xcodedark 
hi Normal ctermbg=16 guibg=#000000
hi LineNr ctermbg=16 guibg=#000000
hi EndOfBuffer ctermbg=16 guibg=#000000

" Remaps
" Leader key
let mapleader = ","

" Reload config
nnoremap <leader>so :so ~/.vimrc<CR>

" Function keys
set pastetoggle=<F3>

" Fuzzy Finder
nnoremap <leader>ff :FZF<CR>
nnoremap <leader>fs :Rg<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fg :GitFiles<CR>
nnoremap <leader>fH :Helptags<CR>

" Runtime path
set rtp+=$HOME/.vim/plugged/fzf/bin/fzf

" Language Server Protocol(LSP)
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go,*.[ch],*.[ch]pp call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>
if has("persistent_undo")
    let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

" Tmux-sessionizer
nnoremap <leader><C-f> :!tmux neww tmux-sessionizer<CR>
