function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if item.uid == 2243 and item.itemid == 1387 then
		player:teleportTo(Position(32857, 32234, 11))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		Item(item.uid):transform(2249)
	end
	return true
end
