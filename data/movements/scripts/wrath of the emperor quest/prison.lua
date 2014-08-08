function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if player:getStorageValue(1067) == 1 then
		player:teleport(Position(33363, 31188, 8))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:setStorageValue(1067, 0)
		-- doSetCreatureOutfit(cid, {lookType = 352}, 1) -- adjust to meta
	end
	return true
end
