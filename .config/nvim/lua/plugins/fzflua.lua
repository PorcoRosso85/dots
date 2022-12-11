-- https://github.com/ibhagwan/fzf-lua
local utils = require("utils._set_mappings")
utils.nnoremap("<leader>ff", "<cmd>lua require('fzf-lua').files()<cr>") 
--utils.nnoremap("<leader>ffc", "<cmd>lcd %:p:h|lua require('fzf-lua').files()<cr>") 
utils.nnoremap("<leader>fo", "<cmd>lua require('fzf-lua').oldfiles()<cr>") 
utils.nnoremap("<leader>fb", "<cmd>lua require('fzf-lua').buffers()<cr>") 
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
