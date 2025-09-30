return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    keys = {
        {
        "<leader>a",
            function()
                if vim.api.nvim_buf_get_name(0):find("neo%-tree filesystem") == nil then
                require("harpoon"):list():add()
                end
            end,
            desc = "Add harpoon",
        },
        {
        "<C-e>",
            function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            desc = "Open harpoon list",
        },
        {
        "<leader>hc",
            function() require("harpoon"):list():clear() end,
            desc = "Clear harpoons",
        },

        { "<leader>h1", function() require("harpoon"):list():select(1) end, desc = "Harpoon 1 (2-9 also work)" },
        { "<leader>h2", function() require("harpoon"):list():select(2) end, desc = "Harpoon 2" },
        { "<leader>h3", function() require("harpoon"):list():select(3) end, desc = "Harpoon 3" },
        { "<leader>h4", function() require("harpoon"):list():select(4) end, desc = "Harpoon 4" },
        { "<leader>h5", function() require("harpoon"):list():select(5) end, desc = "Harpoon 5" },
        { "<leader>h6", function() require("harpoon"):list():select(6) end, desc = "Harpoon 6" },
        { "<leader>h7", function() require("harpoon"):list():select(7) end, desc = "Harpoon 7" },
        { "<leader>h8", function() require("harpoon"):list():select(8) end, desc = "Harpoon 8" },
        { "<leader>h9", function() require("harpoon"):list():select(9) end, desc = "Harpoon 9" },
    },

    opts = function()
        local harpoon = require("harpoon")
        harpoon:setup({
            settings = {
                save_on_toggle = true,
            },
            menu = {
                width = vim.api.nvim_win_get_width(0) - 4,
            },
        })
    end,
}
