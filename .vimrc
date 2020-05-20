" to deploy dotfiles check out
" https://www.atlassian.com/git/tutorials/dotfiles

"-----Settings----------------------------------------------
set tabstop=2
set autoindent
set softtabstop=2
set shiftwidth=2
set relativenumber
set showcmd
set cursorline
set wildmenu
set incsearch
set ruler
set hlsearch
set ai
filetype plugin on
let g:tex_flavor='latex'

"-----Remappings----------------------------------------------
nnoremap B ^
inoremap jk <esc>
let mapleader=","

"!!Dont use arrows!!
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <C-o>:echo "No left for you!"<CR>
nnoremap <Right> :echo "No Rigth for you!"<CR>
vnoremap <Right> :<C-u>echo "No Right for you!"<CR>
inoremap <Right> <C-o>:echo "No Rigth for you!"<CR>
nnoremap <Up> :echo "No Up for you!"<CR>
vnoremap <Up> :<C-u>echo "No Up for you!"<CR>
inoremap <Up> <C-o>:echo "No Up for you!"<CR>
nnoremap <Down> :echo "No Down for you!"<CR>
vnoremap <Down> :<C-u>echo "No Down for you!"<CR>
inoremap <Down> <C-o>:echo "No Down for you!<CR>

"-----Plug Ins ----------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/goyo.vim'
Plugin 'lervag/vimtex'
Plugin 'sirver/ultisnips'
"need to look into snippits
call vundle#end()
filetype plugin indent on

"-----Goyo----------------------------------------------
nnoremap <C-g> :Goyo<CR>
vnoremap <C-g> :Goyo<CR>
inoremap <C-g> :Goyo<CR>

function! s:goyo_enter()
	  let b:quitting = 0
		let b:quitting_bang = 0
		autocmd QuitPre <buffer> let b:quitting = 1
		cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
		set tabstop=2
		set autoindent
		set softtabstop=2
		set shiftwidth=2
		set relativenumber
		set showcmd
		set cursorline
		set wildmenu
		set incsearch
		set ruler
		set hlsearch
endfunction

function! s:goyo_leave()
	  " Quit Vim if this is the only remaining buffer
	if b:quitting && len(filter(range(1, bufnr('$')),'buflisted(v:val)')) == 1
		if b:quitting_bang
			qa!
		else
			qa
		endif
	endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

"-----latex----------------------------------------------
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:Tex_DefaultTargetFormat='pdf'
let g:tex_conceal='abdmg'
let g:Tex_CompileRule_pdf = 'latexmk -pdf -f $*'

"-----ultisnips----------------------------------------------
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
