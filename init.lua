-- Leader key is a space
vim.g.mapleader = " "

-- Setup globals that should always be around
-- See `./lua/globals
require "globals.options"
require "globals.remaps"

require "lsp.lsp"

require 'plugins.packer'

-- Setup theme 
require('onedark').setup{
	style = 'deep'
}
require('onedark').load()

local rt = require('rust-tools')

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			vim.keymap.set("n", "<Leader>h", rt.hover_actions.hover_actions, { buffer = bufnr })
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, {buffer = bufnr})
		end,
	},
})	
