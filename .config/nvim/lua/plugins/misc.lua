return {
  {
    "m4xshen/smartcolumn.nvim",
    event = "InsertEnter",
    opts = {
      colorcolumn = 90,
      disabled_filetypes = { "help", "lazy" }
    }
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = { check_ts = true }
  },
}
