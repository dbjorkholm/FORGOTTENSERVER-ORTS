function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetItem = Item(itemEx.uid)
	local item = Item(item.uid)
	local player = Player(cid)
	if item.itemid == 4865 then
		if itemEx.itemid == 4313 and player:getStorageValue(90) == 11 then -- blue butterfly
			player:setStorageValue(90, 12)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			item:transform(4866)
			targetItem:remove()
		elseif itemEx.itemid == 4313 and player:getStorageValue(90) == 14 then -- red butterfly
			player:setStorageValue(92, 15)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			item:transform(4867)
			targetItem:remove()
		elseif itemEx.itemid == 4313 and player:getStorageValue(90) == 8 then -- purple butterfly
			player:setStorageValue(93, 9)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			item:transform(4868)
			targetItem:remove()
		end
	end
	return true
end
