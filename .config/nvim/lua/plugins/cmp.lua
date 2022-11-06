vim.opt.completeopt=menu,menuone,noselect 

return function()
  local cmp = require('cmp')
  local lspkind = require('lspkind')

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    sources = cmp.config.sources{
      { name = 'nvim_lsp' },
--      { name = 'luasnip' },
--      { name = 'buffer' },
--      { name = 'vsnip' },
    },
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-l>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
--      ['<UP>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior }),
--      ['<DOWN>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior })
    },
    formatting = {
      format = lspkind.cmp_format({
        with_text = true,
        maxwidth = 50,
        before = function(entry, vim_item)
          return vim_item
        end
      })
    },
    experimental = {
      ghost_text = true,
    },
  })

  vim.cmd([[
    autocmd FileType TelescopePrompt,NvimTree,netrw lua require'cmp'setup.buffer {
    \   completion = { autocomplete = false }
    \ }
  ]])
end

