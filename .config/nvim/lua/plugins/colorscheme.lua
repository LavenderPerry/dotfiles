return {
  "echasnovski/mini.base16",
  opts = {
    palette = {
      base00 = "#2c1c30",
      base01 = "#3b2640",
      base02 = "#583960",
      base03 = "#be9fc6",
      base04 = "#d4bfd9",
      base05 = "#e9dfec",
      base06 = "#f4eff6",
      base07 = "#674270",
      base08 = "#a15e6c",
      base09 = "#935ea1",
      base0A = "#a1725e",
      base0B = "#5e8da1",
      base0C = "#5e6ca1",
      base0D = "#725ea1",
      base0E = "#a15e8d",
      base0F = "#896f90"
    }
  },
  config = function (_, opts)
    require("mini.base16").setup(opts)
  end
}
