function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 4865) then
		if(itemEx.itemid == 4313 and getPlayerStorageValue(cid, 90) == 11) then -- blue butterfly
			setPlayerStorageValue(cid, 90, 12)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
			doTransformItem(item.uid, 4866)
			doRemoveItem(itemEx.uid, 1)
		elseif(itemEx.itemid == 4313 and getPlayerStorageValue(cid, 90) == 14) then -- red butterfly
			setPlayerStorageValue(cid, 92, 15)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
			doTransformItem(item.uid, 4867)
			doRemoveItem(itemEx.uid, 1)
		elseif(itemEx.itemid == 4313 and getPlayerStorageValue(cid, 90) == 8) then -- purple butterfly
			setPlayerStorageValue(cid, 93, 9)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
			doTransformItem(item.uid, 4868)
			doRemoveItem(itemEx.uid, 1)
		end
	end
	return true
end