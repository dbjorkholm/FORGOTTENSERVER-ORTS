function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9928) == 1) and (getPlayerStorageValue(cid, 9929) < 1) then
		if(itemEx.aid == 4661) then
			setPlayerStorageValue(cid,9929,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'An invisible hand pulls you inside.')
			doTeleportThing(cid,{x = 33011, y = 32392, z = 10})
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		end
	end
	if (getPlayerStorageValue(cid, 9930) == 1) and (getPlayerStorageValue(cid, 9931) < 1) then
		if(itemEx.aid == 4661) then
			setPlayerStorageValue(cid,9931,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'Get out of my room!')
			doTeleportThing(cid,{x = 33008, y = 32392, z = 10})
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		end
	end
	return true
end