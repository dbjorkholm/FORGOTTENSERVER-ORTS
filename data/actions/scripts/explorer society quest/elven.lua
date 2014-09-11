function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 36 then
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 37)
		player:addItem(4855, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found an elven poetry book.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	return true
end
