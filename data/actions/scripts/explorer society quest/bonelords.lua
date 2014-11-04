function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 30 then
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 31)
		player:addItem(4857, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a wrinkled parchment.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	return true
end
