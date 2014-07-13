function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local targetItem = Item(itemEx.actionid)
	if not targetItem then
		return true
	end
	
	if player:getStorageValue(Storage.DeeperBanuta.Shortcut) == 0 and targetItem == 62378 then
		player:removeItem(10523, 1)
		player:setStorageValue(Storage.DeeperBanuta.Shortcut, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You discovered a secret tunnel.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already discovered this secret.")
	end
	return true
end
