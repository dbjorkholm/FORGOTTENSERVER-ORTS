local config = {
    ["Monday"] = {pos = {x=32209, y=31158, z=7}},
    ["Tuesday"] = {pos = {x=32290, y=32831, z=7}},
    ["Wednesday"] = {pos = {x=32579, y=32754, z=7}},
    ["Thursday"] = {pos = {x=33066, y=32880, z=6}},
    ["Friday"] = {pos = {x=33239, y=32483, z=7}},
    ["Saturday"] = {pos = {x=33171, y=31810, z=6}},
    ["Sunday"] = {pos = {x=32326, y=31783, z=6}}
}

local day = false --Should it spawn as real tibia?
function onStartup()
	if(day) then
		doCreateNpc("Rashid", config[os.date("%A")].pos)
	else
		for x, i in pairs(config) do
			doCreateNpc("Rashid", i.pos)
		end
	end
return true
end
