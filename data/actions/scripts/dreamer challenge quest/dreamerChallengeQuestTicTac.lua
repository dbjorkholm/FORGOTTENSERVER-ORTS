function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 1945) then
		doTransformItem(item.uid, 1946)
		doSendMagicEffect({x = 32838, y = 32264, z = 14}, CONST_ME_MAGIC_BLUE)
		doCreateItem(2638, 1, {x = 32838, y = 32264, z = 14})
		doCreateItem(2639, 1, {x = 32838, y = 32264, z = 14})
	else
		doTransformItem(item.uid, 1945)
	end
	return true
end