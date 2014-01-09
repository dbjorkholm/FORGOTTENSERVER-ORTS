function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 9733 and isInArray({1786, 1787, 1788, 1789, 1790, 1791, 1792, 1793, 9911}, itemEx.itemid)) then
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, 15)
		doCreatureSay(cid, "You burned the alchemist formula.", TALKTYPE_ORANGE_1)
	end
	return true
end