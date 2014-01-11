function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9985) == 1) and (getPlayerStorageValue(cid, 9986) < 1) then
		if(item.aid == 4650) then
			setPlayerStorageValue(cid,9986,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, '<sizzle> <fizz>')
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_ENERGYHIT)
		end
	end
	return true
end