修改`autoload/vimwiki/html.vim`文件
    
    if level > plevel
        call add(toc, '<ul class="nav">')
    elseif level < plevel
        let plevel = s:close_list(toc, plevel, level)
    endif
   
 和

    for l in range(1, h_level-1)
        let h_number .= a:id[l].'_' 
    endfor
   
 
做软链接替换掉原始的html.vim文件：

        cd ~/.vim/myplugin
        ln -sf `pwd`/html.vim ~/.vim/bundle/vimwiki/autoload/vimwiki/html.vim
