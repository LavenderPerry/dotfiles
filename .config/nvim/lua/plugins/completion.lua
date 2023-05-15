return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "dcampos/cmp-snippy",
    "dcampos/nvim-snippy"
  },
  opts = function ()
    local cmp = require("cmp")
    return {
      -- Specify snippy as snippet engine
      -- This is why nvim-snippy is listed as a dependency
      snippet = {
        expand = function (args)
          require("snippy").expand_snippet(args.body)
        end
      },
      -- Intellij-like mapping
      -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#intellij-like-mapping
      mapping = {
        ["<Tab>"] = cmp.mapping(function (fallback)
          if cmp.visible() then
            if cmp.get_selected_entry() then
              cmp.confirm()
            else
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            end
          else
            fallback()
          end
        end, { "i", "s", "c" })
      },
      -- Add sources (installed in dependencies)
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "snippy" },
        { name = "buffer" },
        { name = "path" }
      })
    }
  end
}
