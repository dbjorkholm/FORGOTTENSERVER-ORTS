function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local position = player:getPosition()
	if position.x == toPosition.x then
		return false
	end

	toPosition.x = position.x > toPosition.x and toPosition.x - 1 or toPosition.x + 1
	player:teleportTo(toPosition)
	toPosition:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
