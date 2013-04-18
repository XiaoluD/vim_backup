syntax on                            	" support syntax highlight
set path=.,/usr/include 		" goto file path
set showmatch                        	" jump to the matching bracket
set ignorecase                       	" the case of normal letters is ignored
set showmode                         	" show the mode
set history=1000            
set mouse=a 			    	" use mouse
set number                           	" display line number
set hls                              	" highlight the words match the search pattern
set helplang=cn                      	" chinese help document 
"set helplang=en                     
set nocompatible                     	" shutdown the vi compatibility mode
set incsearch 			     	" show the pattern as it was typed so far
set foldmethod=marker 		     	" folds are created manually
set pastetoggle=<F2>                 	" toggle the paste mode with <F2>
set iskeyword+=_,$,@,%,#,-           	" set the keywords
set confirm                           	" prompt when existing from an unsaved file
set fileencodings=ucs-bom,utf-8,cp936,gb18030,default,latin1
set clipboard=unnamedplus 		" yank to system clipboard

"Default Indentation
set autoindent                       	" indent automatically
set tabstop=8                        	" number of spaces a <Tab> counts for
set shiftwidth=8 		     	" number of spaces each step of (auto)indent counts for
set softtabstop=8                       " Number of spaces that a <Tab> counts for while using <BS>. 
set expandtab

"set hlsearch 			     	" enable highlight(default)
"set nohlsearch                      	" cancel highlight 
"set wrap 			     	" enables wrap(default)
"set nowrap                           	" cancel wrap
"set textwidth=70 		     	" maximum width in a line
"set tags=~/AdvanPro/tags             	" tags directory

filetype on      		     	" enables filetype detection
filetype plugin on                   	" enables filetype plugin
filetype indent on 		     	" enables filetype indent
color desert                         	" color theme


" for convenience
" ------------------------------------------------------
" for all file
nmap <S-w> :w !sudo tee %<CR>  " save file as root

" for vimwiki
autocmd Filetype vimwiki ab hl {{{class="brush:python"}}}
autocmd Filetype vimwiki ab tag <a name=""> </a>
autocmd Filetype vimwiki ab jump <a href="#"> </a>
autocmd Filetype vimwiki ab \n </br>
autocmd Filetype vimwiki ab pi {{../picture/.png\|\|title=""}}
autocmd Filetype vimwiki ab py [[local:../learnPython/.py\|Demo]]
autocmd Filetype vimwiki ab do _//todo_
autocmd Filetype vimwiki setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" for python
autocmd BufNewFile  *.py 0r ~/wiki/template/header.py
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype python setlocal foldmethod=indent
autocmd Filetype python nmap  <F5> :!python %<CR>       " run the python
autocmd Filetype python set textwidth=79 		" pep8 
set foldlevel=99        		                " don't fold the code by default
let g:pydiction_location = '~/etc/complete-dict'        " pydiction plugin required

" for c, cpp 
" SingleCompiler plugin required
autocmd Filetype c,cpp nmap <F7> :SCCompile<cr>
autocmd Filetype c,cpp nmap <F5> :SCCompileRun<cr>
" format the code
autocmd! BufNewFile,BufRead *.c nmap <F12> :!indent -kr -i8 %<CR>
autocmd! BufNewFile,BufRead *.h nmap <F12> :!indent -kr -i8 %<CR>
autocmd! BufNewFile,BufRead *.cpp nmap <F12> :!indent -kr -i8 %<CR>
autocmd Filetype c,cpp setlocal tabstop=8 shiftwidth=8 softtabstop=8

" for tags
nnoremap <C-l> gt               " Ctrl-l: next tag
nnoremap <C-h> gT               " Ctrl-h: pre tag


" conf for plugins
" ------------------------------------------------------
" conf for pathogen 
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" conf for Powerline 
set nocompatible                         " Disable vi-compatibility
set laststatus=2                         " Always show the statusline
set encoding=utf-8                       " Necessary to show Unicode glyphs
set t_Co=256                             " Explicitly tell Vim that the terminal support 256 colors
let g:Powerline_symbols = 'unicode'

" conf for NERDTree
nmap <C-t> :NERDTree<CR>                 

" conf for tagbar: list the tags(function, class, variable, etc) in the file and <a href="#"> </a>
nmap <F3> :TagbarToggle<CR>
let g:tagbar_width = 40                  " set tagbar's width 40
let g:tagbar_right = 1                   " show the tagbar in the right
" let g:tagbar_left = 1      

" conf for vimwiki
let g:vimwiki_camel_case = 0             "don't take the CamelCasedWords as a new wiki
let g:vimwiki_list = [{
			\ 'path' : '~/wiki/cs_wiki/',
			\ 'path_html' : '~/Documents/wiki_html/cs_html/',
			\ 'template_path': '~/wiki/template/', 
			\ 'template_default': 'default',
			\ 'template_ext': '.tpl',
			\ 'auto_export' : 0},
			\{
			\ 'path' : '~/wiki/life_wiki/',
			\ 'path_html' : '~/Documents/wiki_html/life_html/',
			\ 'template_path': '~/wiki/template/', 
			\ 'template_default': 'default',
			\ 'template_ext': '.tpl',
			\ 'auto_export' : 0},
			\{
			\ 'path' : '~/wiki/original_wiki/',
			\ 'path_html' : '~/Documents/wiki_html/original_html/',
			\ 'template_path': '~/wiki/template/', 
			\ 'template_default': 'default',
			\ 'template_ext': '.tpl',
			\ 'auto_export' : 0},
			\{
			\ 'path' : '~/wiki/',
			\ 'path_html' : '~/Documents/wiki_html/',
			\ 'template_path': '~/wiki/template/', 
			\ 'template_default': 'main',
			\ 'template_ext': '.tpl',
			\ 'auto_export' : 0}]
let g:vimwiki_valid_html_tags='a,br,blockquote'
let g:vimwiki_folding=1
let g:vimwiki_hl_headers=1
let g:vimwiki_auto_checkbox=1



" Go to last file(s) if invoked without arguments.
" http://vim.wikia.com/wiki/Open_the_last_edited_file 
"autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
"    \ call mkdir($HOME . "/.vim") |
"    \ endif |
"    \ execute "mksession! " . $HOME . "/.vim/Session.vim"
"
"autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
"    \ execute "source " . $HOME . "/.vim/Session.vim"


" `0 Go to last position in a file.

" surround the word with particular
"function! s:surround()
"    let word = expand("<cword>")
"    let wrap= input("wrap with: ")
"    let command = "s/".word."/".wrap.word.wrap."/"
"    execute command
"endfunction
"nmap cx :call <SID>surround()<CR>
