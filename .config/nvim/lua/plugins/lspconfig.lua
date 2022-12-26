local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').jedi_language_server.setup {
  capabilities = capabilities
}

require('lspconfig').tsserver.setup {
}


-- https://zenn.dev/botamotch/articles/21073d78bc68bf
--
-- reference highlight
local utils = require("utils._set_mappings")
utils.nnoremap("<S-k>", "<cmd>lua vim.lsp.buf.hover()<cr>")
--utils.nnoremap("", "<cmd><cr>")
--utils.nnoremap("", "<cmd><cr>")
--utils.nnoremap("", "<cmd><cr>")

--return function()
--  local utils = require("utils._set_config")
--  local conf_lsp = utils.conf_lsp
--
--  vim.diagnostic.config({
--    virtual_text = false,
--  })
--  vim.o.updatetime = 250
--  vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
--
--  -- mapping
--  require("which-key").register({
--    name = "lsp",
--    ["<space>e"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Show diagnostics in a floating window" },
--    ["[d"] = {
--      "<cmd>lua vim.diagnostic.goto_prev()<CR>",
--      "Move to the previous diagnostic in the current buffer",
--    },
--    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Move to the next diagnostic" },
--    ["<space>q"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Add buffer diagnostics to the location list" },
--  })
--
--  local servers = {
--	  --"denols",
--	  --"gopls",
--    --"jsonls",
--		--"rust_analyzer",
--    --"sumneko_lua",
--	  --"tflint",
--	  --"tsserver",
--	  --"yamlls",
--	  --"zls",
--    "jedi_python",
--  }
--
--  for _, lsp in ipairs(servers) do
--    conf_lsp(lsp)
--  end
--end
