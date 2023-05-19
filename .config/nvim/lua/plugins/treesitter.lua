local events = { "BufReadPost", "BufNewFile" }

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = events,
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "bash",
      "comment",
      "css",
      "gitcommit",
      "gitignore",
      "haskell",
      "html",
      "ini",
      "java",
      "javascript",
      "json",
      "json5",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "regex",
      "ruby",
      "toml",
      "vimdoc",
      "yaml"
    }
  },
  config = function (_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
