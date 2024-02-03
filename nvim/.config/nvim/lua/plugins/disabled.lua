return {
  { "nvimdev/dashboard-nvim", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
  { "folke/persistence.nvim", enabled = false },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      -- still loads the plugin, but starts at disabled
      enable = false,
    },
  },
}
