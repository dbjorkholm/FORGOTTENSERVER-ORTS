function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9929) == 1) and (getPlayerStorageValue(cid, 9930) < 1) then
		if(item.aid == 4662) then
			setPlayerStorageValue(cid,9930,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'Somebody left a card. It says: Looking for the scroll? Come find me. Take the stairs next to the students. Dorm.')
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		end
	end
	return true
end