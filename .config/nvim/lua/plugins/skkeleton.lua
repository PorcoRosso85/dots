-- vim.cmd([[
--   call skkeleton#config({ 'globalJisyo': '~/.config/eskk/SKK-JISYO.L' })
--   imap <C-\> <Plug>(skkeleton-enable)
--   cmap <C-\> <Plug>(skkeleton-enable)
-- ]])
vim.cmd("call skkeleton#config({ 'globalJisyo': '~/.config/eskk/SKK-JISYO.L' })")
vim.cmd("imap <M-l> <Plug>(skkeleton-enable)")
vim.cmd("cmap <M-l> <Plug>(skkeleton-enable)")
  
require'skkeleton_indicator'.setup{
  eijiText = "aA"
}
