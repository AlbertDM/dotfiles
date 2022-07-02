-- ALBERTDM CONFIGS for NeoVIM > 0.5
-- load your globals, autocmds here or anything .__.
--      vim.api.nvim_set_keymap('mode', 'shortcut', 'command', 'options')

-- require "custom.adm_mappings"
-- pcall(require, "adm_mappings.lua")


-- Imports the plugin's additional Lua modules.
-- local mappings = 
require("advim_cfg.advim_mappings")

-- Creates an object for the module. All of the module's
-- functions are associated with this object, which is
-- returned when the module is called with `require`.

local M = {}
-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   -- theme = "gruvchad",
}




-- Marks a todo task completed. Lists open
-- tasks, and prompts the user to select
-- one for completing.

-- function M.complete_todo()
--     local db = sqlite.open("todo.db")
--
--     local todo_completed = -1
--     local todo_selected = -1
--     repeat
--         local db_results = db:exec("SELECT * FROM todo_list WHERE completed == 'No';")
--         for i, item in ipairs(db_results[2]) do
--             print(tostring(db_results[1][i]) .. ': ' .. item)
--         end
--
--         todo_selected = tonumber(vim.fn.input("Enter an ID number for a task listed above: "))
--
--         for _, id in ipairs(db_results[1]) do
--             if (id == todo_selected) then todo_completed = todo_selected end
--         end
--
--         print("")
--     until todo_completed >= 0
--
--     db:exec("UPDATE todo_list SET completed = 'Yes' WHERE id = " .. todo_completed .. " AND completed = 'No';")
--     db:close()
-- end



-- Routes calls made to this module to functions in the
-- plugin's other modules.
-- M.fetch_todos = fetch.fetch_todos
-- M.insert_todo = update.insert_todo
-- M.complete_todo = update.complete_todo

return M

