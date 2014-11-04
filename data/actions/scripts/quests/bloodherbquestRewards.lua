function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if player:getStorageValue(Storage.BloodHerbQuest) ~= 1  then
		player:setStorageValue(Storage.BloodHerbQuest, 1)
		player:addItem(2798, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a Blood Herb.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The tree is empty.")
	end
	return true
end
