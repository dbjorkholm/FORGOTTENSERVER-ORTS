function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if itemEx.itemid == 4138 and player:getStorageValue(90) == 16 then
		player:setStorageValue(90, 17)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		Item(item.uid):transform(4870)
		Item(itemEx.uid):remove()
	elseif itemEx.itemid == 4149 and player:getStorageValue(90) == 19 then
		player:setStorageValue(92, 20)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		Item(item.uid):transform(4871)
		Item(itemEx.uid):remove()
	elseif itemEx.itemid == 4242 and player:getStorageValue(90) == 24 then
		player:setStorageValue(93, 25)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		Item(item.uid):transform(4872)
		Item(itemEx.uid):remove()
	elseif itemEx.itemid == 5659 then
		player:setStorageValue(93, 25)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		Item(item.uid):transform(5937)
	end
	return true
end