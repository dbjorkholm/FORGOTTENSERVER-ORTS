function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9981) == 1) and (getPlayerStorageValue(cid, 9982) < 1) then
		if(itemEx.aid == 4646) then
			setPlayerStorageValue(cid,9982,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, '<sizzle> <fizz>')
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_ENERGYHIT)
		end
	end
	if (getPlayerStorageValue(cid, 9982) == 1) and (getPlayerStorageValue(cid, 9983) < 1) then
		if(itemEx.aid == 4647) then
			setPlayerStorageValue(cid,9983,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, '<sizzle> <fizz>')
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_ENERGYHIT)
		end
	end
	if (getPlayerStorageValue(cid, 9983) == 1) and (getPlayerStorageValue(cid, 9984) < 1) then
		if(itemEx.aid == 4648) then
			setPlayerStorageValue(cid,9984,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, '<sizzle> <fizz>')
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_ENERGYHIT)
		end
	end
	if (getPlayerStorageValue(cid, 9984) == 1) and (getPlayerStorageValue(cid, 9985) < 1) then
		if(itemEx.aid == 4649) then
			setPlayerStorageValue(cid,9985,1)
			doRemoveItem(item.uid,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, '<sizzle> <fizz>')
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_ENERGYHIT)
		end
	end
	return true
end