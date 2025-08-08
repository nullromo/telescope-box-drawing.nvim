local boxDrawing = require('box-drawing')
local telescope = require('telescope')

-- cache the config from the setup
local extensionConfig = {}

return telescope.register_extension({
    setup = function(ext_config, config)
        extensionConfig = ext_config
    end,
    exports = {
        ['box-drawing'] = function()
            -- use cached config
            boxDrawing.pickBoxDrawingSymbol(extensionConfig)
        end,
    },
})
