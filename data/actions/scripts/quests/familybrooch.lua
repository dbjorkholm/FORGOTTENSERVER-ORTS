function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(Storage.QuestChests.FamilyBrooch) ~= 1 then
		player:setStorageValue(Storage.QuestChests.FamilyBrooch, 1)
		player:addItem(2318, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a family brooch.')
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The ' .. ItemType(item.itemid):getName() .. ' is empty.')
	end
	return true
end
