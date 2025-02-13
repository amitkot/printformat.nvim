local M = {}

local function has_python3()
    if vim.fn.has('python3') == 0 then
        vim.notify("Python3 provider not found. Please run :checkhealth provider", vim.log.levels.ERROR)
        return false
    end
    return true
end

local function load_python_file()
    -- Get the directory where this Lua file is located
    local lua_file_path = debug.getinfo(1, 'S').source:sub(2)  -- removes '@' from start
    local plugin_root = vim.fn.fnamemodify(lua_file_path, ':h:h:h')  -- go up three dirs
    local python_file = plugin_root .. '/pythonx/printformat.py'
    
    if vim.fn.filereadable(python_file) == 0 then
        vim.notify("Python file not found at: " .. python_file, vim.log.levels.ERROR)
        return false
    end
    
    vim.cmd('py3file ' .. python_file)
    return true
end

local python_loaded = false

function M.setup(opts)
    opts = opts or {}
    
    -- Create the command
    vim.api.nvim_create_user_command('PrintFormat', function()
        if has_python3() then
            if not python_loaded then
                python_loaded = load_python_file()
            end
            if python_loaded then
                vim.cmd('python3 format_line()')
            end
        end
    end, {})
end

return M
