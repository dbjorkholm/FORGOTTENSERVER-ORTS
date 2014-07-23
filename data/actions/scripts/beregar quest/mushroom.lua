function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)

	if player:getStorageValue(item.uid) ~= 1 then
		player:addItem(2789, 10)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found 10 brown mushrooms.")
		player:setStorageValue(item.uid, 1)
	end
	return true
end
