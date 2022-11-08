local utils = require("utils._set_mappings")
utils.nnoremap("<leader>ff", "<cmd>lcd %:p:h|lua require('fzf-lua').files()<cr>") 
utils.nnoremap("<leader>fo", "<cmd>lua require('fzf-lua').oldfiles()<cr>") 
utils.nnoremap("<leader>fb", "<cmd>lua require('fzf-lua').buffers()<cr>") 
--utils.nnoremap("<leader>fl", "<cmd>lua require('fzf-lua').loclist()<cr>") 
utils.nnoremap("<leader>fp1", "<cmd>lcd %:p:h|lcd ..|lua require('fzf-lua').files()<cr>") 
utils.nnoremap("<leader>fp2", "<cmd>lcd %:p:h|lcd ..|cd ..|lua require('fzf-lua').files()<cr>") 

utils.nnoremap("<leader>cd", "<cmd>lcd %:p:h|pwd<cr>")
utils.nnoremap("<leader>cde", "<cmd>lcd %:p:h|pwd|e .<cr>")
utils.nnoremap("<leader>cdp", "<cmd>lcd %:p:h|lcd ..|pwd<cr>")
utils.nnoremap("<leader>cdpe", "<cmd>lcd %:p:h|lcd ..|pwd|e .<cr>")

-- shortcut destinations
utils.nnoremap("<leader>fnvim", "<cmd>lua require('fzf-lua').files({ cwd='~/.config/nvim/' })<cr>")
utils.nnoremap("<leader>fhome", "<cmd>lua require('fzf-lua').files({ cwd='~/projects/' })<cr>")

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
--      ["<leader>ff"] = { "<cmd>lua require('fzf-lua').files()<cr>", "fzf find files" }
    }

-- require'fzf-lua'.fzf_exec("rg --files", {
--   actions = {
--     ["<leader>ff"] = { "<cmd>lua require('fzf-lua').files()<cr>", "fzf find files" }
--   }
-- })

  }
end

-- return function()
--   local ok, telescope = pcall(require, "telescope")
-- 
--   if not ok then
--     return
--   end
-- 
--   telescope.setup {
--     defaults = {
--       mappings = {
--         i = {
--           ["<C-h>"] = "which_key"
--         }
--       },
--       file_ignore_patterns = {
--         "node_modules/*",
--       }
--     },
-- }
-- end
--  require("which-key").register({
--    ["fzf"] = { "<cmd>lua require('fzf-lua').files()<cr>", "fzf find files" },
--  }, { 
--    prefix = "<leader>"
--  })
--  require("which-key").register{
--    name = "fzflua",
--    ["<leader>ff"] = { "<cmd>lua require('fzf-lua').files()<cr>", "fzf find files" }
--    ['<leader>ff'] = { "<cmd>lua require('telescope.builtin').find_files({find_command = " .. find_command .. " })<cr>",
