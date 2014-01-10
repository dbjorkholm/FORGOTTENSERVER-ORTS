local config = {
    ["Monday"] = {pos = {x=32209, y=31158, z=7}}, -- DankWart - Svargrond

    ["Tuesday"] = {pos = {x=32290, y=32831, z=7}}, -- Lyonel - Liberty Bay

    ["Wednesday"] = {pos = {x=32579, y=32754, z=7}}, -- Clyde - Port Hope

    ["Thursday"] = {pos = {x=33066, y=32880, z=6}}, -- Arito - Ankrahmun

    ["Friday"] = {pos = {x=33239, y=32483, z=7}}, -- Miraia - Darishia

    ["Saturday"] = {pos = {x=33171, y=31810, z=6}}, -- Mirabell - Edron

    ["Sunday"] = {pos = {x=32326, y=31783, z=6}} -- Carlin Depot 2floor
}

local day = false --Should it spawn as real tibia?
 
function onStartup()
	if day then
		doCreateNpc("Rashid", config[os.date("%A")].pos)
	else
		doCreateNpc("Rashid", config["Monday"].pos)
        	doCreateNpc("Rashid", config["Tuesday"].pos)
        	doCreateNpc("Rashid", config["Wednesday"].pos)
        	doCreateNpc("Rashid", config["Thursday"].pos)
        	doCreateNpc("Rashid", config["Friday"].pos)
        	doCreateNpc("Rashid", config["Saturday"].pos)
        	doCreateNpc("Rashid", config["Sunday"].pos)
	end
	return true
end
