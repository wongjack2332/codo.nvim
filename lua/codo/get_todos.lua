return {
    get_comments = function(cwd)
        -- local todos_path = vim.getcwd() .. "/todos.txt"
        local todos_path = cwd .. "/todos.txt"

        local string = require("string")

        COMMAND = string.format("rg '#.?TODO:' -g  %s %s > todos.txt", "!" .. todos_path, cwd)

        os.execute(COMMAND)

        local file = io.open(todos_path, "r")
        if file == nil then
            print(vim.fn.printf("File not found"))
            file = io.open(todos_path, "w")
            file:close()
            file = io.open(todos_path, "r")
        end
        local contents

        if file ~= nil then
            contents = file:read("*all")

            file:close()
            return contents
        end
    end,
}
