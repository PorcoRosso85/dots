local utils = require("utils._set_config")
local conf = utils.conf
local Plug = require("utils._set_vimplug")

Plug.begin(vim.fn.stdpath("data").. "/plugged")

-- setting
--Plug("olimorris/onedarkpro.nvim")
Plug("cocopon/iceberg.vim")

Plug("michaelb/sniprun", { config = function() conf("sniprun") end })
--Plug("rmagatti/auto-session", { config = function() conf("auto_session") end })
--Plug("natecraddock/workspaces.nvim", { config = function() conf("workspaces_sessions") end })
--Plug("natecraddock/sessions.nvim", { config = function() conf("workspaces_sessions") end })
--Plug("folke/persistence.nvim", { config = function() conf("persistence") end })

Plug("nvim-lua/plenary.nvim")
Plug("nvim-lua/popup.nvim")
Plug("folke/which-key.nvim")

--Plug("nvim-lualine/lualine.nvim", { config = function() conf("lualine") end })
--  Plug("kyazdani42/nvim-web-devicons")

Plug("beauwilliams/focus.nvim", { config = function() conf("focus") end })
Plug("akinsho/toggleterm.nvim", { config = function() conf("toggleterm") end })

Plug("ibhagwan/fzf-lua", { config = function() conf("fzflua") end })
Plug("nvim-telescope/telescope.nvim", { config = function() conf("telescope") end })
  Plug("nvim-telescope/telescope-media-files.nvim", { config = function() conf("telescope") end })



Plug("mattn/emmet-vim", { config = function() conf("emmet") end })
Plug("terrortylor/nvim-comment", { config = function() conf("nvim_comment") end })
--Plug("jiangmiao/auto-pairs")

Plug("hrsh7th/nvim-cmp", { config = function() conf("cmp") end })
  Plug "hrsh7th/cmp-nvim-lsp"
  Plug "hrsh7th/cmp-buffer"
  Plug "hrsh7th/cmp-path"
  Plug "hrsh7th/cmp-cmdline"

Plug("tzachar/cmp-tabnine", {
  --["do"] = "./install.sh", 
  config = function() conf("tabnine") end
})

-- For vsnip users.
Plug "hrsh7th/cmp-vsnip"
Plug "hrsh7th/vim-vsnip"
-- For luasnip users.
Plug "L3MON4D3/LuaSnip"
Plug "saadparwaiz1/cmp_luasnip"

-- language server
--Plug("williamboman/mason.nvim", { config = function() conf("mason") end })
--  Plug("williamboman/mason-lspconfig.nvim", { config = function() conf("mason") end })
Plug("neovim/nvim-lspconfig", { config = function() conf("lspconfig") end })
  Plug("hrsh7th/cmp-nvim-lsp")
  --Plug("RRethy/vim-illuminate")
  Plug("onsails/lspkind.nvim", { config = function() conf("lspkind") end })

Plug("jose-elias-alvarez/null-ls.nvim", { config = function() conf("nullls") end })

-- If use copilot
-- Plug "zbirenbaum/copilot.lua"
--   Plug "zbirenbaum/copilot-cmp"

--Plug "mechatroner/rainbow_csv"
Plug("chrisbra/csv.vim", { config = function() conf("csvvim") end })

-- Japanese
--Plug("vim-scripts/fcitx.vim")
--Plug("vim-skk/eskk.vim", { config = function() conf("eskk") end })
Plug("vim-denops/denops.vim")
  Plug("vim-skk/skkeleton", { config = function() conf("skkeleton") end })
  Plug("rinx/cmp-skkeleton")
  Plug("delphinus/skkeleton_indicator.nvim", { config = function() conf("skkeleton") end })

Plug.ends()

-- vim.cmd("colorscheme onedarkpro")
vim.cmd("colorscheme iceberg")
vim.cmd("hi link UnfocusedWindow Normal")
vim.cmd("hi link FocusedWindow Normal")
