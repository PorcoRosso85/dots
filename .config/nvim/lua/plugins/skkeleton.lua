vim.cmd([[
  call skkeleton#config({ 'globalJisyo': '~/.config/eskk/SKK-JISYO.L' })
  imap <C-j> <Plug>(skkeleton-enable)
  cmap <C-j> <Plug>(skkeleton-enable)
]])
  
require'skkeleton_indicator'.setup{}
