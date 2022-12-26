require("vimplugs")

require("settings._mappings")
require("settings._options")
require("settings._provider")

--local ok, reload = pcall(require, "plenary.reload")
--RELOAD = ok and reload.reload_module or function(...)
--  return ...
--end
--function R(name)
--  RELOAD(name)
--  return require(name)
--end
--
--R("plugins")

--require'plugins'

-- https://mitchellt.com/2022/05/15/WSL-Neovim-Lua-and-the-Windows-Clipboard.html
