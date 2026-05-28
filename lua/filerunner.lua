local M = {}

local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1

M.runfile = function()
    local filetype = vim.bo.filetype
    local filepath = vim.fn.expand('%:p')             -- Get the full path of the current file
    local directory = vim.fn.fnamemodify(filepath, ':h') -- Get the directory of the file
    local filename = vim.fn.expand('%:t:r')
    local write = ":wa"

    vim.cmd(write)

    local command

    if filetype == "c" then
        if is_windows then
            command = string.format([[botright 12split | terminal cmd.exe /k "cd /d %s && gcc "%s" -o "%s" && "%s.exe" && rm -f "%s.exe""]],
                directory, filepath, filename, filename, filename)
        else
            command = string.format([[botright 12split | terminal bash -c 'cd %s && gcc "%s" -o "%s" && "./%s" && rm -f "%s"']],
                directory, filepath, filename, filename, filename)
        end
    elseif filetype == "python" then
        local command = string.format(":botright 12split | terminal cd %s && python %s", directory, filepath)
    end

    if command then
        vim.cmd(command)
    end
end 

M.runfileVenv = function()
    local filetype = vim.bo.filetype
    local filepath = vim.fn.expand('%:p')             -- Get the full path of the current file
    local directory = vim.fn.fnamemodify(filepath, ':h') -- Get the directory of the file
    local filename = vim.fn.expand('%:t:r')
    local write = ":wa"

    vim.cmd(write)

    local command

    if is_windows then
        command = string.format(
            [[botright 12split | terminal cmd.exe /k "cd /d %s && .venv\Scripts\activate && python "%s""]],
            directory, filepath
        )
    else
        command = string.format(
            "botright 12split | terminal bash -lc 'cd %q && source .venv/bin/activate && python %q'",
            directory, filepath
          )
    end
    
    vim.cmd(command)
end
    
return M 
