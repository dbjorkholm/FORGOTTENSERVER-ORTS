function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if player:getStorageValue(Storage.QuestChests.BlackKnightTreeKey) ~= 1 then
		local key = player:addItem(2088, 1)
		key:setActionId(5010)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key.")
		player:setStorageValue(Storage.QuestChests.BlackKnightTreeKey, 1)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The dead tree is empty.")
	end
	return true
end