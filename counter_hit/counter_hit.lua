local t_valuename = {
	counter = {
		{itemname = 'counter_off', displayname = "Off"}, -- 0
		{itemname = 'counter_p1', displayname = "P1"}, -- 1
		{itemname = 'counter_p2', displayname = "P2"}, -- 2
		{itemname = 'counter_both', displayname = "Both"}, -- 3
	},
}

local t_itemname = {
	-- Counter
	['counter'] = function(t, item, cursorPosY, moveTxt, sec)
		if menu.f_valueChanged(t.items[item], sec) then
			player(2)
			mapSet('_iksys_CounterCustom', menu.counter - 1)
		end
		return true
	end,
}

local t_vardisplay = {
	['counter'] = function()
		return menu.t_valuename.counter[menu.counter or 1].displayname
	end,
}

for k, v in pairs(t_valuename) do
	if menu.t_valuename[k] == nil then
		menu.t_valuename[k] = v
	end
end

for k, v in pairs(t_itemname) do
	if menu.t_itemname[k] == nil then
		menu.t_itemname[k] = v
	end
end

for k, v in pairs(t_vardisplay) do
	if menu.t_vardisplay[k] == nil then
		menu.t_vardisplay[k] = v
	end
end

local mods = gameOption("Common.States")

table.insert(mods, "external/mods/counter_hit/counter_hit.zss")

modifyGameOption("Common.States", mods)