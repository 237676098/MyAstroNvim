local conditions = require "heirline.conditions"

return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"
    opts.statusline = { -- statusline
      hl = { fg = "fg", bg = "bg" },
      status.component.mode {
        mode_text = { padding = { left = 1, right = 1 } },
      }, -- add the mode text
      status.component.git_branch(),
      status.component.file_info(),
      status.component.git_diff(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.lsp(),
      status.component.virtual_env(),
      status.component.treesitter(), -- Add the space indicator
      {
        provider = function()
          local tab_width = vim.opt.tabstop:get() -- 获取 tabstop 设置中的制表符宽度
          return " SPACE:" .. tab_width .. " " -- 使用"␉"（TAB字符）作为图标来表示空白
        end,
        -- hl = "StatusLine",
        condition = conditions.is_not_empty,
      },
      -- Add the encoding indicator
      {
        provider = function()
          return " " .. vim.bo.fileencoding:upper() .. " " -- 显示编码类型
        end,
        -- hl = "StatusLine",
        condition = conditions.is_not_empty,
      },

      -- Add the line ending type indicator
      {
        provider = function()
          local eol = vim.bo.endofline and "LF" or "CRLF" -- 检查换行类型
          return " " .. eol .. " "
        end,
        -- hl = "StatusLine",
        condition = conditions.is_not_empty,
      },
      -- status.component.fill(),
      -- status.component.nav(),
      -- status.component.tabline_file_info
      -- remove the 2nd mode indicator on the right
    }
  end,
}
