function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return false
	end

	if player:getStorageValue(9005) < 1 then
		player:setStorageValue(9005, 1)
	end
	player:teleportTo() -- MISSING: we're missing a position to teleport to here
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
