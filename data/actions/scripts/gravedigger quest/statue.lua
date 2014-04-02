function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 4636 then
		local player = Player(cid)
		if player:getStorageValue(9964) == 1 and player:getStorageValue(9965) < 1 then
			player:setStorageValue(9965,1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<BOOOOOOOONGGGGGG> A slow throbbing, like blood pulsing, runs through the floor.')
			player:getPosition():sendMagicEffect(CONST_ME_SOUND_GREEN)
		end
	end
	return true
end