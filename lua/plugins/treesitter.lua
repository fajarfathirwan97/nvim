
-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
    config = function(_, opts)
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      require("nvim-treesitter.configs").setup(opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }
    end,
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "php",
      "phpdoc",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
