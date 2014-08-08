function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		Creature(cid):teleportTo(fromPosition)
		return true
	end

	if player:getStorageValue(1084) ~= 1 then
		player:teleportTo(fromPosition)
		return true
	end

	player:teleportTo(Position(33243, 31237, 10))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
