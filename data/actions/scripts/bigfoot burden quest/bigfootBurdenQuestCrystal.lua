function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.itemid == 18307) then
		if(getPlayerStorageValue(cid, 930) == 1) then
			if(getPlayerStorageValue(cid, 932) < 5) then
				setPlayerStorageValue(cid, 932, getPlayerStorageValue(cid, 932) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have repaired a damaged crystal.")
				doTransformItem(itemEx.uid, 18311)
				doSendMagicEffect(toPosition, CONST_ME_ENERGYHIT)
			end
		end
	elseif(itemEx.itemid == 18311) then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "It's not the crystal you're looking for.")
	end
	return true
end