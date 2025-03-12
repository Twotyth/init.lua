return {
    {
        'echasnovski/mini.surround',
        event = 'InsertEnter',
        config = function ()
            require('mini.surround').setup();
        end
    },
    {
        'echasnovski/mini.pairs',
        event = 'InsertEnter',
        config = function ()
            require('mini.pairs').setup();
        end
    }
}
