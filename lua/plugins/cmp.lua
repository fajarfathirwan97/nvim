return { -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  -- override the options table that is used in the `require("cmp").setup()` call
  dependencies = {
    {
        "MattiasMTS/cmp-dbee",
        dependencies = {
          {"kndndrj/nvim-dbee"}
        },
        ft = "sql", -- optional but good to have
        opts = {}, -- needed
      },
  },
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require("cmp")
    -- modify the sources part of the options table
    cmp.setup({
    formatting = {
        format = require('lspkind').cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = '...',
            symbol_map = { Codeium = "", }
        })
    }
})
    opts.sources = cmp.config.sources({
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip", priority = 750 },
      { name = "codeium", priority=500 },
      { name = "cmp-dbee", priority = 300 },
      { name = "buffer", priority = 100 },
      { name = "path", priority = 100 },
    })
  end,
}
