function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)

	player:teleportTo(Position(32767, 32366, 15))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
