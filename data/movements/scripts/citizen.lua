local t = {
	[9056] = {id = 4},
	[9057] = {id = 2},
	[9058] = {id = 1},
	[9059] = {id = 5},
	[9060] = {id = 3},
	[9061] = {id = 10},
	[9062] = {id = 9},
	[9063] = {id = 11},
	[9064] = {id = 7},
	[9065] = {id = 8},
	[9066] = {id = 12},
	[9067] = {id = 13},
	[9068] = {id = 14},
	[9240] = {id = 28},
	[9500] = {id = 29}
}
function onStepIn(cid, item, position, fromPosition)
	local town = Town(t[item.uid].id)
	local player = Player(cid)
	if player then
		if t[item.uid] then
			if town:getId() == 12 and player:getStorageValue(Storage.BarbarianTest.Questline) < 8 then
				player:sendTextMessage(MESSAGE_STATUS_WARNING, "You first need to absolve the Barbarian Test Quest to become citizen!")
				player:teleportTo(town:getTemplePosition())
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				return false
			end
			player:setTown(town)
			player:teleportTo(town:getTemplePosition())
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are now a citizen of "..town:getName()..".")	
		end
	end
	return true
end