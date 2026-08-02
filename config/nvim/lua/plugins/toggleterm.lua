return {{
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        direction = "float", -- or "horizontal", "vertical", "tab"
        open_mapping = nil,  -- we'll make our own keybind
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        close_on_exit = true,
        shade_terminals = false,
    },
}}
