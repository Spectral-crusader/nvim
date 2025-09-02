return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
	{
	    "mason-org/mason.nvim",
	    opts = {
	    },
	},
	{
	    "neovim/nvim-lspconfig",
	    dependencies = {
		"saghen/blink.cmp",
		dependencies = { 'rafamadriz/friendly-snippets' },
		version = '1.*',
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
		    keymap = { preset = 'default' },

		    appearance = {
			nerd_font_variant = 'normal'
		    },

		    completion = { documentation = { auto_show = false } },

		    sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		    },

		    fuzzy = { implementation = "prefer_rust_with_warning" }
		},
		opts_extend = { "sources.default" }
	    }
	}
    },
    config = function()
	require("mason").setup()
	require("mason-lspconfig").setup({
	    ensure_installed = {
		"lua_ls",
		"cssls",
		"html",
		"intelephense",
		"vtsls",
		"vue_ls",
		"clangd",
	    },
	})

	vim.api.nvim_create_autocmd('LspAttach', {
	    callback = function(ev)
		local opts = { buffer = ev.buf }

		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
                vim.keymap.set('n', 'r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set({ 'n', 'x' }, 'cf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                vim.keymap.set('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	    end,
	})

	-- Diagnostics
	vim.diagnostic.config({
	    virtual_text = true,
	    severity_sort = true,
	    float = {
		style = 'minimal',
		border = 'rounded',
		header = '',
		prefix = '',
	    },
	    signs = {
		text = {
		    [vim.diagnostic.severity.ERROR] = '✘',
		    [vim.diagnostic.severity.WARN] = '▲',
		    [vim.diagnostic.severity.HINT] = '⚑',
		    [vim.diagnostic.severity.INFO] = '»',
		}
	    }
	})

    end
}
