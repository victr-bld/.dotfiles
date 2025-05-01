-- mappings

-- map function
function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent=true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- workaround to use CTRL+] on laptop
map("n", "<C-)>", "<C-]>")

-- tab bindings 
map("n", "<leader>t", ":tabnew<CR>")
map("n", "<leader>x", ":tabclose<CR>")
map("n", "<leader>l", ":tabn<CR>")
map("n", "<leader>h", ":tabp<CR>")
map("n", "<leader>b", ":lua vim.opt.showtabline = vim.opt.showtabline:get() == 2 and 0 or 2<CR>")

-- easy split generation
map("n", "<leader>v", ":vsplit")
map("n", "<leader>s", ":split")

-- easy split navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- open netwr
map("n", "<leader>m", ":Explore<CR>")

-- saving files & quitting insert mode
map("n", "<C-s>", ":w<CR>")
map("i", "<C-c>", "<Esc>")

-- terminal
map("n", "<leader><CR>", ":terminal<CR>")
map("t", "<C-c>", "<C-\\><C-n>")

-- scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
vim.api.nvim_create_autocmd("CursorMoved", {
    pattern = "*",
    command = "normal! zz"
})

-- copy and paste without registers
map("x", "<leader>p", [["_dP]])
map("v", "<leader>d", [["_d]])

-- openwrt

-- map space + o to comment or uncomment a token in Openwrt
vim.keymap.set("n", "<leader>o", function()
  local line_nr = vim.fn.line(".")
  local line = vim.fn.getline(line_nr)
  if line:match("^CONFIG_.*=y$") then
    local new_line = line:gsub("^(CONFIG_.-)=y$", "# %1 is not set")
    vim.fn.setline(line_nr, new_line)
  elseif line:match("^# CONFIG_.* is not set$") then
    local new_line = line:gsub("^# (CONFIG_.-) is not set$", "%1=y")
    vim.fn.setline(line_nr, new_line)
  end
end, { silent = true })
