function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player, cStorage = Player(cid), Storage.QuestChests.DeeperFibulaKey
	if player:getStorageValue(cStorage) ~= 1 then
		local key = player:addItem(2091, 1)
		if key then
			key:setActionId(3980)
		end
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key.")
		player:setStorageValue(cStorage, 1)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The small hole is empty.")
	end
	return true
end