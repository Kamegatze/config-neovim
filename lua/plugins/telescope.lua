return {
{
        'nvim-telescope/telescope.nvim',
        -- pull a specific version of the plugin
        tag = 'v0.2.1',
        dependencies = {
            -- general purpose plugin used to build user interfaces in neovim plugins
            'nvim-lua/plenary.nvim'
        },
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
    }
}
