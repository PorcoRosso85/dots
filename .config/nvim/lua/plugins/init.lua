local utils = require("utils._set_config")
local conf = utils.conf

vim.cmd [[packadd packer.nvim]]

require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use("nvim-lua/plenary.nvim")

    use("olimorris/onedarkpro.nvim")
  end,
)

vim.cmd("colorscheme onedarkpro")
