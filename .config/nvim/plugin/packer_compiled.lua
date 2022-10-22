-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/root/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/root/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/root/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/root/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/root/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { "\27LJ\2\nN\0\0\4\0\6\0\a6\0\0\0009\0\1\0006\2\2\0009\2\3\0029\2\4\2'\3\5\0D\0\3\0\f TODO: \18commentstring\abo\bvim\vformat\vstringπ\5\1\0\23\0\24\2Q6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0IÄ9\2\3\0019\3\4\0019\4\5\0016\5\1\0'\a\6\0B\5\2\0029\5\a\0056\6\1\0'\b\6\0B\6\2\0029\6\b\0063\a\t\0009\b\n\1'\n\v\0004\v\3\0\18\f\2\0'\14\f\0\18\15\3\0\18\17\a\0004\18\3\0\18\19\4\0)\21\0\0B\19\2\0?\19\0\0B\15\3\0A\f\1\0?\f\0\0B\b\3\0019\b\n\1'\n\r\0004\v\3\0\18\f\2\0'\14\14\0\18\15\6\0'\17\15\0004\18\3\0\18\19\4\0)\21\0\0B\19\2\0?\19\0\0B\15\3\0A\f\1\0?\f\0\0B\b\3\0019\b\n\1'\n\16\0004\v\3\0\18\f\2\0'\14\17\0\18\15\5\0'\17\18\0004\18\3\0\18\19\4\0)\21\1\0'\22\19\0B\19\3\2>\19\1\18\18\19\4\0)\21\2\0'\22\20\0B\19\3\0?\19\1\0005\19\21\0B\15\4\0A\f\1\0?\f\0\0B\b\3\0016\b\1\0'\n\22\0B\b\2\0029\b\23\bB\b\1\1K\0\1\0K\0\1\0\tload luasnip.loaders.from_vscode\1\0\1\15delimiters\a[]\ttext\14func nameÅ\1/** @jsx h */\nimport { h } from \"preact\";\n\nexport default function []() {\n  return (\n    <div>\n      []\n    </div>\n  );\n}\n  \afr\20typescriptreact$  if err != nil {\n    <>\n  }\n  \bife\ago\atd\ball\17add_snippets\0\tfmta\bfmt\23luasnip.extras.fmt\16insert_node\18function_node\fsnippet\fluasnip\frequire\npcall\3ÄÄ¿ô\4\5ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    after_files = { "/root/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "/root/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-git"] = {
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/cmp-git",
    url = "https://github.com/petertriho/cmp-git"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/root/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    after_files = { "/root/.local/share/nvim/site/pack/packer/opt/cmp-spell/after/plugin/cmp-spell.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-vsnip"] = {
    after_files = { "/root/.local/share/nvim/site/pack/packer/opt/cmp-vsnip/after/plugin/cmp_vsnip.vim" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  cmp_luasnip = {
    after_files = { "/root/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["nvim-cmp"] = {
    after = { "cmp-spell", "cmp_luasnip", "cmp-buffer", "cmp-cmdline", "cmp-git", "cmp-vsnip", "cmp-path" },
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire\v\0\2\2\0\0\0\1L\1\2\0¿\6\1\0\v\0-\0P6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\24\0005\5\a\0009\6\4\0009\b\4\0009\b\5\b)\n¸ˇB\b\2\0025\t\6\0B\6\3\2=\6\b\0059\6\4\0009\b\4\0009\b\5\b)\n\4\0B\b\2\0025\t\t\0B\6\3\2=\6\n\0059\6\4\0009\6\v\6B\6\1\2=\6\f\0059\6\4\0009\6\r\0065\b\14\0B\6\2\2=\6\15\0059\6\4\0009\6\16\0065\b\18\0009\t\17\0=\t\19\bB\6\2\2=\6\20\0059\6\4\0009\6\21\0065\b\22\0009\t\17\0=\t\19\bB\6\2\2=\6\23\5=\5\4\0049\5\25\0009\5\26\0054\a\5\0005\b\27\0>\b\1\a5\b\28\0>\b\2\a5\b\29\0>\b\3\a5\b\30\0>\b\4\aB\5\2\2=\5\26\0045\5 \0003\6\31\0=\6!\5=\5\"\0045\5'\0009\6#\0015\b$\0003\t%\0=\t&\bB\6\2\2=\6(\5=\5)\4B\2\2\0016\2*\0009\2+\2'\4,\0B\2\2\1K\0\1\0ê\1    autocmd FileType TelescopePrompt,NvimTree,netrw lua require'cmp'setup.buffer {\n    \\   completion = { autocomplete = false }\n    \\ }\n  \bcmd\bvim\15formatting\vformat\1\0\0\vbefore\0\1\0\2\14with_text\2\rmaxwidth\0032\15cmp_format\fsnippet\vexpand\1\0\0\0\1\0\1\tname\nvsnip\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\1\0\0\v<DOWN>\1\0\0\21select_next_item\t<UP>\rbehavior\1\0\0\19SelectBehavior\21select_prev_item\t<CR>\1\0\1\vselect\2\fconfirm\n<C-q>\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-d>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\nsetup\flspkind\bcmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\næ\2\0\0\v\0\r\0\0286\0\0\0'\2\1\0B\0\2\0029\1\2\0006\2\3\0009\2\4\0029\2\5\0025\4\6\0B\2\2\0016\2\3\0009\2\a\2)\3˙\0=\3\b\0026\2\3\0009\2\t\2'\4\n\0B\2\2\0015\2\v\0006\3\f\0\18\5\2\0B\3\2\4X\6\3Ä\18\b\1\0\18\n\a\0B\b\2\1E\6\3\3R\6˚K\0\1\0\vipairs\1\2\0\0\18rust_analyzerWautocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})\bcmd\15updatetime\6o\1\0\1\17virtual_text\1\vconfig\15diagnostic\bvim\rconf_lsp\22utils._set_config\frequire\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["onedarkpro.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/onedarkpro.nvim",
    url = "https://github.com/olimorris/onedarkpro.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\23hover_with_actions\1\nsetup\15rust-tools\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["rust.vim"] = {
    config = { "\27LJ\2\ny\0\0\3\0\5\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0)\1\1\0=\1\4\0K\0\1\0\21rustfmt_autosave\6g7    syntax enable\n    filetype plugin indent on\n  \bcmd\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n\28\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\2\0\0\r--hidden‡\t\1\0\n\0,\0E6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0=Ä9\2\3\0015\4\v\0005\5\a\0005\6\5\0005\a\4\0=\a\6\6=\6\b\0055\6\t\0=\6\n\5=\5\f\0045\5\14\0005\6\r\0=\6\15\0055\6\17\0003\a\16\0=\a\18\6=\6\19\5=\5\20\4B\2\2\1'\2\21\0006\3\1\0'\5\22\0B\3\2\0029\3\23\0035\5\24\0005\6\27\0'\a\25\0\18\b\2\0'\t\26\0&\a\t\a>\a\1\6=\6\28\0055\6\30\0'\a\29\0\18\b\2\0'\t\26\0&\a\t\a>\a\1\6=\6\31\0055\6!\0'\a \0\18\b\2\0'\t\26\0&\a\t\a>\a\1\6=\6\"\0055\6#\0=\6$\0055\6&\0'\a%\0\18\b\2\0'\t\26\0&\a\t\a>\a\1\6=\6'\0055\6(\0=\6)\0055\6*\0=\6+\5B\3\2\1K\0\1\0K\0\1\0\15<leader>fk\1\3\0\0008<cmd>lua require('telescope.builtin').keymaps()<cr>\23telescope key maps\15<leader>fc\1\3\0\0009<cmd>lua require('telescope.builtin').commands()<cr>\23telescope commands\15<leader>fo\1\3\0\0\0\24telescope old filesD<cmd>lua require('telescope.builtin').oldfiles({find_command = \15<leader>fh\1\3\0\0:<cmd>lua require('telescope.builtin').help_tags()<cr>\24telescope help tags\15<leader>fb\1\3\0\0\0\22telescope buffersC<cmd>lua require('telescope.builtin').buffers({find_command = \15<leader>fg\1\3\0\0\0\24telescope live grepE<cmd>lua require('telescope.builtin').live_grep({find_command = \15<leader>ff\1\3\0\0\0\24telescope find file\f })<cr>F<cmd>lua require('telescope.builtin').find_files({find_command = \1\0\1\tname\14telescope\rregister\14which-keyQ{ 'rg', '--files', '--hidden', '-g', '!node_modules/**', '-g', '!.git/**', }\fpickers\14live_grep\20additional_args\1\0\0\0\15find_files\1\0\0\1\0\1\vhidden\2\rdefaults\1\0\0\25file_ignore_patterns\1\2\0\0\19node_modules/*\rmappings\1\0\0\6i\1\0\0\1\0\1\n<C-h>\14which_key\nsetup\14telescope\frequire\npcall\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n\28\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\2\0\0\r--hidden‡\t\1\0\n\0,\0E6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0=Ä9\2\3\0015\4\v\0005\5\a\0005\6\5\0005\a\4\0=\a\6\6=\6\b\0055\6\t\0=\6\n\5=\5\f\0045\5\14\0005\6\r\0=\6\15\0055\6\17\0003\a\16\0=\a\18\6=\6\19\5=\5\20\4B\2\2\1'\2\21\0006\3\1\0'\5\22\0B\3\2\0029\3\23\0035\5\24\0005\6\27\0'\a\25\0\18\b\2\0'\t\26\0&\a\t\a>\a\1\6=\6\28\0055\6\30\0'\a\29\0\18\b\2\0'\t\26\0&\a\t\a>\a\1\6=\6\31\0055\6!\0'\a \0\18\b\2\0'\t\26\0&\a\t\a>\a\1\6=\6\"\0055\6#\0=\6$\0055\6&\0'\a%\0\18\b\2\0'\t\26\0&\a\t\a>\a\1\6=\6'\0055\6(\0=\6)\0055\6*\0=\6+\5B\3\2\1K\0\1\0K\0\1\0\15<leader>fk\1\3\0\0008<cmd>lua require('telescope.builtin').keymaps()<cr>\23telescope key maps\15<leader>fc\1\3\0\0009<cmd>lua require('telescope.builtin').commands()<cr>\23telescope commands\15<leader>fo\1\3\0\0\0\24telescope old filesD<cmd>lua require('telescope.builtin').oldfiles({find_command = \15<leader>fh\1\3\0\0:<cmd>lua require('telescope.builtin').help_tags()<cr>\24telescope help tags\15<leader>fb\1\3\0\0\0\22telescope buffersC<cmd>lua require('telescope.builtin').buffers({find_command = \15<leader>fg\1\3\0\0\0\24telescope live grepE<cmd>lua require('telescope.builtin').live_grep({find_command = \15<leader>ff\1\3\0\0\0\24telescope find file\f })<cr>F<cmd>lua require('telescope.builtin').find_files({find_command = \1\0\1\tname\14telescope\rregister\14which-keyQ{ 'rg', '--files', '--hidden', '-g', '!node_modules/**', '-g', '!.git/**', }\fpickers\14live_grep\20additional_args\1\0\0\0\15find_files\1\0\0\1\0\1\vhidden\2\rdefaults\1\0\0\25file_ignore_patterns\1\2\0\0\19node_modules/*\rmappings\1\0\0\6i\1\0\0\1\0\1\n<C-h>\14which_key\nsetup\14telescope\frequire\npcall\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\næ\2\0\0\v\0\r\0\0286\0\0\0'\2\1\0B\0\2\0029\1\2\0006\2\3\0009\2\4\0029\2\5\0025\4\6\0B\2\2\0016\2\3\0009\2\a\2)\3˙\0=\3\b\0026\2\3\0009\2\t\2'\4\n\0B\2\2\0015\2\v\0006\3\f\0\18\5\2\0B\3\2\4X\6\3Ä\18\b\1\0\18\n\a\0B\b\2\1E\6\3\3R\6˚K\0\1\0\vipairs\1\2\0\0\18rust_analyzerWautocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})\bcmd\15updatetime\6o\1\0\1\17virtual_text\1\vconfig\15diagnostic\bvim\rconf_lsp\22utils._set_config\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nN\0\0\4\0\6\0\a6\0\0\0009\0\1\0006\2\2\0009\2\3\0029\2\4\2'\3\5\0D\0\3\0\f TODO: \18commentstring\abo\bvim\vformat\vstringπ\5\1\0\23\0\24\2Q6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0IÄ9\2\3\0019\3\4\0019\4\5\0016\5\1\0'\a\6\0B\5\2\0029\5\a\0056\6\1\0'\b\6\0B\6\2\0029\6\b\0063\a\t\0009\b\n\1'\n\v\0004\v\3\0\18\f\2\0'\14\f\0\18\15\3\0\18\17\a\0004\18\3\0\18\19\4\0)\21\0\0B\19\2\0?\19\0\0B\15\3\0A\f\1\0?\f\0\0B\b\3\0019\b\n\1'\n\r\0004\v\3\0\18\f\2\0'\14\14\0\18\15\6\0'\17\15\0004\18\3\0\18\19\4\0)\21\0\0B\19\2\0?\19\0\0B\15\3\0A\f\1\0?\f\0\0B\b\3\0019\b\n\1'\n\16\0004\v\3\0\18\f\2\0'\14\17\0\18\15\5\0'\17\18\0004\18\3\0\18\19\4\0)\21\1\0'\22\19\0B\19\3\2>\19\1\18\18\19\4\0)\21\2\0'\22\20\0B\19\3\0?\19\1\0005\19\21\0B\15\4\0A\f\1\0?\f\0\0B\b\3\0016\b\1\0'\n\22\0B\b\2\0029\b\23\bB\b\1\1K\0\1\0K\0\1\0\tload luasnip.loaders.from_vscode\1\0\1\15delimiters\a[]\ttext\14func nameÅ\1/** @jsx h */\nimport { h } from \"preact\";\n\nexport default function []() {\n  return (\n    <div>\n      []\n    </div>\n  );\n}\n  \afr\20typescriptreact$  if err != nil {\n    <>\n  }\n  \bife\ago\atd\ball\17add_snippets\0\tfmta\bfmt\23luasnip.extras.fmt\16insert_node\18function_node\fsnippet\fluasnip\frequire\npcall\3ÄÄ¿ô\4\5ÄÄ¿ô\4\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust-tools.nvim', 'rust.vim'}, { ft = "rust" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /root/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], true)
vim.cmd [[source /root/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]]
time([[Sourcing ftdetect script at: /root/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
