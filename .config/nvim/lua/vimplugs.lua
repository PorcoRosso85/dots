local utils = require("utils._set_config")
local conf = utils.conf
local Plug = require("utils._set_vimplug")

Plug.begin("~/.config/nvim/plugged")

Plug("olimorris/onedarkpro.nvim")

Plug("rmagatti/auto-session")

Plug("folke/which-key.nvim")

Plug("ibhagwan/fzf-lua", { config = function() conf("fzflua") end })

Plug("nvim-lualine/lualine.nvim", { config = function() conf("lualine") end })
  Plug("kyazdani42/nvim-web-devicons")

Plug("williamboman/mason.nvim", { config = function() conf("mason") end })
  Plug("williamboman/mason-lspconfig.nvim", { config = function() conf("mason") end })
Plug("neovim/nvim-lspconfig")
  Plug("hrsh7th/cmp-nvim-lsp")
  Plug("RRethy/vim-illuminate")

Plug('hrsh7th/nvim-cmp', { config = function() conf("cmp") end })
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'

-- For vsnip users.
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

-- For luasnip users.
 Plug 'L3MON4D3/LuaSnip'
 Plug 'saadparwaiz1/cmp_luasnip'

Plug.ends()

-- vim.cmd("coloerscheme onedarkpro")
