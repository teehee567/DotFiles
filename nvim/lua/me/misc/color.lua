return {
    'norcalli/nvim-colorizer.lua',
    event = 'VeryLazy',
    opts = {
        '*',
        '!bigfile',
    },
    keys = {
        { '<leader>color', ':ColorizerAttachToBuffer<CR>', desc = 'Reload colors' }
    },
}
