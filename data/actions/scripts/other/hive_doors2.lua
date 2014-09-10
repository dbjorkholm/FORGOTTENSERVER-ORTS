function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	toPosition.x = player:getPosition().x > toPosition.x and toPosition.x - 1 or toPosition.x + 1
	player:teleportTo(toPosition)
	toPosition:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end