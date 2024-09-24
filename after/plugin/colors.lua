-- https://github.com/sainnhe/sonokai/blob/master/README.md
-- sonokai scheme (default, atlantis, andromeda, shusia, maia, Espresso, )
vim.g.sonokai_style = 'andromeda'
-- Enable italic
vim.g.sonokai_enable_italic = 1
-- Disable italic comments
vim.g.sonokai_disable_italic_comment = 0
-- Use transparent background
vim.g.sonokai_transparent_background = 0
-- Improve performance
vim.g.sonokai_better_performance = 1

function ColorMyPencils(color)
	-- color = color or "rose-pine"
	color = color or "sonokai"
    vim.cmd.colorscheme(color)  -- :colorscheme sonokai

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
