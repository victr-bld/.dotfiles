-- default mappings

-- set the leader key to space
vim.g.mapleader = " "

vim.opt.clipboard:append { 'unnamedplus' }

-- open the file explorer with <leader>pv in normal mode
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- scroll down and center the cursor with <c-d> in normal mode
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- scroll up and center the cursor with <c-u> in normal mode
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search forward and center the cursor with "n" in normal mode
vim.keymap.set("n", "n", "nzzzv")

-- search backward and center the cursor with "n" in normal mode
vim.keymap.set("n", "N", "Nzzzv")

-- center screen when moving
vim.api.nvim_create_autocmd("CursorMoved", {
    pattern = "*",
    command = "normal! zz"
})

-- move selected lines down with "J" in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- move selected lines up with "K" in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- join lines with "J" in normal mode
-- vim.keymap.set("n", "J", "mzJz")

-- paste in visual mode without overwriting the clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- delete to the black hole register (not saved) with <leader>d in normal and visual mode
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- change all occurence of selection with <leader>c in visual mode
vim.keymap.set("v", "<leader>c", [["hy:%s/<C-r>h//gc<left><left><left>]], { noremap = true, silent = false })

-- save the file with <c-s> in normal mode
vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })
