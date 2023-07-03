vim.g.mapleader = " "
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Move selected lines in Virtual Mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Do the same as "J" but keep the cursor in the same place
vim.keymap.set("n", "J", "mzJ`z")
-- Do the same as "n" but keep the view in the center of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Set middle of viewe on the cursor when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste "foo" over selected word without loosing the current "foo" buffer
vim.keymap.set("x", "<leader>p", "\"_dP")
-- Do the same for delete "d" in Normal and Visual mode
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Copy to leaderboard for Normal & Visual mode
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- When exiting visual block and you press <C-c> it will not register the changes
vim.keymap.set("i", "<C-c>", "<Esc>")

-- For when I start using tmux
-- Cntrl+a+L you go to tmux previous session
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format the buffer
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- QuickFix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace all the instances of the word that the cursor was on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the file an executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Double space to :source file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
