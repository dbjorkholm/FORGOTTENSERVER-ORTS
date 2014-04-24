function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(335) < 1 then
		player:setStorageValue(335, 1)
		player:addItem(12559, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a silver rune emblem.")
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
	end
	return true
end
