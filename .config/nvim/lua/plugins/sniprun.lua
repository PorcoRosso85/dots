local utils = require("utils._set_mappings") 

utils.nnoremap("<C-j>srl", "<cmd>lua require'sniprun'.run('n')<cr>")
utils.vnoremap("<C-j>srb", "<cmd>lua require'sniprun'.run('v')<cr>")
utils.nnoremap("<C-j>srlive", "<cmd>lua require'sniprun.live_mode'.toggle()<cr>")

require("sniprun").setup({
  selected_interpreters = {
    "python3_original",
    "lua_nvim",
  },
  -- repl_enable = { "python3_original" },
  -- repl_disable = { "lua_nvim" },
  display = {
    -- "Classic",                    --# display results in the command-line  area
    -- "VirtualTextOk",              --# display ok results as virtual text (multiline is shortened)

    -- "VirtualText",             --# display results as virtual text
    "TempFloatingWindow",      --# display results in a floating window
    -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText[Ok/Err]
    -- "Terminal",                --# display results in a vertical split
    -- "TerminalWithCode",        --# display results and code history in a vertical split
    -- "NvimNotify",              --# display with the nvim-notify plugin
    -- "Api"                      --# return output to a programming interface
  },
  live_display = { "VirtualText" },
  -- snipruncolors = {
  --   SniprunVirtualTextOk   =  {bg="#66eeff",fg="#000000",ctermbg="Cyan",cterfg="Black"},
  --   SniprunFloatingWinOk   =  {fg="#66eeff",ctermfg="Cyan"},
  --   SniprunVirtualTextErr  =  {bg="#881515",fg="#000000",ctermbg="DarkRed",cterfg="Black"},
  --   SniprunFloatingWinErr  =  {fg="#881515",ctermfg="DarkRed"},
  -- },
  live_mode_toggle = 'enable'
})


