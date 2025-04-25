-- Configure Telescope
local telescope = require("telescope")
telescope.setup({
  defaults = {
    file_ignore_patterns = { ".git", "node_modules", "build", ".cache" }
  }
})

