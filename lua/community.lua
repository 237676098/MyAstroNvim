-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  --查看某一行的git提交记录 
  { import = "astrocommunity.git.git-blame-nvim" },
  --快速的给单词加双引号/单引号等 
  { import = "astrocommunity.motion.mini-surround" },
  --定制命令行/通知/弹出菜单的ui
  { import = "astrocommunity.utility.noice-nvim" },
  --命令行模式补全提示
  { import = "astrocommunity.completion.cmp-cmdline" },
  -- { import = "astrocommunity.workflow.bad-practices-nvim" },
  -- import/override with your plugins folder
}
