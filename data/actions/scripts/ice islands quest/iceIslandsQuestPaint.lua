function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.itemid == 7178 and item.itemid == 7253) then
		if(getPlayerStorageValue(cid, 121) == 8) then
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
			setPlayerStorageValue(cid, 123, getPlayerStorageValue(cid, 123) < 1 and 1 or getPlayerStorageValue(cid, 123) + 1)
			if(getPlayerStorageValue(cid, 123) == 3) then
				setPlayerStorageValue(cid, 121, 9)
			end
			doCreatureSay(cid, "You painted a baby seal.", TALKTYPE_ORANGE_1)
			doTransformItem(itemEx.uid, 7252)
			addEvent(doSendMagicEffect, 30 * 1000, toPosition, CONST_ME_MAGIC_GREEN)
			addEvent(doTransformItem, 30 * 1000, itemEx.uid, 7178)
		end
	end
	return true
end