-- Leader key is a space
vim.g.mapleader = " "

-- Setup globals that should always be around
-- See `./lua/globals
require "globals.options"
require "globals.remaps"
require "globals.trouble"
require "globals.barbar"
require "lsp.lsp"

require 'plugins.packer'

-- Setup theme 
vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup({
	transparent_background = true,
	term_colors = false,
	compile = {
		enabled = false,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
	},
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	styles = {
		comments = { "italic" },
		conditionals = {},
		loops = {},
		functions = { "italic" },
		keywords = {"italic"},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		telescope = true,
		barbar = true,
		cmp = true,
		nvimtree = true,
		treesitter = true,
		lsp_trouble = true,
		gitgutter = true,
	}
})
vim.cmd [[colorscheme catppuccin]]

local rt = require('rust-tools')

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			vim.keymap.set("n", "<Leader>h", rt.hover_actions.hover_actions, { buffer = bufnr })
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, {buffer = bufnr})
		end,
	},
})
