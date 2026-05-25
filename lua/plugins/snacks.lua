return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    indent = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    dim = { enabled = true },
    notifier = { enabled = true },
    notify = { enabled = true },
    picker = {},
    statuscolumn = { enabled = true },
    terminal = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    {
      "<leader>sf",
      function()
        Snacks.picker.files({
          hidden = true,
          ignored = true,
          follow = true,
          exclude = {
            "node_modules",
            ".next",
            ".turbo",
            ".react-router",
            ".expo",
            ".git",
            ".DS_Store",
            "dist"
          }
        })
      end
    },
    {
      "<leader>sg",
      function()
        Snacks.picker.grep()
      end
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics()
      end
    },
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end
    },
    {
      "grr",
      function()
        Snacks.picker.lsp_references()
      end
    },
    {
      "gO",
      function()
        Snacks.picker.lsp_symbols()
      end
    },
    {
      "<leader>sk",
      function()
        Snacks.picker.keymaps()
      end
    }
  }
}
