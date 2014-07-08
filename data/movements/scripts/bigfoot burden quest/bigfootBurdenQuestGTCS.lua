local destination = {
	[4121] = {pos = Position(32801, 31766, 9), storage = 1, crystal = true},
	[3220] = {pos = Position(32627, 31863, 11), storage = 1, crystal = true},
	[3128] = {pos = Position(33000, 31870, 13), storage = 14},
	[3129] = {pos = Position(32795, 31762, 10), storage = 14},
	[3130] = {pos = Position(32864, 31844, 11), storage = 15},
	[3131] = {pos = Position(32803, 31746, 10), storage = 15},
	[3132] = {pos = Position(32986, 31862, 9), storage = 15}, -- Gnomebase Alpha
	[3133] = {pos = Position(32796, 31781, 10), storage = 15}, -- City
	[3134] = {pos = Position(32959, 31953, 9), storage = 16}, -- Golems
	[3135] = {pos = Position(33001, 31915, 9), storage = 16}, -- Gnomebase Alpha
	[3136] = {pos = Position(32904, 31894, 13), storage = 16},
	[3137] = {pos = Position(32979, 31907, 9), storage = 16},
	[35669] = {pos = Position(32986, 31864, 9), storage = 1}, -- leave warzone 3 
	[3215] = {pos = Position(32369, 32241, 7), storage = 1, crystal = true},
	[3216] = {pos = Position(32212, 31133, 7), storage = 1, crystal = true},
	[3217] = {pos = Position(32317, 32825, 7), storage = 1, crystal = true},
	[3218] = {pos = Position(33213, 32454, 1), storage = 1, crystal = true},
	[3219] = {pos = Position(33217, 31814, 8), storage = 1, crystal = true}
}

function onStepIn(cid, item, position, lastPosition)
	local aid = destination[item.actionid]
	local player = Player(cid)
	if player ~= nil then
		if aid then
			if player:getStorageValue(900) >= aid.storage then
				if aid.crystal == true then
					if player:getItemCount(18457) >= 1 then
						player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
						player:teleportTo(aid.pos)
						player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
						player:removeItem(18457, 1)
					else
						player:teleportTo(lastPosition)
						player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need a teleport crystal to use this device.")
					end
				else
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					player:teleportTo(aid.pos)
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				end
			else
				if aid.storage == 2 then
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have no idea on how to use this device. Xelvar in Kazordoon might tell you more about it.")	
				else
					player:teleportTo(lastPosition)
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Sorry, you haven't got access to use this teleport!")
				end
			end
		end
	end
	return true
end
