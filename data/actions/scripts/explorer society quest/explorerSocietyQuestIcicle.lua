function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if itemEx.itemid == 4995 and itemEx.uid == 3000 and player:getStorageValue(90) == 5 then
		player:setStorageValue(90, 6)
		player:addItem(4848, 1)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	end
	return true
end