function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	player:teleportTo(Position(32766, 32275, 14))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
end