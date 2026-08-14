vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"

vim.diagnostic.config({ virtual_text = true }) 

vim.keymap.set("n", "<leader>qq", "<cmd>qa!<cr>")
-- buffer commands
vim.keymap.set("n","<leader>bn","<cmd>bn<cr>")
vim.keymap.set("n","<leader>sp","<cmd>sp<cr>")
vim.keymap.set("n","<leader>bp","<cmd>bp<cr>")
vim.keymap.set("n","]]b","<cmd>BufferLineMoveNext<cr>")
vim.keymap.set("n","[[b","<cmd>BufferLineMovePrev<cr>")
vim.keymap.set("n","<leader>bf",function() -- buffer focus
    vim.cmd "bn"
    vim.cmd "bp"
end)

vim.keymap.set({ "n", "t" }, "<C-/>", function()
    require("toggleterm").toggle()
end, { desc = "Toggle Terminal" })

Username = "tonydsoy"

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

vim.cmd[[au TextYankPost * silent! lua vim.highlight.on_yank()]] -- make flashes appear when you yank.

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

local gruvbox = require("gruvbox").palette
-- lualine
local set_hl = vim.api.nvim_set_hl

set_hl(0, 'BlinkCmpMenu', { bg = gruvbox.dark0, fg = gruvbox.light0 })
set_hl(0, 'BlinkCmpMenuBorder', { bg = gruvbox.dark0, fg = gruvbox.dark1 })
set_hl(0, 'BlinkCmpMenuSelection', { bg = '#313244', fg = gruvbox.light1, bold = true })

local gruvbox_reminder = {
light_red_soft = '#f78b7f',
light_aqua = '#e8e5b5',
light_red_hard = '#fc9690',
light_red = '#fc9487',
faded_orange = '#af3a03',
dark_red_soft = '#7b2c2f',
faded_purple = '#8f3f71',
faded_blue = '#076678',
light0 = '#fbf1c7',
faded_green = '#79740e',
faded_red = '#9d0006',
light2 = '#d5c4a1',
light_green_soft = '#cecb94',
faded_yellow = '#b57614',
dark_aqua_hard = '#3e4934',
light_green = '#d5d39b',
neutral_yellow = '#d79921',
neutral_green = '#98971a',
neutral_blue = '#458588',
neutral_red = '#cc241d',
neutral_purple = '#b16286',
dark_red = '#722529',
neutral_aqua = '#689d6a',
dark_green = '#62693e',
bright_red = '#fb4934',
light_aqua_soft = '#e1dbac',
bright_green = '#b8bb26',
bright_aqua = '#8ec07c',
bright_orange = '#fe8019',
bright_purple = '#d3869b',
light_aqua_hard = '#e6e9c1',
light4 = '#a89984',
light3 = '#bdae93',
bright_blue = '#83a598',
dark0_hard = '#1d2021',
bright_yellow = '#fabd2f',
dark_aqua = '#49503b',
dark_aqua_soft = '#525742',
dark0 = '#282828',
dark0_soft = '#32302f',
dark3 = '#665c54',
dark1 = '#3c3836',
dark4 = '#7c6f64',
gray = '#928374',
light_green_hard = '#d3d6a5',
dark2 = '#504945',
light0_hard = '#f9f5d7',
dark_green_soft = '#686d43',
light0_soft = '#f2e5bc',
light1 = '#ebdbb2',
faded_aqua = '#427b58',
neutral_orange = '#d65d0e',
dark_red_hard = '#792329',
dark_green_hard = '#5a633a',
}

local lualine_colors = {
  normal = {
    a = {bg = gruvbox.gray, fg = gruvbox.dark0, gui = 'bold'},
    b = {bg = gruvbox.dark1, fg = gruvbox.light0},
    c = {bg = gruvbox.dark0_soft, fg = gruvbox.gray}
  },
  insert = {
    a = {bg = gruvbox.bright_blue, fg = gruvbox.dark0, gui = 'bold'},
    b = {bg = gruvbox.dark1, fg = gruvbox.light0},
    c = {bg = gruvbox.dark0_soft, fg = gruvbox.gray}
  },
  visual = {
    a = {bg = gruvbox.bright_orange, fg = gruvbox.dark0, gui='bold'},
    b = {bg = gruvbox.dark1, fg = gruvbox.light0},
    c = {bg = gruvbox.dark0_soft, fg = gruvbox.gray}
  },
  replace = {
    a = {bg = gruvbox.bright_red, fg = gruvbox.dark0, gui = 'bold'},
    b = {bg = gruvbox.dark1, fg = gruvbox.light0},
    c = {bg = gruvbox.dark0_soft, fg = gruvbox.gray}
  },
  command = {
    a = {bg = gruvbox.neutral_aqua, fg = gruvbox.dark0, gui = 'bold'},
    b = {bg = gruvbox.dark1, fg = gruvbox.light0},
    c = {bg = gruvbox.dark0_soft, fg = gruvbox.gray}
  },
  inactive = {
    a = {bg = gruvbox.dark0_soft, fg = gruvbox.dark1, gui = 'bold'},
    b = {bg = gruvbox.dark0_soft, fg = gruvbox.dark1},
    c = {bg = gruvbox.dark0_soft, fg = gruvbox.gray}
  }
}
require('lualine').setup {options = {theme = lualine_colors}}
