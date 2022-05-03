require "toggleterm".setup {
  size = 8,
  open_mapping = [[<c-t>]],
  shade_terminals = false,
  shade_factor = '1',
  start_in_insert = true,
  persist_size = true,
  direction = 'float',
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}
