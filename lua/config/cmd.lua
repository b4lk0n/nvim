-- auto cmd

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "checktime"
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.hl.on_yank({
      timeout = 100,
      visual = true
    })
  end
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = vim.api.nvim_create_augroup("resize_splits", { clear = true }),
  callback = function()
    local curr_tab = vim.fn.tabpagenr()

    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. curr_tab)
  end
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf

    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].last_loc then
      return
    end

    vim.b[buf].last_loc = true

    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)

    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end
})

-- user cmd

vim.api.nvim_create_user_command("AbsoluteBufPath", function()
  local path = vim.fn.expand("%:p")

  vim.notify("Path:" .. path)
end, {})

vim.api.nvim_create_user_command("CopyAbsoluteBufPath", function()
  local path = vim.fn.expand("%:p")

  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command("BufPath", function()
  local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":,")

  vim.notify("Path: " .. path)
end, {})

vim.api.nvim_create_user_command("CopyBufPath", function()
  local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":,")

  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wa", "wa", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("Wqa", "wqa", {})
