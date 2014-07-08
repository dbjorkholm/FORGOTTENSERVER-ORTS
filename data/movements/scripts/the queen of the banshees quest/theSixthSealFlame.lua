local function doCheckCampfires(cpPos, itemid)
	local Tile = Position(cpPos):getTile()
	if Tile then
		local thing = Tile:getItemById(itemid)
		if thing and thing:isItem() then
			return true
		else
			return false
		end
	end
end

local config = {
	[1] = {pos = {x = 32309, y = 31975, z = 13}, cpId = 1421},
	[2] = {pos = {x = 32309, y = 31976, z = 13}, cpId = 1421},
	[3] = {pos = {x = 32311, y = 31975, z = 13}, cpId = 1421},
	[4] = {pos = {x = 32311, y = 31976, z = 13}, cpId = 1421},
	[5] = {pos = {x = 32313, y = 31975, z = 13}, cpId = 1423},
	[6] = {pos = {x = 32313, y = 31976, z = 13}, cpId = 1423}
}

function onStepIn(cid, item, position, fromPosition)
	local campfiresDone = 0
	local player = Player(cid)
	if not player then
		return false
	end
	if player:getStorageValue(50014) < 1 then
		for i = 1, 6 do
			if doCheckCampfires(config[i].pos, config[i].cpId) then
				campfiresDone = campfiresDone + 1
			end
		end
		if campfiresDone == 6 then
			player:setStorageValue(50014, 1)
			player:teleportTo({x = 32261, y = 31856, z = 15}, false)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(fromPosition, true)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end			
	else
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end
