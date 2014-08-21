function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(90) == 27 then
		player:setStorageValue(90, 28)
		player:addItem(4858, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a funeral urn.")
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have already received the funeral urn.")
	end
	return true
end