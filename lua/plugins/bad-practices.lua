
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "antonk52/bad-practices.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      most_splits = 3, -- how many splits are considered a good practice(default: 3)
      most_tabs = 3, -- how many tabs are considered a good practice(default: 3)
      max_hjkl = 10, -- how many times you can spam hjkl keys in a row(default: 10)
    },
  }
}
