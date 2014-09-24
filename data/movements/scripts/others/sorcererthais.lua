local exitPosition = Position(32308, 32267, 7)

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if player:getVocation():getBase():getId() == 1 then
		return true
	end

	player:teleportTo(exitPosition)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	return true
end