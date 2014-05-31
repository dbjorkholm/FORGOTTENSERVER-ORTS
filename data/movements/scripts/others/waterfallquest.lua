local config = {
	swimmingPosition = Position(32968, 32626, 5),
	caveEntrancePosition = Position(32968, 32631, 8),
	caveExitPosition = Position(32971, 32620, 8)
}

function onStepIn(cid, item, pos, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	-- Jumping off the mountain edge into the water / onto water edge
	if pos.x == 32966 and pos.y == 32626 and pos.z == 5 then
		player:teleportTo(config.swimmingPosition)
		config.swimmingPosition:sendMagicEffect(CONST_ME_WATERSPLASH)

	-- Splash effect when jumping down the waterfall
	elseif pos.x == 32968 and pos.y == 32630 and pos.z == 7 then
		Position(pos):sendMagicEffect(CONST_ME_WATERSPLASH)

	-- Teleport when entering the waterfall / cave
	elseif pos.x == 32968 and pos.y == 32629 and pos.z == 7 then
		player:teleportTo(config.caveEntrancePosition)
		player:setDirection(SOUTH)

	-- Leaving the cave through teleport
	elseif pos.x == 32967 and pos.y == 32630 and pos.z == 8 then
		player:teleportTo(config.caveExitPosition)
		player:setDirection(EAST)
	end
	return true
end
