vim_backup
==========

vim 配置文件以及插件

#备份数据

##仓库准备
新建目录vim/bundle:
mkdir -pv .vim/bundle

然后把vim目录变成一个Git仓库:
cd .vim && git init

备份.vimrc：
cp ~/.vimrc ~/vim/.vimrc

##安装插件
使用子模块安装插件命令为： git submodule add 插件的Git仓库地址 bundle/插件名字

首先安装pathogen:
git submodule add git://github.com/tpope/vim-pathogen.git bundle/vim-pathogen
其他插件可用类似方法安装，例如：
git submodule add git://github.com/scrooloose/nerdtree.git bundle/nerdtree

##升级插件
单独升级插件，只要先进入插件目录，然后执行：
git checkout master; git pull

通过git submodule foreach来可以一次性升级全部插件：
git submodule foreach 'git checkout master && git pull'

##删除插件
删除一个插件稍微繁琐了一点（相比较添加和升级），需要两条命令：
rm -rf bundle/插件名
git rm -r bundle/插件名

##发布到 Github 
查看仓库状态：
git status
> # On branch master
> #
> # Initial commit
> #
> # Changes to be committed:
> #   (use "git rm --cached <file>..." to unstage)
> #
> #   new file:   .gitmodules
> #   new file:   bundle/nerdtree
> #   new file:   bundle/pathogen
> #
> # Untracked files:
> #   (use "git add <file>..." to include in what will be committed)
> #
> #   .vimrc

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
git clone http://github.com/xuelangZF/vim_backup ~/.vim
cp ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
