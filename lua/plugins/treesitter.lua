return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
	local configs = require("nvim-treesitter.configs")
	configs.setup({
	    highlight = {
		enable = true,
	    },
	    indent = { enable = true },
	    autotage = { enable = true },
	    ensure_installed = {
		"lua",
		"php",
		"html",
		"javascript",
		"typescript",
		"vue",
		"css",
		"python",
		"scss",
		"c",
	    },
	    auto_install = false,
	})
    end
}
