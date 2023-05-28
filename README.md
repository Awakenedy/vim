
Installation

	一、git clone https://github.com/Awakenedy/vim.git ~/.vim
    
	二、mv ~/.vim/.vimrc ~/

    安装对依赖

    三、atp install build-essential cmake python3-dev  clang-14 lldb-14 lld-14 gcc-11 g++-11
    

    四、cd /root/.vim/bundle

    五、git clone https://ghproxy.com/https://github.com/ycm-core/YouCompleteMe.git

    六、cd ~/.vim/bundle/YouCompleteMe

    七、git submodule update --init --recursive  #此步可能会因为网络问题失败，多运行两次就OK了

    八、python3 install.py --clangd-completer --go-completer

        出现：this script should not be run with root privileges . #此脚本不应使用root权限运行。

        解决：python3 install.py --clangd-completer --go-completer --force-sudo

    九、python3 install.py --clangd-completer --go-completer --force-sudo

        出现：Building regex module…/usr/bin/python3: can’t open file ‘/root/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/mrab-regex/setup.py  #不能打开mrab-regex下的setup.py.查看了一下mrab-regex没有文件

        解决：1.cd /root/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/
　　　        2.git clone https://github.com/mrabarnett/mrab-regex.git

    十、cd ~/.vim/bundle/YouCompleteMe
    
    十一、python3 install.py --clangd-completer --go-completer --force-sudo

    ptyon 安装 autopep8与flake8

	pip3 install autopep8
    pip3 install flake8 
