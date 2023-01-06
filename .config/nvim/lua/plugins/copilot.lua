local utils = require("utils._set_mappings")

require('copilot').setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<M-CR>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = true,
    markdown = true,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false, -- e.g. .dots, .env
    terraform = true,
    -- ["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
  -- server_opts_overrides = {
  --   trace = "verbose",
  --   settings = {
  --     advanced = {
  --       listCount = 10, -- #completions for panel
  --       inlineSuggestCount = 3, -- #completions for getCompletions
  --     }
  --   },
  -- }
})


utils.nnoremap("<C-j>copilotpanelaccept", '<cmd>lua require("copilot.panel").accept()<cr>')
vim.api.nvim_create_user_command("CopilotPanelAccept", 'lua require("copilot.panel").accept()', {})
-- utils.nnoremap("<C-j>copilotpanelnext", '<cmd>lua require("copilot.panel").jump_next()<cr>')
-- utils.nnoremap("<C-j>copilotpanelprev", '<cmd>lua require("copilot.panel").jump_prev()<cr>')
utils.nnoremap("<C-j>copilotpanelopen", '<cmd>lua require("copilot.panel").open()<cr>')
utils.nnoremap("<C-j>copilotpanelrefresh", '<cmd>lua require("copilot.panel").refresh()<cr>')

utils.nnoremap("<C-j>copilotsuggestionvisible", '<cmd>lua require("copilot.suggestion").is_visible()<cr>')
-- utils.nnoremap("<C-j>copilotsuggestionaccept", '<cmd>lua require("copilot.suggestion").accept()<cr>')
-- utils.nnoremap("<C-j>copilotsuggestionnext", '<cmd>lua require("copilot.suggestion").next()<cr>')
-- utils.nnoremap("<C-j>copilotsuggestionprev", '<cmd>lua require("copilot.suggestion").prev()<cr>')
-- utils.nnoremap("<C-j>copilotsuggestiondismiss", '<cmd>lua require("copilot.suggestion").dismiss()<cr>')
utils.nnoremap("<C-j>copilotsuggestiontoggleauto", '<cmd>lua require("copilot.suggestion").toggle_auto_trigger()<cr>')
