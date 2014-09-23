function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player, cStorage = Player(cid), Storage.hiddenCityOfBeregar.BrownMushrooms
	if player:getStorageValue(cStorage) ~= 1 then
		player:addItem(2789, 10)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found 10 brown mushrooms.")
		player:setStorageValue(cStorage, 1)
	end
	return true
end
