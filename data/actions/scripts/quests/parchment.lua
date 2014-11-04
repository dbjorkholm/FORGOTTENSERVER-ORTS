function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if player:getStorageValue(Storage.QuestChests.ParchmentRoomQuest) ~= 1 then
		local bag = player:addItem(1987, 1)
		if not bag then
			return true
		end

		local items = { {2165}, {2151, 2}, {2230}, {2229}, {1948} }
		for i = 1, #items do
			bag:addItem(items[i][1], items[i][2] or 1)
		end

		local key = bag:addItem(2091, 1)
		if key then
			key:setActionId(6010)
		end

		player:setStorageValue(Storage.QuestChests.ParchmentRoomQuest, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a bag.')
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,  'The ' .. ItemType(item.itemid):getName() .. ' is empty.')
	end
	return true
end
