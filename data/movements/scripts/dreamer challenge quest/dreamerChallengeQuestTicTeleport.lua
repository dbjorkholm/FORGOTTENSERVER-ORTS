function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return false
	end

	Tile(Position(32836, 32288, 14)):getItemById(1387):transform(6299)
	Tile(Position(32834, 32285, 14)):getItemById(1946):transform(1945)
	player:teleportTo(Position(32874, 32275, 14))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
