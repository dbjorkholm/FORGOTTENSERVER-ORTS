function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:isPremium() then
		return true
	end

	position.x = position.x + 2
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:teleportTo(position)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'Only premium users have access to this area.')
	return true
end