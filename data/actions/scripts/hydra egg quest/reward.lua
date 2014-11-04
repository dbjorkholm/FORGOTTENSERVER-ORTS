function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if player:getStorageValue(Storage.HydraEggQuest) ~= 1 then
		player:setStorageValue(Storage.HydraEggQuest, 1)
		player:addItem(4850, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a hydra egg.')
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The nest is empty.')
	end
	return true
end
