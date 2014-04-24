function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(360) < 1 then
		player:setStorageValue(360, 1)
		player:addItem(3956, 2)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found two elephant tusks.")
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
	end
	return true
end