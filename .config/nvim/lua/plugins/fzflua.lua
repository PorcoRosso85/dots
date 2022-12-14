-- https://github.com/ibhagwan/fzf-lua
local utils = require("utils._set_mappings")
utils.nnoremap("<C-j><C-f>", "<cmd>lua require('fzf-lua').builtin()<cr>") 
vim.api.nvim_create_user_command('FFZ',"lua require('fzf-lua').builtin()", {}) 
utils.nnoremap("<C-j><C-f>c", "<cmd>lua require('fzf-lua').builtin( { query = 'command' } )<cr>") 
utils.nnoremap("<C-j><C-f><C-k>", "<cmd>lua require('fzf-lua').builtin( { query = 'keymap' } )<cr>") 
-- vim.api.nvim_add_user_command(
--     'Upper',
--     function(opts)
--         print(string.upper(opts.args))
--     end,
--     { nargs = 1 }
-- )
-- utils.nnoremap("<leader>ffc", "<cmd>lua require('fzf-lua').commands()<cr>") 
-- utils.nnoremap("<leader>ffk", "<cmd>lua require('fzf-lua').keymaps()<cr>") 
-- utils.nnoremap("<leader>ffm", "<cmd>lua require('fzf-lua').menus()<cr>") 
-- utils.nnoremap("<leader>ffp", "<cmd>lua require('fzf-lua').packadd()<cr>") 

utils.nnoremap("<leader>fff", "<cmd>lua require('fzf-lua').files()<cr>") 
--utils.nnoremap("<leader>ffc", "<cmd>lcd %:p:h|lua require('fzf-lua').files()<cr>") 
utils.nnoremap("<leader>ffo", "<cmd>lua require('fzf-lua').oldfiles()<cr>") 
utils.nnoremap("<leader>ffb", "<cmd>lua require('fzf-lua').buffers()<cr>") 
--utils.nnoremap("<leader>fl", "<cmd>lua require('fzf-lua').loclist()<cr>") 
utils.nnoremap("<leader>fp", "<cmd>lua require('fzf-lua').files({ cmd='find ..' })<cr>") 
utils.nnoremap("<leader>fpp", "<cmd>lua require('fzf-lua').files({ cmd='find ../..' })<cr>") 
--utils.nnoremap("<leader>fd", "<cmd>:lua require('fzf-lua').files({ prompt='LS> ', cmd = 'ls', cwd='~/project' })<cr>")

utils.nnoremap("<leader>ftp", "<cmd>topleft vsp|FzfLua files cwd=..<cr>") 
utils.nnoremap("<leader>ftpp", "<cmd>topleft vsp|FzfLua files cwd=../..<cr>") 
utils.nnoremap("<leader>ftppp", "<cmd>topleft vsp|FzfLua files cwd=../../..<cr>") 

-- shortcut destinations
utils.nnoremap("<leader>fzc", "<cmd>lua require('fzf-lua').files({ cwd='~/.config/' })<cr>")
utils.nnoremap("<leader>fzm", "<cmd>lua require('fzf-lua').files({ cwd='/mnt/c/Users/admin.DESKTOP-1PF4AT3/AppData/Local/Packages/' })<cr>")
utils.nnoremap("<leader>fzd", "<cmd>lcd ~|lua require('fzf-lua').files({ cmd = 'find . -maxdepth 3' })<cr>")

return function()
  local ok, fzflua = pcall(require, "fzf-lua")

  if not ok then
    return
  end

  fzflua.setup {
    winopts = {
      h1 = { border = "FloatBorder", }
    },
    mapping = {
    }
  }
end
