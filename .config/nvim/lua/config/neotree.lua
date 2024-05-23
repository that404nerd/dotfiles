-- Configure NeoTree
require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        "node_modules",
        ".cache",
      },
      never_show = { -- remains hidden even if visible is toggled to true
        ".DS_Store",
        "thumbs.db",
      },
    },
    follow_current_file = true, -- This option will not work with the 0.7.x release
    use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
  },
  window = {
    width = 30,
    mappings = {
      ["o"] = "open",
      ["H"] = "toggle_hidden",
      ["R"] = "refresh",
    },
  },
  buffers = {
    follow_current_file = true, -- This option will not work with the 0.7.x release
  },
})
