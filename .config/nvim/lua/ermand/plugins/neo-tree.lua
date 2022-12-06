local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
	return
end
neotree.setup({
	close_if_last_window = true,
	enable_diagnostics = false,
	source_selector = {
		winbar = true,
		content_layout = "center",
		tab_labels = {
			-- filesystem = astronvim.get_icon("FolderClosed") .. " File",
			-- buffers = astronvim.get_icon("DefaultFile") .. " Bufs",
			-- git_status = astronvim.get_icon("Git") .. " Git",
			-- diagnostics = astronvim.get_icon("Diagnostic") .. " Diagnostic",
		},
	},
	default_component_configs = {
		indent = {
			padding = 0,
		},
		icon = {
			-- folder_closed = astronvim.get_icon("FolderClosed"),
			-- folder_open = astronvim.get_icon("FolderOpen"),
			-- folder_empty = astronvim.get_icon("FolderEmpty"),
			-- default = astronvim.get_icon("DefaultFile"),
			folder_closed = "",
			folder_open = "",
			folder_empty = "ﰊ",
			-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
			-- then these will never be used.
			default = "*",
			highlight = "NeoTreeFileIcon",
		},
		git_status = {
			symbols = {
				-- added = astronvim.get_icon("GitAdd"),
				-- deleted = astronvim.get_icon("GitDelete"),
				-- modified = astronvim.get_icon("GitChange"),
				-- renamed = astronvim.get_icon("GitRenamed"),
				-- untracked = astronvim.get_icon("GitUntracked"),
				-- ignored = astronvim.get_icon("GitIgnored"),
				-- unstaged = astronvim.get_icon("GitUnstaged"),
				-- staged = astronvim.get_icon("GitStaged"),
				-- conflict = astronvim.get_icon("GitConflict"),
				-- Change type
				added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
				modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
				deleted = "✖", -- this can only be used in the git_status source
				renamed = "", -- this can only be used in the git_status source
				-- Status type
				untracked = "★",
				ignored = "",
				unstaged = "",
				staged = "",
				conflict = "",
			},
		},
	},
	window = {
		width = 30,
		mappings = {
			["o"] = "open",
		},
	},
	filesystem = {
		follow_current_file = true,
		hijack_netrw_behavior = "open_current",
		use_libuv_file_watcher = true,
	},
	event_handlers = {
		{
			event = "neo_tree_buffer_enter",
			handler = function(_)
				vim.opt_local.signcolumn = "auto"
			end,
		},
	},
})
