if !exists('g:vscode')
	inoremap jk <esc>
	nnoremap B ^
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



	"-----Remappings--------------------------------------------
	let mapleader=","


	call plug#begin()
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'junegunn/goyo.vim'
	Plug 'lervag/vimtex'
  Plug 'Konfekt/FastFold'
  Plug 'matze/vim-tex-fold'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'scrooloose/nerdtree'
	Plug 'jiangmiao/auto-pairs'
	call plug#end()

	"-----deoplete----------------------------------------------
	call deoplete#custom#var('omni', 'input_patterns', {
				\ 'tex': g:vimtex#re#deoplete})
	"k::let g:deoplete#enable_at_startup=1
	"-----latex----------------------------------------------
	let g:tex_flavor='latex'
	let g:tex_conceal = ''
	"let g:vimtex_view_method='zathura'
	let g:vimtex_fold_manual = 1
	let g:vimtex_latexmk_continuous = 1
	let g:vimtex_compiler_progname = 'nvr'

	nnoremap :vc :VimtexCompile
	nnoremap :vv VimtexView
	nnoremap :ve VimtexErrors

	"-----NERD TREE--------------------------------------------
	map<C-n> :NERDTreeToggle<CR>

	"-----Goyo--------------------------------------------
	nnoremap <C-g> :Goyo<CR>
	vnoremap <C-g> :Goyo<CR>
	inoremap <C-g> :Goyo<CR>
	let g:goyo_width=120

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

	highlight Comment ctermfg=red

	"-----ultisnips----------------------------------------------
	let g:UltiSnipsExpandTrigger='<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
endif
