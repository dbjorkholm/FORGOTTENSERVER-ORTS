function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getLevel() >= 2 then
		return true
	end

	position.y = position.y + 2
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:teleportTo(position)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You need level 2 to get access to this area.')
	return true
end