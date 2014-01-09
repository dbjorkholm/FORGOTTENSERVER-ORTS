function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 12328) then
		doRemoveItem(item.uid, 1)
		setPlayerStorageValue(cid, 1084, 1)
	end
	return true
end