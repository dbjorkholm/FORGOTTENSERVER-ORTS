function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 27 then
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 28)
		player:addItem(4858, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a funeral urn.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already received the funeral urn.")
	end
	return true
end