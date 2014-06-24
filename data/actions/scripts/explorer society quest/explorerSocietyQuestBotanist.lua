function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetItem = Item(itemEx.uid)
	local item = Item(item.uid)
	local player = Player(cid)
	if item.itemid == 4869 then
		if itemEx.itemid == 4138 and player:getStorageValue(90) == 16 then
			player:setStorageValue(90, 17)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			item:transform(4870)
			targetItem:remove()
		elseif itemEx.itemid == 4149 and player:getStorageValue(90) == 19 then
			player:setStorageValue(92, 20)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			item:transform(4871)
			targetItem:remove()
		elseif itemEx.itemid == 4242 and player:getStorageValue(90) == 24 then
			player:setStorageValue(93, 25)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			item:transform(4872)
			targetItem:remove()
		elseif itemEx.itemid == 5659 then
			player:setStorageValue(93, 25)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
			item:transform(5937)
		end
	end
	return true
end
