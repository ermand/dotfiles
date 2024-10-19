local wezterm = require("wezterm")

-- wezterm.on("update-right-status", function(window, pane)
-- 	-- window:set_left_status("left")
-- 	-- window:set_right_status("right")
-- end)

return {
	font = wezterm.font_with_fallback({ "Dank Mono", { family = "Symbols Nerd Font Mono", scale = 0.75 } }),
	font_size = 15.0,
	line_height = 1.4,
	color_scheme = "Catppuccin Mocha",
	-- window_background_opacity = 0.8,
	-- use_fancy_tab_bar = false,
	-- show_tabs_in_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	tab_bar_at_bottom = true,
	window_decorations = "RESIZE",

	window_padding = {
		-- left = 2,
		-- right = 2,
		-- top = 0,
		bottom = 0,
	},
}
