function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(item.uid == 12125) then
		if(player:getStorageValue(320) < 1) then
			player:setStorageValue(320, 1)
			player:addItem(4850, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a hydra egg.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The nest is empty.")
		end
	end
	return true
end
