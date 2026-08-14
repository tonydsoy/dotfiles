function ugotwarnings()
    return {function()
            local diagnostic = vim.diagnostic.get(0)
            local errors = 0
            local warnings = 0
            for _,v in ipairs(diagnostic) do
                if (v.severity == vim.diagnostic.severity.ERROR) then
                    errors = errors + 1
                elseif v.severity == vim.diagnostic.severity.WARN then
                    warnings = warnings + 1
                end
            end
            if (errors >= 1) then 
                return "U GOT ERRORS O_O;;;;" -- i love this
            end
            if (warnings >= 1) then
                return "warnin o_o'"
            end
            return ""
        end,color = function() -- i have to make color a function??
            local diagnostic = vim.diagnostic.get(0)
            local errors = 0
            local warnings = 0
            for _,v in ipairs(diagnostic) do
                if (v.severity == vim.diagnostic.severity.ERROR) then
                    errors = errors + 1
                elseif v.severity == vim.diagnostic.severity.WARN then
                    warnings = warnings + 1
                end
            end
            if (errors >= 1) then
                return {fg = "#ff7777"}
            end
            if (warnings >= 1) then
                return {fg = "#ff9900"}
            end
    end}
end

return {{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        --component_separators = { left = '', right = ''},
        --section_separators = { left = '', right = ''},
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
          refresh_time = 16, -- ~60fps
          events = {
            'WinEnter',
            'BufEnter',
            'BufWritePost',
            'SessionLoadPost',
            'FileChangedShellPost',
            'VimResized',
            'Filetype',
            'CursorMoved',
            'CursorMovedI',
            'ModeChanged',
          },
        }
      },
      sections = {
        lualine_a = {function() -- we love kaomoji
            local char = vim.api.nvim_get_mode().mode
            if char == "n" then
                return "norm -_- "
            end
            if char == "v" then
                return "visu o_o'"
            end
            if char == "c" then
                return "cmds ~.~ ;"
            end
            if char == "i" then
                return "inst ^▽^;"
            end
        end},
        lualine_b = {--[['branch', 'diff','diagnostics']] ugotwarnings()},
        lualine_c = {{'filename',symbols={modified='(*)'}}},
        lualine_x = {},
        lualine_y = {--[['progress']]},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {ugotwarnings()},
        lualine_c = {{'filename',symbols={modified='(*)'}}},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
    end
}}
