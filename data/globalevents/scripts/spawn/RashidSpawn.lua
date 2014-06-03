local config = {
	['Monday'] = {x=32209, y=31158, z=7},
	['Tuesday'] = {x=32290, y=32831, z=7},
	['Wednesday'] = {x=32579, y=32754, z=7},
	['Thursday'] = {x=33066, y=32880, z=6},
	['Friday'] = {x=33239, y=32483, z=7},
	['Saturday'] = {x=33171, y=31810, z=6},
	['Sunday'] = {x=32326, y=31783, z=6}
}

-- Should Rashid spawn as real tibia?
local spawnByDay = true

function onStartup()
	if spawnByDay then
		Game.createNpc('Rashid', config[os.date('%A')])
	else
		for _, position in pairs(config) do
			Game.createNpc('Rashid', position)
		end
	end

	return true
end
