function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 1945) then
		doRemoveItem(getTileItemById({x = 32849, y = 32282, z = 10}, 1304).uid, 1)
		doSendMagicEffect({x = 32849, y = 32282, z = 10}, CONST_ME_EXPLOSIONAREA)
		doTransformItem(item.uid, 1946)
	end
	return true
end