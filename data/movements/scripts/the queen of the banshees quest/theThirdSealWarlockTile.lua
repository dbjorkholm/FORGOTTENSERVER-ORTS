function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then
		return false
	end
	if player:getStorageValue(50017) < 1 then
		player:setStorageValue(50017, 1)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		Game.createMonster("Warlock", {x = 32215, y = 31835, z = 15}, false, true)
		Game.createMonster("Warlock", {x = 32215, y = 31840, z = 15}, false, true)
	end	
	return true
end
