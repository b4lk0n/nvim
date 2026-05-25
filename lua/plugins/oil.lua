return {
  "stevearc/oil.nvim",
  cmd = { "Oil" },
  keys = {
    { "-", "<cmd>Oil<cr>" }
  },
  init = function()
    if vim.fn.argc() == 1 then
      local arg = vim.fn.argv(0)

      if vim.fn.isdirectory(arg) == 1 then
        vim.api.nvim_create_autocmd("VimEnter", {
          once = true,
          callback = function()
            vim.cmd("Oil " .. vim.fn.fnameescape(arg))
          end
        })
      end
    end
  end,
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true
      },
      columns = {},
      skip_confirm_for_simple_edits = true
    })
  end
}
