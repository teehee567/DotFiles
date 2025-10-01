
local plenary_path = require('plenary.path')
local if_nil = vim.F.if_nil

M = {}

--- @param fn string
--- @param target_width integer
local function force_shorten(fn, target_width)
	if #fn <= target_width then return fn end
	---@diagnostic disable-next-line: param-type-mismatch
	local path = plenary_path.new(fn)
	fn = path:shorten(1, { -2, -1 })
	if #fn <= target_width then return fn end
	fn = path:shorten(1, { -1 })
	if #fn <= target_width then return fn end
	fn = path:shorten(1)
	if #fn <= target_width then return fn end
	return fn:sub(-target_width, -1)
end

--- @param filenames string[]
--- @param shortcut_fn fun(i: number): string
--- @param cwd? string
--- @param target_width? number
function M.gen_file_list(filenames, shortcut_fn, cwd, target_width)
	target_width = target_width or 35

	local tbl = {}
	for i, fn in ipairs(filenames) do
		local el
		if fn == '(empty)' then
			el = {
				text = {
					{ '󰆪  ', hl = 'icon' },
					{ '(empty)', hl = 'NonText' },
				},
			}
		else
			local short_fn
			if cwd then
				short_fn = vim.fn.fnamemodify(fn, ':.')
			else
				short_fn = vim.fn.fnamemodify(fn, ':~')
			end
			short_fn = force_shorten(short_fn, target_width)

			el = {
				file = short_fn,
				icon = 'file',
				key = shortcut_fn(i),
				action = ':e ' .. fn,
			}
		end
		tbl[i] = el
	end
	return tbl
end

function M.pick_banner()
    math.randomseed(os.time())
    local r = math.random()
    local chafa_ok = vim.fn.executable('chafa') == 1
    if r < 0.1 and chafa_ok then
        return 'soyo'
    elseif r < 0.2 and chafa_ok then
        return 'morts'
    else
        return 'yousoro'
    end
end

return M
