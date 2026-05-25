return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local linters = { "cspell" }
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = linters,
      javascriptreact = linters,
      typescript = linters,
      typescriptreact = linters,
      json = linters,
      jsonc = linters,
      markdown = linters,
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      group = vim.api.nvim_create_augroup("cspell_lint", { clear = true }),
      callback = function()
        lint.try_lint()
      end
    })
  end
}
