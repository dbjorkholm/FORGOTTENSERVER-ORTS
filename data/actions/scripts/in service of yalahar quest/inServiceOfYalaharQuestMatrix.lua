function onUse(cid, item, fromPosition, itemEx, toPosition)
	if((itemEx.itemid == 7915 or itemEx.itemid == 7916) and itemEx.actionid == 100) then
		if(item.itemid == 9744) then
			setPlayerStorageValue(cid, 9, 1)
			doRemoveItem(item.uid, 1)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
			doCreatureSay(cid, "The machine was activated.", TALKTYPE_ORANGE_1)
			setPlayerStorageValue(cid, 30, 46)
		elseif(item.itemid == 9743) then
			setPlayerStorageValue(cid, 9, 2)
			doRemoveItem(item.uid, 1)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
			doCreatureSay(cid, "The machine was activated.", TALKTYPE_ORANGE_1)
			setPlayerStorageValue(cid, 30, 46)
		end
	end
	return true
end