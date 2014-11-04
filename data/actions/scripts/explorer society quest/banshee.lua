function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 49 then
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 50)
		player:addItem(4847, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a spectral dress.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	return true
end
