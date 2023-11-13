neovim 配置说明

1.文件夹结构

   nvim -----------------------> : neovim的配置文件夹, 用来配置neovim, 位置在: linux: ~/.config/nvim, windows: ~/AppData/Local/nvim, 该文件夹下需要有一个init.lua文件, 用来加载相关配置
     |
     |____ftplugin ------------> : 储存针对各种文件类型的相关配置文件, 如:lsp(注意: 如果在这个文件夹增加一种文件类型的配置，将会覆盖插件对该文件类型的配置, 比如lsp的自动配置), dap(主要是为了增加debug的配置, 增加dap配置前需要在该文件中重写该类型lsp的配置)
     |
     |____lua -----------------> : 储存neovim的配置和插件, require()导入模块时默认是在该文件夹下搜索
           |
           |____plugins -------> : 储存neovim的插件以及配置
           |
           |____config --------> : 储存neovim的内置的基础配置(neovim内置配置, 内置快捷键配置), lsp专用配置, dap专用配置和一个包管理器插件(用来安装管理neovim的插件)
                 |
                 |____lsp -----> : 储存neovim配置好dap服务的文件类型的lsp服务的专用配置
                 |
                 |____dap -----> : 储存neovim的已经配置好dap服务的文件件类型的配置


2.
