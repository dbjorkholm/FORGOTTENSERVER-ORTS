function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.uid == 2282 then
		local player = Player(cid)
		if player:getStorageValue(362) < 1 then
			player:setStorageValue(362, 1)
			player:addItem(2075, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a fanfare.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif item.uid == 2283 then
		local player = Player(cid)
		if player:getStorageValue(363) < 1 then
			player:setStorageValue(363, 1)
			local key = player:addItem(2092, 1)
			key:setActionId(3520)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a key.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end
