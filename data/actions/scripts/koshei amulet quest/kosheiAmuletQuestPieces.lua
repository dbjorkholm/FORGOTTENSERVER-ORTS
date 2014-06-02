function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(item.uid == 3062) then
		if(player:getStorageValue(475) < 1) then
			player:setStorageValue(475, 1)
			player:addItem(8262, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a piece of an amulet.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3063) then
		if(player:getStorageValue(476) < 1) then
			player:setStorageValue(476, 1)
			player:addItem(8263, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a piece of an amulet.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3064) then
		if(player:getStorageValue(477) < 1) then
			player:setStorageValue(477, 1)
			player:addItem(8264, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a piece of an amulet.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3065) then
		if(player:getStorageValue(478) < 1) then
			player:setStorageValue(478, 1)
			player:addItem(8265, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a piece of an amulet.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end