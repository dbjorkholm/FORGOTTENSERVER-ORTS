function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.uid == 3018 and item.itemid == 7281) then
		if(getPlayerStorageValue(cid, 90) == 60) then
			setPlayerStorageValue(cid, 90, 61)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
		end
	end
	return true
end