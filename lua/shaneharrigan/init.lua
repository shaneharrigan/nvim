require("shaneharrigan.remap")
require("shaneharrigan.lazy-pm")
require("shaneharrigan.set")

require("lazy").setup({
	"nvim-telescope/telescope.nvim",
	"folke/which-key.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-treesitter/nvim-treesitter",
	"folke/tokyonight.nvim",
	"theprimeagen/harpoon",
	"mbbill/undotree",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"tpope/vim-fugitive",
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},

	--- Uncomment these if you want to manage LSP servers from neovim
	-- {'williamboman/mason.nvim'},
	-- {'williamboman/mason-lspconfig.nvim'},

	-- LSP Support
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{'hrsh7th/cmp-nvim-lsp'},
		},
	},

	-- Autocompletion
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			{'L3MON4D3/LuaSnip'},
		}
	},
	config = function()
		local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
		local on_attach = require'config.on_attach'
		require('nvim-lsp-installer').on_server_ready(
		function(server)
			local config = {
				on_attach = on_attach[server.name],
				capabilities = capabilities,
				autostart = true,
				settings = {
					Lua = {
						diagnostics = { globals = {'vim'} }
					}
				}
			}
			server:setup(config)
		end
		)
	end
})

require("tokyonight").setup {
	transparent = true,
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	}
}

