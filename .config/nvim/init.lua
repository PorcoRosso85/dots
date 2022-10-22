-- lua << EOF
-- https://github1s.com/yanskun/dotfiles/blob/main/
--

require'plugins'
require("settings._options")
require("settings._mappings")
require("settings._provider")

local ok, reload = pcall(require, "plenary.reload")
RELOAD = ok and reload.reload_module or function(...)
  return ...
end
function R(name)
  RELOAD(name)
  return require(name)
end

R("plugins")
-- EOF

-- vim.cmd[[colorscheme onedarkpro]]

--[[
" for vimscript settings
nnoremap <leader>initv <cmd>e ~/.config/nvim/init.vim<cr>
" nnoremap <leader>initl <cmd>e ~/.config.nvim/init.lua<cr>

call plug#begin(stdpath('data') . '/plugged')
Plug 'projekt0n/github-nvim-theme'
Plug 'olimorris/onedarkpro.nvim'
" Plug 'rust-lang/rust.vim'
" Plug 'thinca/vim-quickrun'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-cmp'
call plug#end()

" colorscheme github_*
colorscheme onedarkpro
syntax enable
filetype plugin indent on

" let g:rustfmt_autosave = 1
" 
" " set number
" set updatetime=300
" set tabstop=2
" set shiftwidth=2
" set softtabstop=2
" set expandtab
" 
" if has("patch-8.1.1564")
" 	set signcolumn=number
" else
" 	set signcolumn=yes
" endif
" 
" nmap <silent> gd <Plug>(coc-difinition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" 
" nnoremap <silent><nowait> <space>j :<C-u>CocNext<CR>
" 
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
]]--


