local config = {
	{position = Position(32836, 32288, 14), itemId = 1387, transformId = 6299},
	{position = Position(32834, 32285, 14), itemId = 1946, transformId = 1945}
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return false
	end

	local thing
	for i = 1, #config do
		thing = Tile(config[i].position):getItemById(config[i].itemId)
		if thing then
			thing:transform(config[i].transformId)
		end
	end
	player:teleportTo(Position(32874, 32275, 14))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
