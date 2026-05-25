local opts = {
  noremap = true,
  silent = true
}

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], opts)
vim.keymap.set("n", "<leader>Y", [["+Y]], opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "n", "nzzv", opts)
vim.keymap.set("n", "N", "Nzzv", opts)
vim.keymap.set("n", "*", "*zzv", opts)
vim.keymap.set("n", "#", "#zzv", opts)
vim.keymap.set("n", "g*", "g*zz", opts)
vim.keymap.set("n", "g#", "g#zz", opts)

vim.keymap.set("n", "<C-a>", "ggVG", opts)

vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", opts)
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", opts)
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", opts)
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", opts)

vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", opts)

vim.keymap.set({ "n", "v" }, "<leader>R", function()
  vim.ui.input({ prompt = "Command: " }, function(command)
    local dir = vim.fn.expand("%:p:h")

    if command then
      vim.cmd(string.format("!cd %s && %s", dir, command))
    end
  end)
end, opts)

