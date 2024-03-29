return {
	-- add falcon colorscheme
	{ "fenetikm/falcon" },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "falcon",
		},
	},
	-- fixup to stop spurious warning
	{
		"nvim-notify",
		opts = {
			background_colour = "#000000",
		},
	},
}
