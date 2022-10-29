local utils = require("utils._set_mappings")
utils.nnoremap("<leader>ff", "<cmd>lua require('fzf-lua').files()<cr>") 

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
