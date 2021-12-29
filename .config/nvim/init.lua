
local options = {
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,
  smarttab = true,
  smartcase = true,
  ignorecase = true,
  number = true,
  relativenumber = true,
  updatetime = 1000, -- Default 4000ms
  termguicolors = true,
  splitbelow = true,
  splitright = true,
  clipboard = "unnamedplus",
  -- cursorline = true,
  cmdheight = 2,
}

for opt, value in pairs(options) do
  vim.opt[opt] = value
end


-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Force remap leader key to space
map("", "<space>", "<nop>", { noremap = false })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ===========
-- Insert Mode
-- ===========
map("i", "jj", "<esc>")
map("i", ";;", "<esc>A;<esc>")
map("i", ",,", "<esc>A,<esc>")


-- ===========
-- Visual Mode
-- ===========
map("v", ">", ">gv")
map("v", "<", "<gv")


-- ===========
-- Normal Mode
-- ===========
-- startregion
map("n", "<leader>sc", ":luafile ~/.config/nvim/init.lua<cr>", { silent = false })
map("n", "<c-n>", ":nohl<cr>")
map("n", "<leader>e", ":Lex<cr>")
--endregion

-- Better Navigation
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-h>", "<c-w>h")
map("n", "<c-l>", "<c-w>l")
