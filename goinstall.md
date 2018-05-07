响应号召，咋们不翻墙

## 安装总体流程
* go安装
* 查看vim是否支持python插件编写；
* 下载vundle，管理vim的各种插件；
* 配置.vimrc, 用于表现vim的功能行为，包括：颜色、字体、布局、IDE等
* 因为要安装go的IDE，没有翻墙，则需要github下载golang官方的tools包
* vim相关插件安装

## Go安装
```shell
## 下载go可执行文件
wget -i https://redirector.gvt1.com/edgedl/go/go1.9.2.linux-amd64.tar.gz

mkdir -P /data/env/golang

tar -zxvf go1.9.2.linux-amd64.tar.gz -C /data/env/golang/

## 建立软连接，方便升级
ln -s /data/env/golang/go1.9.2 default

## 建立go的全局变量环境
sudo vim /etc/profile

## 在profile文件中添加
*****************************************
### golang
export GOROOT="/data/env/golang/default"
export PATH = "$PATH:$GOROOT/bin"
*****************************************
sudo source /etc/profile

## 切到自己的账户环境下
cd ~
mkdir -P  ~/godev/src ~/godev/bin ~/godev/pkg

vim .profile

### 在.profile文件中添加：
******************************************
export GOPATH=$HOME/godev
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
******************************************

## 用户环境变量配置生效
source .profile 
```
## 相关准备工作
一般情况下，如果你是用的Linux各个发行版，如：Ubuntu，RedHat、CentOS、Debian等等，vim编辑器都是功能裁剪版本，如果要完善的vim，则你需要重新源码编译安装vim编辑器。

这篇文章发布的时候，github的vim master分支是8.0版本，原生默认没有加入python插件编写
```shell
git clone https://github.com/vim/vim
cd vim
## 此处有坑，一般有些开发者没有指定各个参数的默认值，其实很多参数默认值是no
## python的配置config指定位置正确
## 支持python、lua、ruby和perl插件编写
## 注意点：这里的`--with-python-config-dir=`值表示vim需要支持的python版本，需要使用python3.所以必须先安装python3版本
./configure --with-features=huge --enable-pythoninterp=yes --enable-rubyinterp=yes --enable-luainterp=yes --enable-perlinterp=yes --with-python-config-dir=/usr/lib/python2.7/config/ --enable-gui=gtk2 --enable-cscope --prefix=/usr  
## 一般make或者make install不要这样使用`make && make install`
## make 完成后，用`echo $?`命令校验下，返回值：0，表示成功。make install也是一样
sudo make
## 下面的命令，可能会报错：vim二进制文件就在vim/src/vim文件。可以sudo mv src/vim /usr/local/bin/vim
sudo make install
```

vim安装完成后查看，然后查看vim版本号中的python是否支持
```shell
vim --version | grep python
## 输出结果： 
+cryptv          +linebreak       +python          +viminfo
+cscope          +lispindent      -python3         +vreplace
## 上面的结果中含有"+python", 表示vim已支持python插件编写。
## 支持python插件编写的原因：
## 我们安装vim-go的插件时会用到YouCompleteMe这个插件安装，它需要python插件编写支持。否则vim不好使

## 输出结果：
+cryptv          +linebreak       -python          +viminfo
+cscope          +lispindent      -python3         +vreplace
## 上面的结果中不含有"+python"， 是因为vim编译出来的可执行文件没有进行拷贝

sudo mv src/vim  /usr/local/bin/vim
## 然后在执行vim --version | grep python
```

## 下载bundle，配置.vimrc文件
```shell
## bundle用于vim的插件管理，自身的vim插件管理容易混乱
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

touch ~/.vimrc
## 并把我配置好的文件拷贝到.vimrc文件中，表现vim的行为
## 插件是使用vundle统一安装，所以是在.vimrc文件的
## call vundle#begin()
## call vundle#end() 之间放入你要安装的插件

## 例如：你要安装好看的vim呈现风格：字体样式。你可以在中间放入这个字体插件
Plugin 'altercation/vim-colors-solarized'

## [.vimrc配置文件](https://github.com/1046102779/goide/blob/master/.vimrc)
```

## 安装插件和下载插件
在命令行输入vim进入vim命令行模式：
```shell
## 插件安装
:PluginInstall 

## 因为要安装go的集成开发环境，所以你会在这里遇到被墙的问题，好在google公司把这些包放在的github上，牛逼轰轰
cd ~/godev/src/
mkdir -P golang.org/x
cd $GOPATH/src/golang.org/x
git clone https://github.com/golang/tools

## 安装YouCompleteMe的补全风格C family
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

## vim-go的插件安装, 安装完成后，你的vim基本就ok了
:GoInstallBinaries
```

安装后，写go代码，截图如下：
![hello,world](https://github.com/1046102779/goide/blob/master/2.pic.jpg)

## 参考文献
1. [vim-go](https://github.com/fatih/vim-go)
2. [tools](https://github.com/golang/tools)
3. [所需即所获IDE](https://github.com/yangyangwithgnu/use_vim_as_ide)
4. [vim](https://github.com/vim/vim)
5. [配置 VIM 的 Go 语言开发环境](https://github.com/Unknwon/wuwen.org/issues/7)
6. [vim与IDE的比较](https://www.zhihu.com/question/19870551)
7. [vim添加python支持](https://blog.csdn.net/u012587734/article/details/78572355)
