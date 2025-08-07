local telescopeActionState = require('telescope.actions.state')
local telescopeActions = require('telescope.actions')
local telescopeFinders = require('telescope.finders')
local telescopePickers = require('telescope.pickers')
local telescopeConfig = require('telescope.config').values
local symbols = require('box-drawing.symbols')

local M = {}

M.pickBoxDrawingSymbol = function(opts)
    opts = opts or {}
    telescopePickers
        .new(opts, {
            prompt_title = 'Box Drawing Symbols',
            finder = telescopeFinders.new_table({
                results = symbols.TABLE_SYMBOLS,
                entry_maker = function(entry)
                    return {
                        value = entry,
                        display = entry.symbol
                            .. '  '
                            .. entry.name
                            .. ' ['
                            .. entry.style
                            .. ']',
                        ordinal = entry.style .. ' ' .. entry.name,
                    }
                end,
            }),
            sorter = telescopeConfig.generic_sorter(opts),
            attach_mappings = function(promptBuffer, map)
                telescopeActions.select_default:replace(function()
                    telescopeActions.close(promptBuffer)
                    vim.api.nvim_put({
                        telescopeActionState.get_selected_entry().value.symbol,
                    }, '', false, true)
                end)
                return true
            end,
        })
        :find()
end

return M
