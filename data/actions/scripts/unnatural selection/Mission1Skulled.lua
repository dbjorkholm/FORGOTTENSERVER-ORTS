function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(Storage.UnnaturalSelection.Mission01) == 1 then
		player:setStorageValue(Storage.UnnaturalSelection.Mission01, 2) -- The Ape City Questlog - Mission 6: Witches' Cap Spot
		player:addItem(11076, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a Holy Skull.")
	end
	return true
end
