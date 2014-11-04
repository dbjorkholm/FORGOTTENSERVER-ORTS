function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if player:getStorageValue(Storage.QuestChests.SixRubiesQuest) ~= 1 then
		player:setStorageValue(Storage.QuestChests.SixRubiesQuest, 1)
		player:addItem(2147, 6)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found 6 small rubies.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The " .. ItemType(item.itemid):getName() .. " is empty.")
	end
	return true
end
