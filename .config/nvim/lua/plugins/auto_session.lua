-- local utils = require("")

require("auto-session").setup {
  log_level = "error",
  auto_session_enable = true,
  auto_session_root_dir = vim.fn.stdpath('data').."/auto_session/",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
}
