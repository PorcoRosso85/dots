require("toggleterm").setup()

local utils = require("utils._set_mappings")
utils.nnoremap("<leader>ttv", "<cmd>ToggleTerm size=66 direction=vertical<cr>") 
utils.nnoremap("<leader>ttf", "<cmd>ToggleTerm size=66 direction=float<cr>") 
