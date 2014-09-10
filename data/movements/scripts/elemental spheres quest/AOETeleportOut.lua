function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	player:teleportTo(Position(33265, 31838, 10))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	for i = 10005, 10008 do
		player:setStorageValue(i, -1)
	end
	return true
end
