function r_highlight()
    local gruvbox = require("gruvbox").palette
    return {
            background = {
                bg = gruvbox.dark1,
            },
            fill = {
                bg = gruvbox.dark0,
            },
            buffer = {
                bg = gruvbox.dark1,
                fg = gruvbox.dark1
            },
            buffer_visible = {
                bg = gruvbox.dark1,
                fg = gruvbox.dark4
            },
            buffer_selected = {
                bg = gruvbox.dark2,
                fg = gruvbox.light0
            },
            separator = {
                bg = gruvbox.dark1,
                fg = gruvbox.dark0
            },
            separator_visible = {
                bg = gruvbox.dark1,
                fg = gruvbox.dark0
            },
            separator_selected = {
                bg = gruvbox.dark2,
                fg = gruvbox.dark0
            },
            close_button = {
                bg = gruvbox.dark1,
                fg = gruvbox.dark1
            },
            close_button_selected = {
                bg = gruvbox.dark2,
                fg = gruvbox.dark4
            },
            modified = {
                bg = gruvbox.dark1,
                fg = gruvbox.light0
            },
            modified_visible = {
                bg = gruvbox.dark1,
                fg = gruvbox.light0
            },
            modified_selected = {
                bg = gruvbox.dark2,
                fg = gruvbox.light0
            },
            -- hint
            hint = {
                bg = gruvbox.dark1,
                fg = gruvbox.bright_blue
            },
            hint_visible = {
                bg = gruvbox.dark1,
                fg = gruvbox.bright_blue
            },
            hint_selected = {
                bg = gruvbox.dark2,
                fg = gruvbox.bright_blue
            },
            hint_diagnostic = {
                bg = gruvbox.dark1,
                fg = gruvbox.bright_blue
            },
            hint_diagnostic_visible = {
                bg = gruvbox.dark1,
                fg = gruvbox.bright_blue
            },
            hint_diagnostic_selected = {
                bg = gruvbox.dark2,
                fg = gruvbox.bright_blue
            },
            --info
            info = {
                bg = gruvbox.dark1,
                fg = gruvbox.bright_aqua
            },
            info_visible = {
                bg = gruvbox.dark1,
                fg = gruvbox.bright_aqua
            },
            info_selected = {
                bg = gruvbox.dark2,
                fg = gruvbox.bright_aqua
            },
            info_diagnostic = {
                bg = gruvbox.dark1,
                fg = gruvbox.bright_aqua
            },
            info_diagnostic_visible = {
                bg = gruvbox.dark1,
                fg = gruvbox.bright_aqua
            },
            info_diagnostic_selected = {
                bg = gruvbox.dark2,
                fg = gruvbox.bright_aqua
            },
            -- warning
            warning = {
                bg = gruvbox.dark1,
                fg = gruvbox.bright_yellow
            },
            warning_visible = {
                bg = gruvbox.dark1,
                fg = gruvbox.bright_yellow
            },
            warning_selected = {
                bg = gruvbox.dark2,
                fg = gruvbox.bright_yellow
            },
            warning_diagnostic = {
                bg = gruvbox.dark1,
                fg = gruvbox.bright_yellow
            },
            warning_diagnostic_visible = {
                bg = gruvbox.dark1,
                fg = gruvbox.bright_yellow
            },
            warning_diagnostic_selected = {
                bg = gruvbox.dark2,
                fg = gruvbox.bright_yellow
            },
            -- error
            error = {
                bg = gruvbox.dark1,
                fg = gruvbox.bright_red
            },
            error_visible = {
                bg = gruvbox.dark1,
                fg = gruvbox.bright_red
            },
            error_selected = {
                bg = gruvbox.dark2,
                fg = gruvbox.bright_red
            },
            error_diagnostic = {
                bg = gruvbox.dark1,
                fg = gruvbox.bright_red
            },
            error_diagnostic_visible = {
                bg = gruvbox.dark1,
                fg = gruvbox.bright_red
            },
            error_diagnostic_selected = {
                bg = gruvbox.dark2,
                fg = gruvbox.bright_red
            }
        }

end

return {{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons',config = function()
    require('bufferline').setup {
        options = {
            mode = "buffers",
            hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'}
            },
            buffer_close_icon = "󰅖",
            modified_icon = "●",
            close_icon = "",

            right_mouse_command = "bdelete! %d",
            left_mouse_command = "buffer %d",
            middle_mouse_command = nil,

            max_name_length = 18,
            max_prefix_length = 15,
            tab_size = 18,

            diagnostics = "nvim_lsp",
            diagnostics_update_in_insert = false,
            diagnostics_update_on_event = true,
            diagnostics_indicator = function(count,level,diagnostics_dict,context)
                local test = false
                if test then return "( "..level.." "..count.." )" end

                if level == "warning" then
                    return "(⚠ "..count..")"
                end
                if level == "error" then
                    return "(⚠"..count..")"
                end
                if level == "hint" then
                    return "(ⓠ "..count..")"
                end
                if level == "info" then
                    return "(🛈 "..count..")"
                end
                return "("..count..")"
            end,
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "left",
                    separator = true
                }
            },
            separator_style = "slope"
        },
        highlights = r_highlight()
    }
end}}
