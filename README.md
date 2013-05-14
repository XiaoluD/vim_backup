简单备份vim配置文件以及插件

#备份数据

##仓库准备
新建目录vim/bundle:  

    mkdir -pv vim/bundle

然后把vim目录变成一个Git仓库:

    cd vim && git init

备份.vimrc：

    cp ~/.vimrc ~/vim/.vimrc

##安装插件
使用子模块安装插件命令为： `git submodule add 插件的Git仓库地址 bundle/插件名字`

首先安装pathogen:  

    git submodule add git://github.com/tpope/vim-pathogen.git bundle/vim-pathogen
    
其他插件可用类似方法安装，例如：  

    git submodule add git://github.com/scrooloose/nerdtree.git bundle/nerdtree

##升级插件
单独升级插件，只要先进入插件目录，然后执行：  

    git checkout master; git pull

通过git submodule foreach来可以一次性升级全部插件：  

    git submodule foreach 'git checkout master && git pull

##删除插件
删除一个插件稍微繁琐了一点（相比较添加和升级），需要两条命令：

	rm -rf bundle/插件名	
	git rm -r bundle/插件名

要想彻底删除插件，还需要删除`.git/modules/bundle`中对应的插件目录。

##发布到 Github 
查看仓库状态：

> $ git status  
> \# On branch master  
> \#  
> \# Initial commit  
> \#  
> \# Changes to be committed:  
> \#   (use "git rm --cached <file>..." to unstage)  
> \#  
> \#   new file:   .gitmodules  
> \#   new file:   bundle/nerdtree  
> \#   new file:   bundle/pathogen  
> \#  
> \# Untracked files:  
> \#   (use "git add <file>..." to include in what will be committed)  
> \#	
> \#   .vimrc	

然后把.vimrc加入暂存区，然后提交：  

    git add .vimrc  
    git commit -m 'ADD: pathogen & nerdtree'	

然后把本地Git仓库推送到 Github 上：  

    git remote add origin git@github.com:xuelangZF/vim_backup	
    git push origin master	

## 注意事项
如果在push前github上有改动（比如在线编辑了说明文件等），需要先fetch然后本地合并才能push：  

    git fetch origin	
    git merge origin/master	


#恢复vim
要想在其他机器使用相同配置，只需要：  

    git clone http://github.com/xuelangZF/vim_backup.git ~/.vim	
    cd ~/.vim 
    ln -sf `pwd`/.vimrc ~/.vimrc
    git submodule init	
    git submodule update	

参考：  
[使用 Pathogen + Git 管理 Vim 插件][]  	
[分布式 Git - 为项目作贡献][]	 
[Git 工具 - 子模块][]  
[使用 Git Submodule 和 Vim-pathogen 管理、同步 Vim 插件及配置][]  
[Git Submodule Tutorial][1]  
[How do I remove a Git submodule?](http://stackoverflow.com/questions/1260748/how-do-i-remove-a-git-submodule)

[使用 Pathogen + Git 管理 Vim 插件]:http://lostjs.com/2012/02/04/use-pathogen-and-git-to-manage-vimfiles/  
[分布式 Git - 为项目作贡献]:http://git-scm.com/book/zh/%E5%88%86%E5%B8%83%E5%BC%8F-Git-%E4%B8%BA%E9%A1%B9%E7%9B%AE%E4%BD%9C%E8%B4%A1%E7%8C%AE  
[Git 工具 - 子模块]:http://git-scm.com/book/zh/Git-%E5%B7%A5%E5%85%B7-%E5%AD%90%E6%A8%A1%E5%9D%97  
[使用 Git Submodule 和 Vim-pathogen 管理、同步 Vim 插件及配置]:http://liluo.org/blog/2012/05/using-git-submodule-and-vim-pathogen-for-vim-configuraction-management/
[1]:[https://git.wiki.kernel.org/index.php/GitSubmoduleTutorial#Removal]
