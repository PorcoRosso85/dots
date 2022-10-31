require("toggleterm").setup()

local utils = require("utils._set_mappings")
utils.nnoremap("<leader>tt", "<cmd>ToggleTerm<cr>") 
