function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if player:getStorageValue(9005) < 2 then
		player:teleportTo(fromPosition)
	elseif player:getStorageValue(9005) == 2 then
		player:teleportTo() -- MISSING: we need a position to teleport to here
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:setStorageValue(9005, 1)
	end
	return true
end
