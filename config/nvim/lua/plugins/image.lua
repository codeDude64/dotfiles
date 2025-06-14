return {
  "3rd/image.nvim",
  build = false,   -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
  commit = "21909e3eb03bc738cce497f45602bf157b396672",
  opts = {
    processor = "magick_cli",
  }
}
