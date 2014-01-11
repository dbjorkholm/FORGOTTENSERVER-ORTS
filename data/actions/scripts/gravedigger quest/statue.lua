function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9964) == 1) and (getPlayerStorageValue(cid, 9965) < 1) then
		if(itemEx.aid == 4636) then
			setPlayerStorageValue(cid,9965,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, '<BOOOOOOOONGGGGGG> A slow throbbing, like blood pulsing, runs through the floor.')
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_SOUND_GREEN)
		end
	end
	return true
end