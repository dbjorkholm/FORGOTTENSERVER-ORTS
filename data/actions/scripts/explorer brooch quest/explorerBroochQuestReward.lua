function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(361) < 1 then
		player:setStorageValue(361, 1)
		player:addItem(4873, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found an explorer's brooch.")
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
	end
	return true
end