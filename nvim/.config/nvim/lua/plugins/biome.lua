return {
  -- Use Biome instead of prettier / eslint
  {
    "stevearc/conform.nvim",
    enable = false,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "biome",
      },
    },
  },
}
