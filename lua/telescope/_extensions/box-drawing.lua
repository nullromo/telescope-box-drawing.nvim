local boxDrawing = require('box-drawing')
local telescope = require('telescope')

return telescope.register_extension({
    setup = function(ext_config, config)
        -- nothing to set up
    end,
    exports = {
        ['box-drawing'] = boxDrawing.pickBoxDrawingSymbol,
    },
})
