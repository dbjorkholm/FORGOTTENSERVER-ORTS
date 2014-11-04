function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 63 then
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 64)
		player:addItem(6124, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a damaged logbook.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	return true
end
