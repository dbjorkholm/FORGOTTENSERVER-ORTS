function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.uid == 3164 then
		local player = Player(cid)
		if player:getStorageValue(Storage.ChildrenoftheRevolution.Questline) == 9 then
			player:setStorageValue(Storage.ChildrenoftheRevolution.Questline, 10)
			player:addItem(10760, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a flask of poison.")
		elseif player:getStorageValue(Storage.ChildrenoftheRevolution.StrangeSymbols) == 2 then
			player:setStorageValue(Storage.ChildrenoftheRevolution.StrangeSymbols, 3)
			player:addItem(11106, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a flask of extra greasy oil.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end