return {
  "kndndrj/nvim-projector",
  dependencies = {
    -- required:
    "MunifTanjim/nui.nvim",
    -- optional extensions:
    "kndndrj/projector-neotest",
    -- dependencies of extensions:
    "nvim-neotest/neotest",
  },
  config = function()
    require("projector").setup{
      outputs = {
        -- require("projector_dbee").OutputBuilder:new(),
        require("projector_neotest").OutputBuilder:new({
          group = false,
          include_debug = false
        }),
      }
    }
  end,
}
