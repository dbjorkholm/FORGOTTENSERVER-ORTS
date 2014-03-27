local config = {
	["Monday"] = {{x=32209, y=31158, z=7}},
	["Tuesday"] = {{x=32290, y=32831, z=7}},
	["Wednesday"] = {{x=32579, y=32754, z=7}},
	["Thursday"] = {{x=33066, y=32880, z=6}},
	["Friday"] = {{x=33239, y=32483, z=7}},
	["Saturday"] = {{x=33171, y=31810, z=6}},
	["Sunday"] = {{x=32326, y=31783, z=6}}
}

local day = true --Should it spawn as real tibia?
function onStartup()
	if(day) then
		doCreateNpc("Rashid", config[os.date("%A")])
	else
		for _, i in pairs(config) do
			doCreateNpc("Rashid", i)
		end
	end
return true
end
