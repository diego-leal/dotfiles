local packer = require('packer')

packer.startup(function()
  use 'wbthomason/packer.nvim'
  -- use 'gruvbox-community/gruvbox'
  use 'joshdick/onedark.vim'

  -- use {
    -- 'nvim-telescope/telescope.nvim',
    -- requires = { {'nvim-lua/plenary.nvim'} }
  -- }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
end)


local lualine = require('lualine')

lualine.setup {
  options = {
    icons_enabled = true,
    -- theme = 'gruvbox_dark',
    theme = 'onedark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

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
  clipboard = 'unnamedplus',
  -- cursorline = true,
  cmdheight = 2,
  background = 'dark',
}

for opt, value in pairs(options) do
  vim.opt[opt] = value
end

vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = '0'

-- vim.cmd 'colorscheme gruvbox'
vim.cmd 'colorscheme onedark'

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ===========
-- Insert Mode
-- ===========
map('i', 'jj', '<esc>')
map('i', ';;', '<esc>A;<esc>')
map('i', ',,', '<esc>A,<esc>')

-- ===========
-- Visual Mode
-- ===========
map('v', '>', '>gv')
map('v', '<', '<gv')

-- ===========
-- Normal Mode
-- ===========
map('n', '<leader>sc', ':luafile ~/.config/nvim/init.lua<cr>')
map('n', '<c-n>', ':nohl<cr>')
map('n', '<leader>e', ':Lex 20<cr>')
map('n', '<c-p>', ':Telescope find_files<cr>')

return packer
