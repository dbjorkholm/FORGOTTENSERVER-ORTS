function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	if not isPlayerInArea(Position(33235, 31801, 12), Position(33299, 31867, 12)) then
		Game.setStorageValue(10004)
	end

	player:teleportTo(Position(33265, 31838, 10))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	for i = 10005, 10008 do
		player:setStorageValue(i)
	end
	return true
end
