function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if itemEx.itemid == 4313 and player:getStorageValue(90) == 11 then -- blue butterfly
		player:setStorageValue(90, 12)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		Item(item.uid):transform(4866)
		Item(itemEx.uid):remove()
	elseif itemEx.itemid == 4313 and player:getStorageValue(90) == 14 then -- red butterfly
		player:setStorageValue(92, 15)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		Item(item.uid):transform(4867)
		Item(itemEx.uid):remove()
	elseif itemEx.itemid == 4313 and player:getStorageValue(90) == 8 then -- purple butterfly
		player:setStorageValue(93, 9)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		Item(item.uid):transform(4868)
		Item(itemEx.uid):remove()
	end
	return true
end