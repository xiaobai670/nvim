local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
    install = {
        -- 启动时安装缺少的插件。这不会增加启动时间。
        missing = true,
        -- 在启动期间启动安装时，请尝试加载其中一种配色方案
        colorscheme = { "tokyonight-storm" },
      },
}
-- 检查指定文件下的lua文件，下载安装对应的插件
require("lazy").setup("plugins", opts)
