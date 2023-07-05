local events = { "BufReadPost", "BufNewFile" }

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = "cmp-nvim-lsp",
    event = events,
    opts = {
      setup = {
        "arduino_language_server",
        "bashls",
        "cssls",
        "html",
        -- jdtls is handled by nvim-jdtls
        "jsonls",
        -- lua_ls is set up with custom options
        "marksman",
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
      require("jdtls").start_or_attach({ cmd = { "/usr/bin/jdtls" } })
    end
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    dependencies = "nvim-lspconfig",
    ft = { "javascript", "typescript" },
    config = true
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = events,
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "arduino",
        "bash",
        "comment",
        "css",
        "gitcommit",
        "gitignore",
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
        "toml",
        "vimdoc",
        "yaml"
      }
    },
    config = function (_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-lspconfig",
    event = events,
    config = true
  }
}
