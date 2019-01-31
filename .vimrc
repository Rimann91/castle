"""""""""""""""""""""""
"NeoBundle
"""""""""""""""""""""""
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'morhetz/gruvbox'
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"""""""""""""""""""""""
"Turn on plugin filetypes
:filetype plugin on


" navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"turn on all colors
set t_Co=256
set termguicolors

"update time
set updatetime=250

" Color scheme 

syntax on
set background=dark
"syn match parens /[()[]{}]/
"  hi parens ctermfg=red
colorscheme gruvbox    

highlight Pmenu ctermfg=cyan ctermbg=16 guifg=#ffffff guibg=#000000
highlight LineNr ctermfg=grey

set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

"line numbers: relative normal, absolute insert

set number
autocmd InsertLeave * :set relativenumber
autocmd InsertEnter * :set norelativenumber
"show file stats

set ruler

" Encoding
set encoding=utf-8
"""set guifont = LiberationMono

" indent
filetype plugin indent on

" enable Pathogen for runtime
execute pathogen#infect()
Helptags

"tab space indicator
"autocmd FileType csv setlocal listchars=tab:\\ 

set listchars=tab:\|\ 
set list

au BufNewFile,BufRead *.csv set nolist
"crosshairs

set cursorline
set cursorcolumn
hi CursorLine   cterm=underline ctermbg=None ctermfg=None gui=underline 
hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=gray guibg=gray guifg=None
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>



"folding options
noremap <space> za 
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

"" Tab settings
"set tabstop=2
"set softtabstop=2
"set shiftwidth=2"


" Python settings----{{{
	let python_highlight_all=1

	au BufNewFile,BufRead *.py
	    \ set tabstop=4 |
	    \ set softtabstop=4 |
	    \ set shiftwidth=4 |
	    \ set textwidth=79 |
	    \ set expandtab |
	    \ set autoindent |
	    \ set fileformat=unix |

	highlight BadWhitespace ctermbg=red guibg=darkred
	au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"}}}


"===============
"PLUGIN CONFIGS
"===============
 
 
 " Syntastic---------{{{
 	set statusline+=%#warningmsg#
 	set statusline+=%{SyntasticStatuslineFlag()}
 	set statusline+=%*
 	
 	let g:syntastic_always_populate_loc_list = 1
 	let g:syntastic_auto_loc_list = 1
 	let g:syntastic_check_on_open = 1
 	let g:syntastic_check_on_wq = 0
 	"let g:syntastic_javascript_checkers = ['jshint']
 	let g:syntastic_javascript_checkers = ['eslint']
"}}} 


 " Airline-----------{{{
	 set laststatus=2
	 
	 let g:airline_powerline_fonts = 1
	 let g:airline#extensions#tabline#enabled = 1
	 let g:airline#extensions#tabline#left_sep = ' '
	 let g:airline#extensions#tabline#left_alt_sep = '|'
	 
	   if !exists('g:airline_symbols')
	     let g:airline_symbols = {}
	   endif
	 
	   " unicode symbols
	   "let g:airline_left_sep = '»'
	   "let g:airline_left_sep = '▶'
	   "let g:airline_right_sep = '«'
	   "let g:airline_right_sep = '◀'
	   "let g:airline_symbols.crypt = '🔒'
	   let g:airline_symbols.linenr = '␊'
	   "let g:airline_symbols.linenr = '␤'
	   "let g:airline_symbols.linenr = '¶'
	   let g:airline_symbols.maxlinenr = '☰'
	   "let g:airline_symbols.maxlinenr = ''
	   let g:airline_symbols.branch = '⎇'
	   let g:airline_symbols.paste = 'ρ'
	   "let g:airline_symbols.paste = 'Þ'
	   "let g:airline_symbols.paste = '∥'
	   let g:airline_symbols.spell = 'Ꞩ'
	   let g:airline_symbols.notexists = '∄'
	   let g:airline_symbols.whitespace = 'Ξ'
"}}} 
 
 
 "CSV Vim------------{{{
	 "arrang into columns collapse before write
	 aug CSV_Editing
			au!
				au BufRead,BufWritePost *.csv :%ArrangeColumn
					au BufWritePre *.csv :%UnArrangeColumn
				aug end
	 
	 "display colum name in airline
	 let csv = '%1*%{&ft=~"csv" ? CSV_WCol("Name") . " " . CSV_WCol() : ""}%*'
"}}}
 

 "Ultisnips----------{{{
	 " Track the engine.
	 " Plugin 'SirVer/ultisnips'
	 "
	 " " Snippets are separated from the engine. Add this if you want them:
	 " Plugin 'honza/vim-snippets'
	 "
	 " " Trigger configuration. Do not use <tab> if you use
	 " https://github.com/Valloric/YouCompleteMe.
	  let g:UltiSnipsExpandTrigger="<C-j>"
	  let g:UltiSnipsJumpForwardTrigger="<C-j>"
	  let g:UltiSnipsJumpBackwardTrigger="<C-k>"
	 "
	 " " If you want :UltiSnipsEdit to split your window.
	  let g:UltiSnipsEditSplit="vertical"
	 
	  " tagbar
	 
	 nmap <F8> :TagbarToggle<CR>
 "}}}
 

 "Eighties.vim-------{{{
	 "----------------------
	 "resizes split screens to 'focus' on current
	 "-------------------------
	 "
	 let g:eighties_enabled = 0
	 let g:eighties_minimum_width = 100
	 let g:eighties_extra_width = 10 " Increase this if you want some extra room
	 let g:eighties_compute = 1 " Disable this if you just want the minimum + extra
	 let g:eighties_bufname_additional_patterns = ['fugitiveblame'] " Defaults to [], 'fugitiveblame' is only an example. Takes a comma delimited list of bufnames as strings.
 "}}} 
 

 "<CTR>-p vim--------{{{
	 "-----------------
	 "fuzzy finder for vim
	 "------------------
	 
	 set runtimepath^=~/.vim/bundle/ctrlp.vim
 "}}}
 

  "Tabular
 "-------
 ":let g:tabular_loaded = 1

