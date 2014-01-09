function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.itemid == 4995 and itemEx.uid == 3000 and item.itemid == 4856 and getPlayerStorageValue(cid, 90) == 5) then
		setPlayerStorageValue(cid, 90, 6)
		doPlayerAddItem(cid, 4848, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
	end
	return true
end