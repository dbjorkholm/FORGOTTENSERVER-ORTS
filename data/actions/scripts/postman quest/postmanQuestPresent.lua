function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3116) then
		if(getPlayerStorageValue(cid, 250) == 10) then
			setPlayerStorageValue(cid, 250, 11)
			doPlayerAddItem(cid, 2331, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a present.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.itemid == 2331) then
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		doCreatureSay(cid, "You open the present.", TALKTYPE_ORANGE_1)
	end
	return true
end