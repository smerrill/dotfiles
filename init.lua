-- Install lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
	{ "EdenEast/nightfox.nvim", priority = 1000 },
	{ "olimorris/onedarkpro.nvim", priority = 1000 },
	{ "nanozuki/tabby.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ 'freddiehaddad/feline.nvim' },
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.4', dependencies = { 'nvim-lua/plenary.nvim' } },
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
	{ "nvim-treesitter/nvim-treesitter",
	    build = ":TSUpdate",
	    config = function () 
	      local configs = require("nvim-treesitter.configs")

	      configs.setup({
		  ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "css", "go" },
		  sync_install = false,
		  highlight = { enable = true },
		  indent = { enable = true },  
		})
	    end
	},
-- LSP support
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', lazy = true, config = false },
  { 'neovim/nvim-lspconfig', dependencies = { 'hrsh7th/cmp-nvim-lsp' } },
  -- Autocompletion
  { 'hrsh7th/nvim-cmp', dependencies = { 'L3MON4D3/LuaSnip' } },
})

-- Telescope (fuzzy finder) setup
local builtin = require('telescope.builtin')
-- Default Telescope bindings
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Additional Telescope bindings
vim.keymap.set('n', '<leader>,', builtin.find_files, {})

-- Color Scheme
vim.cmd.colorscheme('duskfox')

-- LSP setup
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Feline setup
require('feline').setup()
-- require('feline').winbar.setup()
require('feline').statuscolumn.setup()

-- Tabby / tabline setup
-- vim.o.showtabline = 2 -- Always show tabline even with only one tab open

