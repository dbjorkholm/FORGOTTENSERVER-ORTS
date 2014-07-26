function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 18339 and itemEx.itemid == 18341) then
		if(getPlayerStorageValue(cid, 940) < 3 and getPlayerStorageValue(cid, 939) == 1) then
			setPlayerStorageValue(cid, 940, getPlayerStorageValue(cid, 940) + 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "The little pig happily eats the truffles.")
			doTransformItem(itemEx.uid, 18340)
			doSendMagicEffect(toPosition, CONST_ME_POFF)
		end
	end
	return true
end