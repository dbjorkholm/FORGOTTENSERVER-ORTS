function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local player, cStorage = player, Storage.hiddenCityOfBeregar.BrownMushrooms
	if player:getStorageValue(cStorage) ~= 1 then
		player:addItem(2789, 10)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found 10 brown mushrooms.")
		player:setStorageValue(cStorage, 1)
	end
	return true
end
