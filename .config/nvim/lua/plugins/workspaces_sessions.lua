require("workspaces").setup({
  hooks = {
    open = {
      --lua command like "Telescope find_files"
      function() require("sessions").load(nil, { silent = true }) end,
    }
  }
})


require("sessions").setup({
    events = { "WinEnter", "VimLeavePre" },
    session_filepath = "~/.config/nvim/sessions",
})
