function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(item.uid) ~= 1 then
		local key = player:addItem(2091, 1)
		key:setActionId(3980)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a key.")
		player:setStorageValue(item.uid, 1)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The small hole is empty.")
	end
	return true
end