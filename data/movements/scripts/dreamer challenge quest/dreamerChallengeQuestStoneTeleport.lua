function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return false
	end

	player:teleportTo(Position(32920, 32296, 13))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
 	Tile(Position(32873, 32263, 14)):getItemById(1946):transform(1945)
	Tile(position):getItemById(1387):transform(1355)
	Tile(Position(32874, 32263, 14)):getItemById(3733):transform(3729)
	Tile(Position(32875, 32263, 14)):getItemById(3734):transform(3730)
	Tile(Position(32874, 32264, 14)):getItemById(3735):transform(3731)
	Tile(Position(32875, 32264, 14)):getItemById(3736):transform(3732)
	return true
end
