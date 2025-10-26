return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		}
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "vimls", "ts_ls", "pyright" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})
			-- Basic keymaps for LSP
			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover info" })
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "List references" })
			-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
			-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
			--
			--
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('my.lsp', {}),
				callback = function(args)
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
					-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
					if not client:supports_method('textDocument/willSaveWaitUntil')
							and client:supports_method('textDocument/formatting') then
						vim.api.nvim_create_autocmd('BufWritePre', {
							group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
							end,
						})
					end
				end,
			})
		end,
	},
}
