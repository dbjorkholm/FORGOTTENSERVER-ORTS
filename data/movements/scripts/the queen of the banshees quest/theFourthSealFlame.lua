function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return false
	end
	if player:getStorageValue(50016) < 1 then	
		local Tile = Position({x = 32243, y = 31892, z = 14}):getTile()
		if Tile then
			local thing = Tile:getItemById(2016, 2)
			if thing and thing:isItem() then
				thing:remove()
				player:setStorageValue(50016, 1)
				player:teleportTo({x = 32261, y = 31849, z = 15}, false)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			else
				player:teleportTo(fromPosition, true)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			end
		end
	else
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end