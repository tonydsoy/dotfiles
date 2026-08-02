vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"

vim.diagnostic.config({ virtual_text = true }) 

vim.keymap.set("n", "<leader>e", function() Snacks.explorer() end)
vim.keymap.set("n", "<leader>qq", "<cmd>qa!<cr>")
-- buffer commands
vim.keymap.set("n","<leader>bd","<cmd>bd<cr>")
vim.keymap.set("n","<leader>bn","<cmd>bn<cr>")
vim.keymap.set("n","<leader>sp","<cmd>sp<cr>")
vim.keymap.set("n","<leader>bp","<cmd>bp<cr>")
vim.keymap.set("n","<leader>bf",function() -- buffer focus
    vim.cmd "bn"
    vim.cmd "bp"
end)

vim.keymap.set({ "n", "t" }, "<C-/>", function()
    require("toggleterm").toggle()
end, { desc = "Toggle Terminal" })

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.splitright = true
opt.splitbelow = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.termguicolors = true
opt.wrap = false

require("config.lazy")

-- Default options:
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
