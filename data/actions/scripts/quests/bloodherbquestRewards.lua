function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(50032) ~= 1  then
		player:setStorageValue(50032, 1)
		player:addItem(2798, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a Blood Herb.")
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The tree is empty.")
	end
	return true
end
