local utils = require("utils._set_mappings")

-- disable cross key
utils.nnoremap("<Up>", "<nop>")
utils.nnoremap("<Down>", "<nop>")
utils.nnoremap("<Left>", "<nop>")
utils.nnoremap("<Right>", "<nop>")
utils.vnoremap("<Up>", "<nop>")
utils.vnoremap("<Down>", "<nop>")
utils.vnoremap("<Left>", "<nop>")
utils.vnoremap("<Right>", "<nop>")


-- require('which-key').register {
--   name = 'telescope',
--   ['<leader>ff'] = { "<cmd>lua require('telescope.builtin').find_files({find_command = " .. find_command .. " })<cr>",
--     'telescope find file' },


local whichkey = require("which-key")

whichkey.setup()

-- :h ins-completion
whichkey.register({
  ["<C-l>"] = 'Whole lines',
  ["<C-n>"] = 'keywords in the current file',
  ["<C-k>"] = 'keywords in dictionary',
  ["<C-t>"] = 'keywords in thesaurus',
  ["<C-i>"] = 'keywords in the current and included files',
  ["<C-]>"] = 'tags',
  ["<C-f>"] = 'file names',
  ["<C-d>"] = 'definitions or macros',
  ["<C-v>"] = 'Vim command-line',
  ["<C-u>"] = 'User defined completion',
  ["<C-o>"] = 'omni completion',
  ["<C-s>"] = 'Spelling suggestions',
  ["<C-z>"] = 'stop completion',
}, {
  mode = "i",
  prefix = "<C-x>",
})

-- easy snipet
whichkey.register({
--  ["init"] = { "<cmd>vim.cmd('e ~/.config/nvim/')<cr>" }
},
{ prefix = "<leader>" }
)
