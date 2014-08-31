function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if player:getStorageValue(Storage.hiddenCityOfBeregar.PythiusTheRotten) == 2 then
		player:setStorageValue(Storage.hiddenCityOfBeregar.PythiusTheRotten, 1)
		player:teleportTo(Position(32600, 31396, 14))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end
