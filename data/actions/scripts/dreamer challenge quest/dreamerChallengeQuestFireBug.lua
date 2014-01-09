function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.uid == 2243 and item.itemid == 5468) then
		doTransformItem(itemEx.uid, 1387)
		doSendMagicEffect(toPosition, CONST_ME_FIREAREA)
		doRemoveItem(item.uid, 1)
	end
	return true
end
