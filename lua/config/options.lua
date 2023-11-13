local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪切板
opt.clipboard:append("unnamedplus")

-- 默认新增的窗口在右或下边
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true -- 小写时搜索忽略大小写
opt.smartcase = true -- 大写时搜索只搜索大写

-- 检测当前目录下的.nvim.lua文件，如果有将询问是否自动加载该文件
opt.exrc = true

-- 外观
opt.termguicolors = true -- 使用终端真颜色
opt.signcolumn = "yes" -- 左侧可以多一列

