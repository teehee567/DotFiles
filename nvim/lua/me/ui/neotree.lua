return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	keys = {
		{ '<leader>e', function() vim.cmd('Neotree toggle') end, desc = 'Toggle Neotree' },
	},
	opts = {
		close_if_last_window = true,
		popup_border_style = 'rounded',
		commands = {
		harpoon_mark = function(state)
			local node = state.tree:get_node()
			local path = node:get_id()

			local harpoon = require("harpoon")
			local list = harpoon:list()

			-- toggle: remove if present, otherwise add
			local idx = nil
			for i, it in ipairs(list.items or {}) do
			local val = (type(it) == "table" and (it.value or it.filename)) or it
			if val == path then idx = i break end
			end
			if idx then
			list:removeAt(idx)
			else
			list:add({ value = path })
			end

			require("neo-tree.sources.filesystem.commands").refresh(
			require("neo-tree.sources.manager").get_state("filesystem")
			)
		end,
		},
		window = {
			mappings = {
				['%'] = 'add',
				['.'] = 'toggle_hidden',
				['<leader>a'] = 'harpoon_mark',
				['l'] = function(state)
					local node = state.tree:get_node()
					if node.type == "directory" then
						require("neo-tree.sources.filesystem.commands").toggle_node(state, node)
					else
						require("neo-tree.sources.filesystem.commands").open(state)
					end
				end,

				['h'] = function(state)
					local node = state.tree:get_node()
					if node.type == "directory" and node:is_expanded() then
						require("neo-tree.sources.filesystem.commands").toggle_node(state, node)
					else
						-- go to parent if folder is already collapsed
						local parent_id = node:get_parent_id()
						if parent_id then
						state.tree:set_cursor(state.tree:get_node(parent_id):get_id())
						end
					end
				end,

				-- ['v'] = function(state)
				-- 	local node = state.tree:get_node()
				-- 	if node.type == "file" then
				-- 		vim.cmd("vsplit " .. vim.fn.fnameescape(node.path))
				-- 	elseif node.type == "directory" then
				-- 		-- optional: expand the folder if user presses v on a directory
				-- 		require("neo-tree.sources.filesystem.commands").toggle_node(state, node)
				-- 	end
				-- end,
				['v'] = 'vsplit_with_window_picker',
			    ['<cr>'] = 'open_with_window_picker',
			},
		},
		filesystem = {
			hijack_netrw_behavior = "open_default",
			filtered_items = {
				always_show = {
					'.gitignore',
				},
				never_show = {
					'.DS_Store',
				},
			},
			follow_current_file = {
				enabled = true,
				leave_dirs_open = true,
			},
			components = {
			harpoon_index = function(config, node, _)
				local harpoon = require("harpoon")
				local list = harpoon:list()
				local path = node:get_id()

				local index = nil
				for i, it in ipairs(list.items or {}) do
				local val = (type(it) == "table" and (it.value or it.filename)) or it
				if val == path then index = i break end
				end

				if index and index > 0 then
				return {
					text = string.format(" ⥢ %d ", index),
					highlight = config.highlight or "NeoTreeDirectoryIcon",
				}
				else
				return { text = "  " }
				end
			end,
			},
			renderers = {
				file = {
					{ 'icon' },
					{ 'name', use_git_status_colors = true },
					{ 'harpoon_index' },
					{ 'diagnostics' },
					{ 'git_status', highlight = 'NeoTreeDimText' },
				},
			},
		},
		event_handlers = {
			{
				event = 'file_opened',
				handler = function() require('neo-tree.command').execute { action = 'close' } end,
			},
		},
	},
	init = function()
		vim.api.nvim_set_hl(0, 'NeoTreeFileName', { link = 'Normal' })
		vim.api.nvim_set_hl(0, 'NeoTreeNormal', { link = 'Normal' })
	end,
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim',
		{
			's1n7ax/nvim-window-picker',
			version = '2.*',
			config = function()
				require('window-picker').setup {
					filter_rules = {
						include_current_win = false,
						autoselect_one = true,
						bo = {
							filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
							buftype = { 'terminal', 'quickfix' },
						},
					},
				}
			end,
		},
	},
}
