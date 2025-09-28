local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

return {
    {
	"shaunsingh/nord.nvim",
	config = function()
	    vim.o.background = "dark"
	    vim.cmd.colorscheme "nord"
	    enable_transparency()
	end
    },
    {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	opts = {
	    theme = "nord",
	}
    },
}
