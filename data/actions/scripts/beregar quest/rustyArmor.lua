function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)

	if player:getStorageValue(item.uid) ~= 1 then
		player:addItem(9809, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a rusty armor.")
		player:setStorageValue(item.uid, 1)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The skeleton is empty.")
	end
	return true
end
