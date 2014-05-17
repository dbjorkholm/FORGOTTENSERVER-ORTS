local cfg_raids = 
{
	--Weekly
	["Monday"] = 
	{
		["08:00"] = {
			raidName = "RatsThais",
			alreadyExecuted = false
		},
		["15:00"] = {
			raidName = "Arachir the Ancient One",
			alreadyExecuted = false
		},
	},
	["Wednesday"] = 
	{
		["12:00"] = {
			raidName = "OrcsThais",
			alreadyExecuted = false
		},
	},
	--Monthly
	--month/day
	["31/10"] = 
	{
		["16:00"] = {
			raidName = "Halloween Hare",
			alreadyExecuted = false
		},
	},
}

function onThink(interval, lastExecution, thinkInterval)
	local day = os.date("%A", os.time())
	if cfg_raids[day] ~= nil then
		local tableD = cfg_raids[day][getRealTime()]
		if tableD ~= nil then
			if not tableD.alreadyExecuted then
				Game.startRaid(tableD.raidName)
				tableD.alreadyExecuted  = true
			end
		end
	elseif cfg_raids[getRealDate()] ~= nil then
		local tableM = cfg_raids[getRealDate()][getRealTime()]
		if tableM ~= nil then
			if not tableM.alreadyExecuted then
				Game.startRaid(tableM.raidName)
				tableM.alreadyExecuted  = true
			end
		end
	end
	return true
end