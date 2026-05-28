local filerunner = require("filerunner")
local helper = require("helper")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '`', ':botright 12 split | terminal<CR>')    
vim.keymap.set('n', '<F5>', filerunner.runfile) 
vim.keymap.set('n', '<F6>', filerunner.runfileVenv)
--vim.keymap.set('i', '<C-n>', '<Esc>o', { noremap = true, silent = true})



local keyskip = function(char)
    local col = vim.fn.col('.')
    local line = vim.fn.getline('.')
    if line:sub(col, col) == char then
        return '<Right>'
    else
        return char
    end
end

local autoquote = function(char)
    local col = vim.fn.col('.')
    local line = vim.fn.getline('.')
    if line:sub(col-1, col-1) ~= char then
        if line:sub(col, col) == char then
            return '<Right>'
        else
            return char .. char .. '<Left>'
        end
    else
        return char .. char .. '<Left>'
    end
end

vim.keymap.set('i', '{', '{}<Left>')
vim.keymap.set('i', '(', '()<Left>')
vim.keymap.set('i', '[', '[]<Left>')



--vim.keymap.set('i', '\'', '\'\'<Left>')
--vim.keymap.set('i', '\"', '\"\"<Left>')

vim.keymap.set('i', '}', function() return keyskip('}') end, { expr = true, noremap = true})
vim.keymap.set('i', ')', function() return keyskip(')') end, { expr = true, noremap = true})
vim.keymap.set('i', ']', function() return keyskip(']') end, { expr = true, noremap = true})
vim.keymap.set('i', '\'', function() return autoquote('\'') end, { expr = true, noremap = true})
vim.keymap.set('i', '"', function() return autoquote('"') end, { expr = true, noremap = true})

local bracketenter_list = {'(', ')', '[', ']', '{', '}', '\'', '\'', '"', '"'}


local bracketenter = function(bracket_list)
    local col = vim.fn.col('.')
    local line = vim.fn.getline('.')
    previous_char = line:sub(col-1, col-1)
    next_char = line:sub(col, col)

    if helper.contains(bracket_list, previous_char) then
        charindex = helper.firstOccurence(bracket_list, previous_char)
        if next_char == bracket_list[charindex + 1] then
            return '<CR><CR><Up><Tab>'
        end
    end
    return '<CR>'
end    

vim.keymap.set('i', '<CR>', function() return bracketenter(bracketenter_list) end, { expr = true, noremap = true})
