function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(item.uid == 3084) then
		if(player:getStorageValue(678) < 1) then
			player:setStorageValue(678, 1)
			player:addItem(9744, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a matrix.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3085) then
		if(player:getStorageValue(678) < 1) then
			player:setStorageValue(678, 1)
			player:addItem(9743, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a matrix.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end