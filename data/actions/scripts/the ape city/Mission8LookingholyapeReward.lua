function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(Storage.TheApeCity.Mission08) == 1 then
		player:setStorageValue(Storage.TheApeCity.Mission08, 2) -- The Ape City Questlog - Mission 8: Looking for a hair of holy ape
		player:addItem(4843, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a Giant Ape's Hair.")
	end
	return true
end
