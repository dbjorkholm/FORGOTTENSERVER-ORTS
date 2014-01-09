function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 18213 and itemEx.itemid == 18484) then
		if(getPlayerStorageValue(cid, 934) < 7 and getPlayerStorageValue(cid, 933) == 1) then
			setPlayerStorageValue(cid, 934, getPlayerStorageValue(cid, 934) + 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You gathered a spark.")
			doTransformItem(itemEx.uid, 18485)
			doSendMagicEffect(toPosition, CONST_ME_POFF)
		end
	end
	return true
end