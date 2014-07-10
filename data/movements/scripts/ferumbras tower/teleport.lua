local pos = {
	Position(32113, 32682, 5),
	Position(32113, 32692, 5),
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return false
	end

	for i = 1, #pos do
		if Tile(pos[i]):getItemById(1946) then
			player:teleportTo(fromPosition)
			return true
		end
	end
	player:teleportTo(Position(32121, 32693, 4))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
