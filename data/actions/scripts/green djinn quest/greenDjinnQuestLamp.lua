function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2285) then
		if(getPlayerStorageValue(cid, 81) == 10 and doPlayerRemoveItem(cid, 2344, 1)) then
			setPlayerStorageValue(cid, 81, 11)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
			doPlayerAddItem(cid,2356,1)

		end
	end
	return true
end