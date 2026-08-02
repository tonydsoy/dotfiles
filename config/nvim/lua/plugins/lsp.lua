return {{
  "mason-org/mason.nvim",
  config = true,
},

{
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {},
},

{
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable("clangd")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("pyright")
  end,
},}
