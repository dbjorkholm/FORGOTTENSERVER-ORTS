function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if player:getStorageValue(Storage.QuestChests.DeeperFibulaKey) ~= 1 then
		local key = player:addItem(2091, 1)
		if key then
			key:setActionId(3980)
		end
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key.")
		player:setStorageValue(Storage.QuestChests.DeeperFibulaKey, 1)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The small hole is empty.")
	end
	return true
end