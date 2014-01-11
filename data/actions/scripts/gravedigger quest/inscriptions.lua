function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9921) == 1) and (getPlayerStorageValue(cid, 9922) < 1) then
		if item.aid == 4651 or item.aid == 4652 or item.aid == 4653 then
			setPlayerStorageValue(cid,9922,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'The words seem to breathe, stangely. One word stays in your mind: bronze')
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_ENERGYHIT)
		end
	end
	if (getPlayerStorageValue(cid, 9922) == 1) and (getPlayerStorageValue(cid, 9923) < 1) then
		if item.aid == 4652 or item.aid == 4652 or item.aid == 4653 then
			setPlayerStorageValue(cid,9923,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'The words seem to glow slightly. A name fixes in your mind: Takesha Antishu')
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_ENERGYHIT)
		end
	end
	if (getPlayerStorageValue(cid, 9923) == 1) and (getPlayerStorageValue(cid, 9924) < 1) then
		if item.aid == 4651 or item.aid == 4652 or item.aid == 4653 then
			setPlayerStorageValue(cid,9924,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'The words seem to flutter. One word stays in your mind: floating')
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_ENERGYHIT)
		end
	end
	return true
end