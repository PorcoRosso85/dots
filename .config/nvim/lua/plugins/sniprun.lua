local utils = require("utils._set_mappings") 

utils.nnoremap("<leader>rr", "<cmd>lua require'sniprun'.run('n')<cr>")
utils.vnoremap("<leader>rr", "<cmd>lua require'sniprun'.run('v')<cr>")

require("sniprun").setup({
  selected_interpreters = {
    "python3_original",
  }
})


