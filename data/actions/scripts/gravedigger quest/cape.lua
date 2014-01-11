function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9935) == 1) and (getPlayerStorageValue(cid, 9936) < 1) then
			setPlayerStorageValue(cid,9936,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You now look like a Necromancer.')
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			doPlayerRemoveItem(cid,21464,1)
		end
	return true
	end