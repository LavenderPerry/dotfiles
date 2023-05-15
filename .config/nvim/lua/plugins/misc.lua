return {
  {
    "m4xshen/smartcolumn.nvim",
    event = "InsertEnter",
    opts = {
      colorcolumn = 90,
      disabled_filetypes = { "help", "lazy", "mason" }
    }
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = { check_ts = true }
  },
}
