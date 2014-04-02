function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 4633 then
		local player = Player(cid)
		if player:getStorageValue(9957) == 1 and player:getStorageValue(9959) < 1 then
			player:setStorageValue(9959, 1)
			player:addItem(21406, 1)
			Item(item.uid):remove()
		end
	end
	return true
end