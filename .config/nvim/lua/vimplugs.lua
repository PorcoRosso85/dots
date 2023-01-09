local utils = require("utils._set_config")
local conf = utils.conf
local Plug = require("utils._set_vimplug")

Plug.begin(vim.fn.stdpath("data").. "/plugged")

Plug("michaelb/sniprun", { config = function() conf("sniprun") end })
Plug("andrewferrier/debugprint.nvim", { config = function() conf("debugprint") end })
-- Plug("tpope/vim-dispatch")
-- Plug("rmagatti/auto-session", { config = function() conf("auto_session") end })
-- Plug("natecraddock/workspaces.nvim", { config = function() conf("workspaces_sessions") end })
-- Plug("natecraddock/sessions.nvim", { config = function() conf("workspaces_sessions") end })
-- Plug("folke/persistence.nvim", { config = function() conf("persistence") end })

Plug("nvim-lua/plenary.nvim")
-- Plug("nvim-lua/popup.nvim")
-- Plug("folke/which-key.nvim") -- containd by fzflua
-- Plug("mrjones2014/legendary.nvim", { config = function() conf("legendary") end }) -- contained by fzflua
--   Plug("stevearc/dressing.nvim", { config = function() conf("dressing") end })

--Plug("nvim-lualine/lualine.nvim", { config = function() conf("lualine") end })
Plug("kyazdani42/nvim-web-devicons", { config = function() conf("devicons") end })

Plug("beauwilliams/focus.nvim", { config = function() conf("focus") end })
Plug("akinsho/toggleterm.nvim", { config = function() conf("toggleterm") end })

Plug("ibhagwan/fzf-lua", { config = function() conf("fzflua") end })
Plug("nvim-telescope/telescope.nvim", { config = function() conf("telescope") end })
--   Plug("nvim-telescope/telescope-media-files.nvim", { config = function() conf("telescope") end })

Plug("mfussenegger/nvim-dap", { config = function() conf("dap") end })
  Plug("theHamsta/nvim-dap-virtual-text", { config = function() conf("dap_virtual_text") end })
  Plug("rcarriga/nvim-dap-ui", { config = function() conf("dap_ui") end })
  Plug("mfussenegger/nvim-dap-python", { config = function() conf("dap_python") end })
Plug("vim-test/vim-test", { config = function() conf("vimtest") end })

--Plug("mattn/emmet-vim", { config = function() conf("emmet") end })
Plug("terrortylor/nvim-comment", { config = function() conf("nvim_comment") end })
--Plug("jiangmiao/auto-pairs")

Plug("hrsh7th/nvim-cmp", { config = function() conf("cmp") end })
  Plug "hrsh7th/cmp-nvim-lsp"
  Plug "hrsh7th/cmp-buffer"
  Plug "hrsh7th/cmp-path"
  Plug "hrsh7th/cmp-cmdline"
  Plug("rinx/cmp-skkeleton")
  Plug("zbirenbaum/copilot-cmp", { config = function() conf("cmp") end })
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
Plug("williamboman/mason.nvim", { config = function() conf("mason") end })
  Plug("williamboman/mason-lspconfig.nvim", { config = function() conf("mason") end })
Plug("neovim/nvim-lspconfig", { config = function() conf("lspconfig") end })
  Plug("onsails/lspkind.nvim", { config = function() conf("lspkind") end })
  -- Plug("glepnir/lspsaga.nvim", { config = function() conf("lspsaga") end })

Plug("jose-elias-alvarez/null-ls.nvim", { config = function() conf("nullls") end })
Plug("zbirenbaum/copilot.lua", { config = function() conf("copilot") end })
Plug("MunifTanjim/nui.nvim") --, { config = function() conf("nui") end })
  Plug("jackMort/ChatGPT.nvim", { config = function() conf("chatgpt") end })


--Plug "mechatroner/rainbow_csv"
Plug("chrisbra/csv.vim", { config = function() conf("csvvim") end })

-- Japanese
Plug("vim-denops/denops.vim")
Plug("vim-skk/skkeleton", { config = function() conf("skkeleton") end })
  Plug("delphinus/skkeleton_indicator.nvim", { config = function() conf("skkeleton") end })
  
-- setting
-- Plug("olimorris/onedarkpro.nvim")
-- Plug("cocopon/iceberg.vim")
Plug("folke/tokyonight.nvim")
Plug("nvim-treesitter/nvim-treesitter", { config = function() conf("treesitter") end })


Plug.ends()
--vim.cmd("colorscheme onedarkpro")
vim.cmd("colorscheme tokyonight-night")
vim.cmd("hi link UnfocusedWindow Normal")
vim.cmd("hi link FocusedWindow Normal")

-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

-- Reference highlight
-- vim.cmd("set updatetime=500")
-- vim.cmd("highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040")
-- vim.cmd("highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040")
-- vim.cmd("highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040")
-- vim.cmd("augroup lsp_document_highlight")
-- vim.cmd("  autocmd!")
-- vim.cmd("  autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()")
-- vim.cmd("  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()")
-- vim.cmd("augroup END")
local function on_attach(client, bufnr)
    -- Find the clients capabilities
    local cap = client.resolved_capabilities

    -- Only highlight if compatible with the language
    if cap.document_highlight then
        vim.cmd('augroup LspHighlight')
        vim.cmd('autocmd!')
        vim.cmd('autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
        vim.cmd('autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()')
        vim.cmd('augroup END')
    end
end
