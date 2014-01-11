function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9957) == 1) and (getPlayerStorageValue(cid, 9959) < 1) then
		if(itemEx.aid == 4633) then
			setPlayerStorageValue(cid,9959,1)
			doRemoveItem(item.uid)
			doPlayerAddItem(cid,21406,1)
		end
	end
	return true
end