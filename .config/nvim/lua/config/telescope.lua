-- Configure NeoTree
require("telescope").setup({
  defaults = {
    file_ignore_patterns = { ".git", "node_modules", "build", ".cache" }
  }
})
