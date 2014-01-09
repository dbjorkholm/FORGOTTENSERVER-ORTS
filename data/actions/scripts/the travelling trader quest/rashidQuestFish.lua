function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 5928 and itemEx.itemid == 5554) then
		if(getPlayerStorageValue(cid, 85) == 17 or getPlayerStorageValue(cid, 85) == 18) then
			doTransformItem(item.uid, 8766)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
			doCreatureSay(cid, "You catch a golden fish in the bowl.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end