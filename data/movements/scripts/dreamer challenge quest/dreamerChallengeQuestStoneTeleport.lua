local config = {
	{position = Position(32873, 32263, 14), itemId = 1946, transformId = 1945},
	{position = Position(32874, 32263, 14), itemId = 3733, transformId = 3729},
	{position = Position(32875, 32263, 14), itemId = 3734, transformId = 3730},
	{position = Position(32874, 32264, 14), itemId = 3735, transformId = 3731},
	{position = Position(32875, 32264, 14), itemId = 3736, transformId = 3732}
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return false
	end

	player:teleportTo(Position(32920, 32296, 13))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	Item(item.uid):transform(1355)
	local thing
	for i = 1, #config do
		thing = Tile(config[i].position):getItemById(config[i].itemId)
		if thing then
			thing:transform(config[i].transformId)
		end
	end
	return true
end