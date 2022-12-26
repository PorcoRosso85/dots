vim.cmd([[
  call skkeleton#config({ 'globalJisyo': '~/.config/eskk/SKK-JISYO.L' })
  imap <A-l> <Plug>(skkeleton-enable)
  cmap <A-l> <Plug>(skkeleton-enable)
]])
  
require'skkeleton_indicator'.setup{}
