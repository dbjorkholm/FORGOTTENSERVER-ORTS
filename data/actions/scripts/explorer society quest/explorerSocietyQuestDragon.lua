function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(90) == 57 then
		player:setStorageValue(90, 58)
		Game.createItem(7314, 1, player:getPosition())
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	end
	return true
end