syntax on                            	"语法支持
syntax enable 			     	"打开vim的语法高亮
set path=.,/usr/include 		"goto file path
set showmatch                        	"代码匹配
set ignorecase                       	"检索时忽略大小写
set showmode                         	"显示模式
set history=1000            
set mouse=a 			    	"使用鼠标
set number                           	"显示行号
set hls                              	"检索时高亮显示匹配项
set helplang=cn                      	"帮助系统设置为中文
set nocompatible                     	"关闭Vi兼容模式
set incsearch 			     	"搜索时，输入的词句的逐字符高亮
set foldmethod=marker 		     	"手动设置折叠
set pastetoggle=<F2>                 	"<F2>切换paste开关
set iskeyword+=_,$,@,%,#,-           	"带有如下符号的单词不要被换行分割
set confirm                           	"prompt when existing from an unsaved file
set fileencodings=ucs-bom,utf-8,cp936,gb18030,default,latin1
set clipboard=unnamedplus 		"yank至系统剪贴板

"Default Indentation
set autoindent                       	"自动缩进
set tabstop=8                        	"tab键空格数量
set shiftwidth=4 		     	"indent缩进的空格数
set expandtab                           "tabs are converted to spaces
set softtabstop=8

"set hlsearch 			     	"查找到的字符串高亮显示,默认
"set nohlsearch                      	"查找到的字符取串消高亮显示
"自动折行是把长的一行用多行显示 , 不在文件里加换行符
"set wrap 			     	"设置自动折行,默认开启
"set nowrap                           	"设置不自动折行
"自动换行是每行超过 n 个字的时候 vim 自动加上换行符
"set textwidth=70 		     	"自动换行
"set helplang=en                     	"帮助系统设置为english
"set tags=~/AdvanPro/tags             	"tags directory

filetype on      		     	"enables filetype detection
filetype plugin on                   	"载入文件类型插件
filetype indent on 		     	"为特定文件类型载入相关缩进文件
color desert                         	"color theme


" for convenience
" ------------------------------------------------------------------------------
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
autocmd Filetype python nmap  <F5> :!python %<CR>                       " run the python
set foldlevel=99        						" don't fold the code by default
let g:pydiction_location = '~/etc/complete-dict'                        " pydiction plugin required

" for c, cpp 
autocmd Filetype c,cpp nmap <F7> :SCCompile<cr>                         " SingleCompiler plugin required
autocmd Filetype c,cpp nmap <F5> :SCCompileRun<cr>                      " SingleCompiler plugin required
autocmd! BufNewFile,BufRead *.c nmap <F12> :!indent -kr -i8 %<CR>       " format the code
autocmd! BufNewFile,BufRead *.h nmap <F12> :!indent -kr -i8 %<CR>       " format the code
autocmd! BufNewFile,BufRead *.cpp nmap <F12> :!indent -kr -i8 %<CR>     " format the code

" for tags
nnoremap <C-l> gt               " Ctrl-l: next tag
nnoremap <C-h> gT               " Ctrl-h: pre tag



" conf for plugins
" ------------------------------------------------------------------------------
" conf for pathogen 
call pathogen#infect()

" conf for Powerline 
set nocompatible                         " Disable vi-compatibility
set laststatus=2                         " Always show the statusline
set encoding=utf-8                       " Necessary to show Unicode glyphs
set t_Co=256                             " Explicitly tell Vim that the terminal support 256 colors
let g:Powerline_symbols = 'unicode'

" conf for NERDTree
nmap <C-t> :NERDTree<CR>                 " open the NERDTree 

" conf for tagbar: list the tags(function, class, variable, etc) in the file and <a href="#"> </a>
nmap <F3> :TagbarToggle<CR>              " open tagbar
let g:tagbar_width = 40                  " set tagbar's width 40
let g:tagbar_right = 1                   " show the tagbar in the right
" let g:tagbar_left = 1      

" conf for vimwiki
let g:vimwiki_camel_case = 0             "don't take the CamelCasedWords as a new wiki
let g:vimwiki_list = [{
			\ 'path' : '~/wiki/cs_wiki/',
			\ 'path_html' : '~/Documents/wiki_html/cs_html/',
			\ 'auto_export' : 0},
			\{
			\ 'path' : '~/wiki/life_wiki/',
			\ 'path_html' : '~/Documents/wiki_html/life_html/',
			\ 'auto_export' : 0},
			\{
			\ 'path' : '~/wiki/original_wiki/',
			\ 'path_html' : '~/Documents/wiki_html/original_html/',
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
" autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
"     \ call mkdir($HOME . "/.vim") |
"     \ endif |
"     \ execute "mksession! " . $HOME . "/.vim/Session.vim"
" 
" autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
"     \ execute "source " . $HOME . "/.vim/Session.vim"
"
" `0 每次打开文件直接进入上次停留的位置.

" 单词周围添加特殊的字符
"function! s:surround()
"    let word = expand("<cword>")
"    let wrap= input("wrap with: ")
"    let command = "s/".word."/".wrap.word.wrap."/"
"    execute command
"endfunction
"nmap cx :call <SID>surround()<CR>

