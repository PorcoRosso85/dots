local lspconfig = require('lspconfig')
lspconfig.jedi_language_server.setup{}

if vim.fn.exepath('jedi_python') ~= '' then
  local lspconfig = require("lspconfig")
  local util = require("utils._set_lsp")

  lspconfig.jedi_language_server.setup({
    cmd = { "jedi_python" },
    filetypes = { "python" },
--    root_dir = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json"),
    setting = {
      ["jedi_python"] = {
      }
    },
  })
else
  print('github.com/pappasam/jedi-language-server')
end
