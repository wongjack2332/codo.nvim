local codo = require("codo.get_todos")

local split_to_lines = function(s)
    local lines = {}
    for line in s:gmatch("[^\n]+") do
        table.insert(lines, line)
    end
    return lines
end

local todos = codo.get_comments(vim.fn.getcwd())
local todos_lines = split_to_lines(todos)

local add_buf = function()
    local name = "Todos"
    vim.cmd(string.format("vert new %s", name))
    return name
end

local add_lines_to_buf = function(buf, lines)
    vim.api.nvim_buf_set_lines(vim.fn.bufnr(buf), 0, -1, true, lines)
end

vim.api.nvim_create_user_command("Codo", function()
    local name = add_buf()
    add_lines_to_buf(name, todos_lines)
end, {})
