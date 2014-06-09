function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	if player:getStorageValue(1015) == 25 then
		player:setStorageValue(12139, 2) --Questlog, The New Frontier Quest "Mission 09: Mortal Combat"
		player:setStorageValue(1015, 26)
	end
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:teleportTo({x = 33064, y = 31028, z = 7})
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	Game.setStorageValue(12139, Game.getStorageValue(12139) + 1)
	if Game.getStorageValue(12139) == 3 then
		Game.setStorageValue(12139, -1)
		portaltile = Tile(position)
		portaltile:getItemById(1387):remove()
		clearArena({x = 33064, y = 31030, z = 3}, {x = 33085, y = 31050, z = 3})
	end
	return true
end


