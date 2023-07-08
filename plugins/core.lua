local get_icon = require("astronvim.utils").get_icon

return {
  { "goolord/alpha-nvim", enabled = false },
  { "max397574/better-escape.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },

  { "mfussenegger/nvim-dap", dependencies = {
    { "theHamsta/nvim-dap-virtual-text", config = true },
  } },
  { "akinsho/toggleterm.nvim", opts = {
    terminal_mappings = false,
  } },
  { "echasnovski/mini.ai", opts = {
    search_method = "cover",
  } },
  { "rcarriga/nvim-notify", opts = {
    timeout = 0,
  } },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signcolumn = false,
      numhl = true,
      current_line_blame_opts = { ignore_whitespace = true },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { "miversen33/netman.nvim" },
    opts = {
      sources = {
        "filesystem",
        "netman.ui.neo-tree",
        "git_status",
      },
      source_selector = {
        sources = {
          { source = "filesystem", display_name = get_icon "FolderClosed" .. " File" },
          { source = "remote", display_name = "󰒍 Remote" },
          { source = "git_status", display_name = get_icon "Git" .. " Git" },
        },
      },
      filesystem = {
        hijack_netrw_behavior = "open_default",
        filtered_items = {
          always_show = { ".github", ".gitignore" },
        },
      },
    },
  },
}
