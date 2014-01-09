function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 4863) then
		if(itemEx.itemid == 2913 and getPlayerStorageValue(cid, 90) == 45) then
			setPlayerStorageValue(cid, 90, 46)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
			doTransformItem(item.uid, 4864)
			doRemoveItem(itemEx.uid, 1)
		end
	end
	return true
end