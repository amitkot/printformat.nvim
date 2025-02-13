local M = {}

local function has_python3()
    if vim.fn.has('python3') == 0 then
        vim.notify("Python3 provider not found. Please run :checkhealth provider", vim.log.levels.ERROR)
        return false
    end
    return true
end

local function load_python_file()
    local python_file = vim.fn.stdpath('data') .. '/lazy/printformat.nvim/pythonx/printformat.py'
    vim.cmd('py3file ' .. python_file)
end

local python_loaded = false

function M.setup(opts)
    opts = opts or {}
    
    -- Create the command
    vim.api.nvim_create_user_command('PrintFormat', function()
        if has_python3() then
            if not python_loaded then
                load_python_file()
                python_loaded = true
            end
            vim.cmd('python3 format_line()')
        end
    end, {})
end

return M
