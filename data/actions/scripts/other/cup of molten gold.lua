function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 2700 then 
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 13539,1)
		doSendMagicEffect(toPosition, CONST_ME_EXPLOSIONAREA)
	end
	return true
end