local destination = {
	[4121] = {pos = {x = 32801, y = 31766, z = 9}, storage = 1, crystal = true},
	[3220] = {pos = {x = 32627, y = 31863, z = 11}, storage = 1, crystal = true},
	[3128] = {pos = {x = 33000, y = 31870, z = 13}, storage = 14},
	[3129] = {pos = {x = 32795, y = 31762, z = 10}, storage = 14},
	[3130] = {pos = {x = 32864, y = 31844, z = 11}, storage = 15},
	[3131] = {pos = {x = 32803, y = 31746, z = 10}, storage = 15},
	[3132] = {pos = {x = 32986, y = 31862, z = 9}, storage = 15}, -- Gnomebase Alpha
	[3133] = {pos = {x = 32796, y = 31781, z = 10}, storage = 15}, -- City
	[3134] = {pos = {x = 32959, y = 31953, z = 9}, storage = 16}, -- Golems
	[3135] = {pos = {x = 33001, y = 31915, z = 9}, storage = 16}, -- Gnomebase Alpha
	[3136] = {pos = {x = 32904, y = 31894, z = 13}, storage = 16},
	[3137] = {pos = {x = 32979, y = 31907, z = 9}, storage = 16},
	[35669] = {pos = {x = 32986, y = 31864, z = 9}, storage = 1}, -- leave warzone 3 
	[3215] = {pos = {x = 32369, y = 32241, z = 7}, storage = 1, crystal = true},
	[3216] = {pos = {x = 32212, y = 31133, z = 7}, storage = 1, crystal = true},
	[3217] = {pos = {x = 32317, y = 32825, z = 7}, storage = 1, crystal = true},
	[3218] = {pos = {x = 33213, y = 32454, z = 1}, storage = 1, crystal = true},
	[3219] = {pos = {x = 33217, y = 31814, z = 8}, storage = 1, crystal = true}
}

function onStepIn(cid, item, position, lastPosition)
	local v = destination[item.actionid]
	local p = Player(cid)
	local c = Creature(cid)
	local crystalID = 18457 -- Teleport crystal id
	if(p) then
		if(v) then
			if(p:getStorageValue(900) >= v.storage) then
				if(v.crystal == true) then
					if(p:getItemCount(crystalID) >= 1) then
						c:teleportTo(v.pos)
						c:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
						doPlayerRemoveItem(cid, crystalID, 1)
					else
						c:teleportTo(lastPosition)
						p:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need a teleport crystal to use this device.")
					end
				else
					c:teleportTo(v.pos)
					c:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				end
			else
				if(v.storage == 2) then
					p:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have no idea on how to use this device. Xelvar in Kazordoon might tell you more about it.")	
				else
					c:teleportTo(lastPosition)
					p:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Sorry, you haven't got access to use this teleport!")
				end
			end
		end
	end
return true
end
