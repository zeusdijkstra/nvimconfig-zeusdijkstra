return {
	{
		"jellydn/quick-code-runner.nvim",
		enabled = false,
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			debug = true,
			file_types = {
				javascript = { 'node' },
				typescript = { 'node' },
				python = {
					'python3 -u', -- Run command for python
				},
				go = {
					"go run",
				},
			},
		},
		cmd = { "QuickCodeRunner", "QuickCodePad" },
		keys = {
			{
				"<leader>cr",
				":QuickCodeRunner<CR>",
				desc = "Quick Code Runner",
				mode = "v",
			},
			{
				"<leader>cp",
				":QuickCodePad<CR>",
				desc = "Quick Code Pad",
			},
		},
	},
	{
		"CRAG666/code_runner.nvim",
		config = function()
			require('code_runner').setup({
				filetype = {
					java = {
						"cd $dir &&",
						"javac $fileName &&",
						"java $fileNameWithoutExt"
					},
					python = "python3 -u",
					javascript = "node",
					go = {
						"cd $dir &&",
						"go run $fileName"
					},
					c = "cd $dir && gcc $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt",
				},
			})

			vim.keymap.set('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false })
			vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
			vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
			vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
			vim.keymap.set('n', '<leader>cc', ':RunClose<CR>', { noremap = true, silent = false })
			vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
			vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
		end
	},
}
