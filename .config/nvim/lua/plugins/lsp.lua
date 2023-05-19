return {
  {
    "neovim/nvim-lspconfig",
    dependencies = "cmp-nvim-lsp",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      setup = {
        "bashls",
        "cssls",
        "dhall_lsp_server",
        -- hls is handled by haskell-tools.nvim
        "html",
        --- jdtls is handled by nvim-jdtls
        "jsonls",
        -- lua_ls is set up with custom options
        "marksman",
        "purescriptls",
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
    "mrcjkb/haskell-tools.nvim",
    dependencies = { "nvim-lspconfig", "nvim-lua/plenary.nvim" },
    ft = "haskell",
    branch = "1.x.x",
    config = function ()
      local ht = require("haskell-tools")
      ht.start_or_attach({
        hls = {
          on_attach = function (_, bufnr)
            local opts = { buffer = bufnr, noremap = true, silent = true }
            -- keymaps from readme
            for keys, action in pairs({
              ["<space>ca"] = vim.lsp.codelens.run,
              ["<space>ea"] = ht.lsp.buf_eval_all,
              ["<space>hs"] = ht.hoogle.hoogle_signature
            }) do
              vim.keymap.set("n", keys, action, opts)
            end
          end
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
