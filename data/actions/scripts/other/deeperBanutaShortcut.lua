function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	
	if player:getStorageValue(Storage.DeeperBanutaShortcut) ~= 1 and itemEx.actionid == 62378 then
		player:removeItem(10523, 1)
		player:setStorageValue(Storage.DeeperBanutaShortcut, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You discovered a secret tunnel.")
	elseif itemEx.actionid == 62378 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already discovered this secret.")
	end
	return true
end
