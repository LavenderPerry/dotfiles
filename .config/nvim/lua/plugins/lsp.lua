return {
  {
    "neovim/nvim-lspconfig",
    dependencies = "cmp-nvim-lsp",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      setup = {
        "bashls",
        "cssls",
        "html",
        --- jdtls is handled by nvim-jdtls
        "jsonls",
        -- lua_ls is set up with custom options
        "marksman",
        -- rust_analyzer is handled by rust-tools.nvim
        "solargraph",
        -- tsserver is handled by typescript.nvim
        "yamlls"
      }
    },
    config = function (_, opts)
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      for _, server in ipairs(opts.setup) do
        lspconfig[server].setup({ capabilities = capabilities })
      end

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            telemetry = { enable = false }
          }
        }
      })
    end
  },
  {
    "mfussenegger/nvim-jdtls",
    dependencies = "nvim-lspconfig",
    ft = "java",
    config = function ()
      require("jdtls").start_or_attach({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" }
      })
    end
  },
  {
    "simrat39/rust-tools.nvim",
    dependencies = "nvim-lspconfig",
    ft = "rust"
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    dependencies = "nvim-lspconfig",
    ft = { "javascript", "typescript" },
    config = true
  },
  {
    "folke/trouble.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = true
  }
}
