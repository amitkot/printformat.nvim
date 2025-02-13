local M = {}

function M.setup(opts)
    opts = opts or {}
    
    -- Create the command
    vim.api.nvim_create_user_command('PrintFormat', function()
        vim.cmd('python3 printformat.format_line()')
    end, {})
end

return M
