当前文件夹下的lua文件作用说明：
1. options.lua文件：该文件用于配置neovim的基础配置，如行号，缩进，窗口等等这些neovim内置的设置。
2. keymaps.lua文件：该文件用于更改配置neovim的快捷键设置。
3. lazy.lua文件：该文件是插件lazy.nvim（一个包管理器插件）的配置文件，配置有检查是否有lazy.nvim插件是否存在，不存在，则下载，并检查下载指定文件夹下的插件（也就是对应插件的lua文件）。
