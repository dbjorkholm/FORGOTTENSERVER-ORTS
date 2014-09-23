function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player, cStorage = Player(cid), Storage.QuestChests.SixRubiesQuest
	if player:getStorageValue(cStorage) ~= 1 then
		player:setStorageValue(cStorage, 1)
		player:addItem(2147, 6)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found 6 small rubies.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The " .. ItemType(item.itemid):getName() .. " is empty.")
	end
	return true
end
