function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return false
	end
	if player:getStorageValue(50013) < 1 then
		player:setStorageValue(50013, 1)
		player:teleportTo({x = 32266, y = 31849, z = 15}, false)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		Game.createMonster("Ghost", {x = 32276, y = 31902, z = 13}, false, true)
		Game.createMonster("Ghost", {x = 32274, y = 31902, z = 13}, false, true)
		Game.createMonster("Demon Skeleton", {x = 32276, y = 31904, z = 13}, false, true)
	else
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end
