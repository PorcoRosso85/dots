local utils = require("utils._set_config")
local conf = utils.conf
local plug = require("utils._set_vimplug")

plug.begin("~/.config/nvim/plugged")

plug("olimorris/onedarkpro.nvim")

plug("rmagatti/auto-session")

plug("folke/which-key.nvim")

plug("ibhagwan/fzf-lua", { config = function() conf("fzflua") end })

plug("nvim-lualine/lualine.nvim")

plug("neovim/nvim-lspconfig")
  plug("hrsh7th/cmp-nvim-lsp")
  plug("RRethy/vim-illuminate")


plug.ends()

-- vim.cmd("coloerscheme onedarkpro")
